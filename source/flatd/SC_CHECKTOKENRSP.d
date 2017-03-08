// automatically generated, do not modify

module flatd.SC_CHECKTOKENRSP;

import flatbuffers;

struct SC_CHECKTOKENRSP {
  mixin Table!SC_CHECKTOKENRSP;

  static SC_CHECKTOKENRSP getRootAsSC_CHECKTOKENRSP(ByteBuffer _bb) {  return SC_CHECKTOKENRSP.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   uint msgId() { int o = __offset(4); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   int retCode() { int o = __offset(6); return o != 0 ? _buffer.get!int(o + _pos) : 0; }
  @property   uint uid() { int o = __offset(8); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   Nullable!string avatar() { int o = __offset(10); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }
  @property   Nullable!string birthday() { int o = __offset(12); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }
  @property   uint gender() { int o = __offset(14); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   Nullable!string mobile() { int o = __offset(16); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }
  @property   Nullable!string nickname() { int o = __offset(18); return o != 0 ? Nullable!string(__string(o + _pos)) : Nullable!string.init; }

  static int createSC_CHECKTOKENRSP(FlatBufferBuilder builder,
      uint msgId,
      int retCode,
      uint uid,
      int avatar,
      int birthday,
      uint gender,
      int mobile,
      int nickname) {
    builder.startObject(8);
    SC_CHECKTOKENRSP.addNickname(builder, nickname);
    SC_CHECKTOKENRSP.addMobile(builder, mobile);
    SC_CHECKTOKENRSP.addGender(builder, gender);
    SC_CHECKTOKENRSP.addBirthday(builder, birthday);
    SC_CHECKTOKENRSP.addAvatar(builder, avatar);
    SC_CHECKTOKENRSP.addUid(builder, uid);
    SC_CHECKTOKENRSP.addRetCode(builder, retCode);
    SC_CHECKTOKENRSP.addMsgId(builder, msgId);
    return SC_CHECKTOKENRSP.endSC_CHECKTOKENRSP(builder);
  }

  static void startSC_CHECKTOKENRSP(FlatBufferBuilder builder) { builder.startObject(8); }
  static void addMsgId(FlatBufferBuilder builder, uint msgId) { builder.addUint(0, msgId, 0); }
  static void addRetCode(FlatBufferBuilder builder, int retCode) { builder.addInt(1, retCode, 0); }
  static void addUid(FlatBufferBuilder builder, uint uid) { builder.addUint(2, uid, 0); }
  static void addAvatar(FlatBufferBuilder builder, int avatarOffset) { builder.addOffset(3, avatarOffset, 0); }
  static void addBirthday(FlatBufferBuilder builder, int birthdayOffset) { builder.addOffset(4, birthdayOffset, 0); }
  static void addGender(FlatBufferBuilder builder, uint gender) { builder.addUint(5, gender, 0); }
  static void addMobile(FlatBufferBuilder builder, int mobileOffset) { builder.addOffset(6, mobileOffset, 0); }
  static void addNickname(FlatBufferBuilder builder, int nicknameOffset) { builder.addOffset(7, nicknameOffset, 0); }
  static int endSC_CHECKTOKENRSP(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

