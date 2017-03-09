// automatically generated, do not modify

module flatd.REQ_VOTE;

import flatbuffers;

struct REQ_VOTE {
  mixin Table!REQ_VOTE;

  static REQ_VOTE getRootAsREQ_VOTE(ByteBuffer _bb) {  return REQ_VOTE.init_(_bb.get!int(_bb.position()) + _bb.position(), _bb); }
  @property   ulong term() { int o = __offset(4); return o != 0 ? _buffer.get!ulong(o + _pos) : 0; }
  @property   uint candidateId() { int o = __offset(6); return o != 0 ? _buffer.get!uint(o + _pos) : 0; }
  @property   ulong lastLogIndex() { int o = __offset(8); return o != 0 ? _buffer.get!ulong(o + _pos) : 0; }
  @property   ulong lastLogTerm() { int o = __offset(10); return o != 0 ? _buffer.get!ulong(o + _pos) : 0; }

  static int createREQ_VOTE(FlatBufferBuilder builder,
      ulong term,
      uint candidateId,
      ulong lastLogIndex,
      ulong lastLogTerm) {
    builder.startObject(4);
    REQ_VOTE.addLastLogTerm(builder, lastLogTerm);
    REQ_VOTE.addLastLogIndex(builder, lastLogIndex);
    REQ_VOTE.addTerm(builder, term);
    REQ_VOTE.addCandidateId(builder, candidateId);
    return REQ_VOTE.endREQ_VOTE(builder);
  }

  static void startREQ_VOTE(FlatBufferBuilder builder) { builder.startObject(4); }
  static void addTerm(FlatBufferBuilder builder, ulong term) { builder.addUlong(0, term, 0); }
  static void addCandidateId(FlatBufferBuilder builder, uint candidateId) { builder.addUint(1, candidateId, 0); }
  static void addLastLogIndex(FlatBufferBuilder builder, ulong lastLogIndex) { builder.addUlong(2, lastLogIndex, 0); }
  static void addLastLogTerm(FlatBufferBuilder builder, ulong lastLogTerm) { builder.addUlong(3, lastLogTerm, 0); }
  static int endREQ_VOTE(FlatBufferBuilder builder) {
    int o = builder.endObject();
    return o;
  }
}

