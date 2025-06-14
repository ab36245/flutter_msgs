import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'encode.dart';

class MapEncoder implements ModelMapEncoder {
  MapEncoder(this._mp, int length) {
    _mp.putMapLength(length);
  }

  @override
  void putArray(int length, Function(ModelArrayEncoder) handler) =>
    encodeArray(_mp, length, handler);

  @override
  void putDate(DateTime value) =>
    encodeDate(_mp, value);

  @override
  void putInt(int value) =>
    encodeInt(_mp, value);
  
  @override
  void putKey(String value) =>
    encodeString(_mp, value);
  
  @override
  void putMap(int length, Function(ModelMapEncoder) handler) =>
    encodeMap(_mp, length, handler);

  @override
  void putObject(Function(ModelObjectEncoder) handler) =>
    encodeObject(_mp, handler);
  
  @override
  void putRef(ModelRef value) =>
    encodeRef(_mp, value);

  @override
  void putString(String value) =>
    encodeString(_mp, value);

  final MsgPackEncoder _mp;
}