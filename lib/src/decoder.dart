import 'dart:typed_data';

import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'decoders/object.dart';

class MsgDecoder extends ObjectDecoder {
  factory MsgDecoder(Uint8List b) {
    final mp = MsgPackDecoder(b);
    final id = mp.getInt();
    return MsgDecoder._(id, mp);
  }

  MsgDecoder._(this.id, super._mp);

  final int id;
}