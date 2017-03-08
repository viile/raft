// automatically generated, do not modify

module flatd.CS_AUTHREQ;

import flatbuffers;

struct CS_AUTHREQ {
  mixin Table!CS_AUTHREQ;

  static CS_AUTHREQ getRootAsCS_AUTHREQ(ByteBuffer _bb) {  return CS_AUTHREQ.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   uint serviceId() { int o = __offset(4); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   Nullable!string sign() { int o = __offset(6); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }

  static int createCS_AUTHREQ(FlatBufferBuilder builder,
      uint serviceId,
      int sign) {
    builder.startObject(2);
    CS_AUTHREQ.addSign(builder, sign);
    CS_AUTHREQ.addServiceId(builder, serviceId);
    return CS_AUTHREQ.endCS_AUTHREQ(builder);
  }

  static void startCS_AUTHREQ(FlatBufferBuilder builder) { builder.startObject(2); }
  static void addServiceId(FlatBufferBuilder builder, uint serviceId) { builder.addUint(0, serviceId, 0); }
  static void addSign(FlatBufferBuilder builder, int signOffset) { builder.addOffset(1, signOffset, 0); }
  static int endCS_AUTHREQ(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

