import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'encode.dart';

class ObjectEncoder implements ModelObjectEncoder {
  ObjectEncoder(this._mp);

  @override
  ModelArrayEncoder putArray(String name, int length) =>
    encodeArray(_mp, length);

  @override
  void putBool(String name, bool value) =>
    encodeBool(_mp, value);

  @override
  void putFloat(String name, double value) =>
    encodeFloat(_mp, value);

  @override
  void putInt(String name, int value) =>
    encodeInt(_mp, value);
  
  @override
  ModelMapEncoder putMap(String name, int length) =>
    encodeMap(_mp, length);

  @override
  ModelObjectEncoder putObject(String name) =>
    encodeObject(_mp);
  
  @override
  void putRef(String name, ModelRef value) =>
    encodeRef(_mp, value);

  @override
  void putString(String name, String value) =>
    encodeString(_mp, value);

  @override
  void putTime(String name, DateTime value) =>
    encodeTime(_mp, value);

  final MsgPackEncoder _mp;
}