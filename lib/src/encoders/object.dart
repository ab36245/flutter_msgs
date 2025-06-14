import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'encode.dart';

class ObjectEncoder implements ModelObjectEncoder {
  ObjectEncoder(this._mp);

  @override
  void putArray(String name, int length, Function(ModelArrayEncoder) handler) =>
    encodeArray(_mp, length, handler);

  @override
  void putDate(String name, DateTime value) =>
    encodeDate(_mp, value);

  @override
  void putInt(String name, int value) =>
    encodeInt(_mp, value);
  
  @override
  void putMap(String name, int length, Function(ModelMapEncoder) handler) =>
    encodeMap(_mp, length, handler);

  @override
  void putObject(String name, Function(ModelObjectEncoder) handler) =>
    encodeObject(_mp, handler);
  
  @override
  void putRef(String name, ModelRef value) =>
    encodeRef(_mp, value);

  @override
  void putString(String name, String value) =>
    encodeString(_mp, value);

  final MsgPackEncoder _mp;
}