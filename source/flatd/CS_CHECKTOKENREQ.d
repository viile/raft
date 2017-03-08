// automatically generated, do not modify

module flatd.CS_CHECKTOKENREQ;

import flatbuffers;

struct CS_CHECKTOKENREQ {
  mixin Table!CS_CHECKTOKENREQ;

  static CS_CHECKTOKENREQ getRootAsCS_CHECKTOKENREQ(ByteBuffer _bb) {  return CS_CHECKTOKENREQ.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   uint msgId() { int o = __offset(4); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   uint appId() { int o = __offset(6); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   uint uid() { int o = __offset(8); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   Nullable!string token() { int o = __offset(10); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }
  @property   Nullable!string phoneNum() { int o = __offset(12); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }

  static int createCS_CHECKTOKENREQ(FlatBufferBuilder builder,
      uint msgId,
      uint appId,
      uint uid,
      int token,
      int phoneNum) {
    builder.startObject(5);
    CS_CHECKTOKENREQ.addPhoneNum(builder, phoneNum);
    CS_CHECKTOKENREQ.addToken(builder, token);
    CS_CHECKTOKENREQ.addUid(builder, uid);
    CS_CHECKTOKENREQ.addAppId(builder, appId);
    CS_CHECKTOKENREQ.addMsgId(builder, msgId);
    return CS_CHECKTOKENREQ.endCS_CHECKTOKENREQ(builder);
  }

  static void startCS_CHECKTOKENREQ(FlatBufferBuilder builder) { builder.startObject(5); }
  static void addMsgId(FlatBufferBuilder builder, uint msgId) { builder.addUint(0, msgId, 0); }
  static void addAppId(FlatBufferBuilder builder, uint appId) { builder.addUint(1, appId, 0); }
  static void addUid(FlatBufferBuilder builder, uint uid) { builder.addUint(2, uid, 0); }
  static void addToken(FlatBufferBuilder builder, int tokenOffset) { builder.addOffset(3, tokenOffset, 0); }
  static void addPhoneNum(FlatBufferBuilder builder, int phoneNumOffset) { builder.addOffset(4, phoneNumOffset, 0); }
  static int endCS_CHECKTOKENREQ(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

