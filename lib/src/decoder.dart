import 'dart:typed_data';

import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'decoders/object.dart';

class MsgDecoder extends ObjectDecoder {
  factory MsgDecoder(Uint8List bytes) {
    final mp = MsgPackDecoder(bytes);
    final id = mp.getInt();
    return MsgDecoder._(id, mp);
  }

  final int id;

  MsgDecoder._(this.id, super._mp);
}