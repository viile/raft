// automatically generated, do not modify

module flatd.RES_VOTE;

import flatbuffers;

struct RES_VOTE {
  mixin Table!RES_VOTE;

  static RES_VOTE getRootAsRES_VOTE(ByteBuffer _bb) {  return RES_VOTE.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   ulong term() { int o = __offset(4); return o != 0 ? _buffer.get!ulong(o + _pos) : 0; }
  @property   uint voteGranted() { int o = __offset(6); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }

  static int createRES_VOTE(FlatBufferBuilder builder,
      ulong term,
      uint voteGranted) {
    builder.startObject(2);
    RES_VOTE.addTerm(builder, term);
    RES_VOTE.addVoteGranted(builder, voteGranted);
    return RES_VOTE.endRES_VOTE(builder);
  }

  static void startRES_VOTE(FlatBufferBuilder builder) { builder.startObject(2); }
  static void addTerm(FlatBufferBuilder builder, ulong term) { builder.addUlong(0, term, 0); }
  static void addVoteGranted(FlatBufferBuilder builder, uint voteGranted) { builder.addUint(1, voteGranted, 0); }
  static int endRES_VOTE(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

