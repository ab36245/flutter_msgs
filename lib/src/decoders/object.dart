import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'decode.dart';

class ObjectDecoder implements ModelObjectDecoder {
  ObjectDecoder(this._mp);
  
  @override
  ModelArrayDecoder getArray(String name) =>
    decodeArray(_mp);
  
  @override
  bool getBool(String name) =>
    decodeBool(_mp);
  
  @override
  double getFloat(String name) =>
    decodeFloat(_mp);
  
  @override
  int getInt(String name) =>
    decodeInt(_mp);
  
  @override
  ModelMapDecoder getMap(String name) =>
    decodeMap(_mp);
  
  @override
  ModelObjectDecoder getObject(String name) =>
    decodeObject(_mp);
  
  @override
  ModelRef getRef(String name) =>
    decodeRef(_mp);
  
  @override
  String getString(String name) =>
    decodeString(_mp);
  
  @override
  DateTime getTime(String name) =>
    decodeTime(_mp);

  final MsgPackDecoder _mp;
}