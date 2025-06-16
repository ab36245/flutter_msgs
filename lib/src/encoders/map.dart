import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'encode.dart';

class MapEncoder implements ModelMapEncoder {
  MapEncoder(this._mp, this.length) {
    _mp.putMapLength(length);
  }

  @override
  final int length;

  @override
  ModelArrayEncoder putArray(int length) =>
    encodeArray(_mp, length);

  @override
  void putDate(DateTime value) =>
    encodeDate(_mp, value);

  @override
  void putInt(int value) =>
    encodeInt(_mp, value);
  
  @override
  ModelMapEncoder putMap(int length) =>
    encodeMap(_mp, length);

  @override
  ModelObjectEncoder putObject() =>
    encodeObject(_mp);
  
  @override
  void putRef(ModelRef value) =>
    encodeRef(_mp, value);

  @override
  void putString(String value) =>
    encodeString(_mp, value);

  final MsgPackEncoder _mp;
}