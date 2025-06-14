import 'dart:typed_data';

import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'encoders/object.dart';

class MsgEncoder extends ObjectEncoder {
  factory MsgEncoder() {
    final mp = MsgPackEncoder();
    return MsgEncoder._(mp);
  }

  Uint8List get bytes =>
    _mp.bytes;

  set id(int id) =>
    _mp.putInt(id);

  MsgEncoder._(this._mp) : super(_mp);
  
  final MsgPackEncoder _mp;
}