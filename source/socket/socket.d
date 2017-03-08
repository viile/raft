module socket.sockethandler;

import std.stdio;
import std.socket;
import std.experimental.logger.core;

import core.sys.posix.netdb;
import core.sys.posix.sys.un : sockaddr_un;
import core.sys.posix.fcntl;
import core.sys.posix.unistd;
import core.sys.posix.arpa.inet;
import core.sys.posix.netinet.in_;
import core.sys.posix.sys.time;
import core.stdc.errno;

/**
 * 定义定义服务的状态
 */
enum SERVICE_STATUS
{
    CONNECTED,
    CONNECTING,
    ERROR/**this is supported to closed*/,
    BLOCK/**the connection is blocked*/,
    CLOSING,
    CLOSED,
    IDLE
}

/**
 * class: socket
 * author: liumao
 */
class SocketHandler
{
    this (string domain, ushort port)
    {
	auto addr = getAddress(domain);
	_addr = new InternetAddress(addr[0].toAddrString(), port);
	assert(_addr !is null);

	_socketfd = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.IP);
	block = true;
	reuseAddr = true;
	connect();
    }

    ~this ()
    {
	if (_socketfd !is null)
	{
	    _socketfd.close();
	    _socketfd.destroy();
	}

	if (_addr !is null)
	{
	    _addr.destroy();
	}
    }

    /**
     * function: 连接到远端
     * @return void 标注库的函数返回值就是void
     * @para toAddr 远端地址对象
     */
    void connect ()
    {
	if (_socketfd is null) 
	{
	    trace("CollieDB socketfd is null");
	    _serviceStatus = SERVICE_STATUS.ERROR;
	    return;
	}

	try
	{
	    _socketfd.connect(_addr);
	}
	catch (Exception e)
	{
	    trace("CollieDB connect failure:: ", e.msg);
	}
	_serviceStatus = SERVICE_STATUS.CONNECTED;
    }


    /**
     * function: 阻塞读取socket的数据
     * @return ptrdiff_t 数据的长度
     * @para ref ubyte[] buffer 存放数据的buffer
     *       SocketFlags socketFlag 读取数据的方式
     */
    ptrdiff_t recv (ref ubyte[] buffer, SocketFlags socketFlag = SocketFlags.NONE)
    {
	ptrdiff_t length = -1;	
	do
	{
	    length = _socketfd.receive(buffer, socketFlag);
	    if (length == 0)
	    {
		trace("CollieDB socket closed when recv");
		_serviceStatus = SERVICE_STATUS.ERROR;
		break;
	    }
	    else if (length < 0)
	    {
		if (errno == EWOULDBLOCK || errno == EAGAIN || errno == EINTR)
		{
		    continue;
		}
		else
		{
		    _serviceStatus = SERVICE_STATUS.ERROR;
		    break;
		}
	    }
	    else
	    {
		break;
	    }
	} while (true);
	return length;
    }

    /**
     * function: 阻塞写入socket数据
     * @return ptrdiff_t 数据的长度
     * @para const ubyte[] buffer 要写入的buffer
     *       SocketFlags socketFlag 读取数据的方式
     */
    ptrdiff_t send (const ubyte[] buffer, SocketFlags socketFlag = SocketFlags.NONE)
    {
	trace("CollieDB send:: ", buffer);
	ptrdiff_t length = -1;
	ptrdiff_t sentLen = 0;
	do
	{
	    void[] toSend = cast(void[])buffer[sentLen .. $];
	    length = _socketfd.send(toSend, socketFlag);
	    if (length == 0)
	    {
		trace("CollieDB socket Closed when write");
		_serviceStatus = SERVICE_STATUS.ERROR;
		break;
	    }
	    else if (length < 0)
	    {
		if (errno == EWOULDBLOCK || errno == EAGAIN || errno == EINTR)
		{
		    continue;
		}
		else
		{
		    _serviceStatus = SERVICE_STATUS.ERROR;
		    break;
		}
	    }
	    else
	    {
		sentLen += length;
	    }

	    if (sentLen >= buffer.length) break;
	} while (true);
	return sentLen;
    }

    protected:
    @property block ()
    {
	return _socketfd.blocking();
    }

    @property block (bool yes)
    {
	_socketfd.blocking(yes);
    }

    @property reuseAddr ()
    {
	int result;
	_socketfd.getOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, result);
	return cast(bool)result;
    }

    @property reuseAddr (bool yes)
    {
	_socketfd.setOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, yes == true ? 1 : 0);
    }

    public:
    @property serviceStatus ()
    {
	return _serviceStatus;
    }

    @property serviceStatus (SERVICE_STATUS status)
    {
	_serviceStatus = status;
    }

    private:
    Socket _socketfd = null;

    /**
     * 保存collieDB的host+port
     */
    Address _addr = null;

    /*保存socket连接的状态*/
    SERVICE_STATUS _serviceStatus = SERVICE_STATUS.IDLE;
}

unittest
{
    ushort port = 8040;
    auto socketHandler = new SocketHandler("notice.putao.com", port);
    socketHandler.connect();
    ubyte[] testData = cast(ubyte[])"test data for db";
    ptrdiff_t length = socketHandler.send(testData);
    writeln("has writed length:: ", length);
}

