// automatically generated, do not modify

module flatd.SC_AUTHRSP;

import flatbuffers;

struct SC_AUTHRSP {
  mixin Table!SC_AUTHRSP;

  static SC_AUTHRSP getRootAsSC_AUTHRSP(ByteBuffer _bb) {  return SC_AUTHRSP.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   int retCode() { int o = __offset(4); return o != 0 ? _buffer.get!int(o + _pos) : 0; }

  static int createSC_AUTHRSP(FlatBufferBuilder builder,
      int retCode) {
    builder.startObject(1);
    SC_AUTHRSP.addRetCode(builder, retCode);
    return SC_AUTHRSP.endSC_AUTHRSP(builder);
  }

  static void startSC_AUTHRSP(FlatBufferBuilder builder) { builder.startObject(1); }
  static void addRetCode(FlatBufferBuilder builder, int retCode) { builder.addInt(0, retCode, 0); }
  static int endSC_AUTHRSP(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

