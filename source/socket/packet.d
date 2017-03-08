module socket.packet;

import std.bitmanip;
import std.experimental.logger.core;
import core.stdc.string;

/**
 * function: packet反序列化
 * @return int 返回反序列化成功的参数的个数
 * @para ref ubyte[] buffer, T... args 不定参数
 */
int unPacket (T...) (ref ubyte[] buffer, ref T args)
{
    int unPacketSize = 0;
    int unPacketPos = 0;

    /// 判断不定参数的长度是否大于0
    static if (T.length <= 0)
    {
	trace("unPacket args's length <= 0");
	return 0;
    }
    else 
    {
	/// 根据buffer解析形参（能解析多少时多少）
	foreach (ref arg; args)
	{
	    alias A = typeof(arg);
	    static if (is(A == int) || 
		    is(A == uint) ||
		    is(A == ushort) ||
		    is(A == short) ||
		    is(A == bool))
	    {
		if ((unPacketPos + A.sizeof) > buffer.length) break;
		
		/// 初始化要unpacket的数据
		ubyte[A.sizeof] tData = buffer[unPacketPos .. unPacketPos + A.sizeof];
		arg = littleEndianToNative!A(tData);
		unPacketPos += A.sizeof;
		unPacketSize++;
	    }
	    else
	    {
		assert("unPacket doesn't support that type");
		break;
	    }
	}
    }
    return unPacketSize;
}

/**
 * function: packet的序列化
 * @return int 返回序列化成功的参数的个数
 * @para ref ubyte[] packetedBuf 保存进buffer, T... args 不定参数
 */
int packet (T...) (ref ubyte[] packetBuf, ref T args)
{
    int packetSize = 0;
    int packetPos = 0;

    /// 判断不定参数的长度是否大于0
    static if (T.length <= 0)
    {
	trace("packet args's length <= 0");
    }
    else
    {
	/// 根据不定参数组成buf
	foreach(ref arg; args)
	{
	    alias A = typeof(arg);
	    static if (is(A == int) || 
		    is(A == uint) ||
		    is(A == ushort) ||
		    is(A == short) ||
		    is(A == bool))
	    {
		if ((packetPos + A.sizeof) > packetBuf.length) break;

		/// 对形参进行赋值
		ubyte[A.sizeof] tData = nativeToLittleEndian!A(arg);
		memcpy(packetBuf.ptr + packetPos, tData.ptr, A.sizeof);
		packetPos += A.sizeof;
		packetSize++;
	    }
	    else
	    {
		assert("packet doesn't support that type");
		break;
	    }
	}
    }
    return packetSize;
}
