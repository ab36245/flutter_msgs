import 'dart:typed_data';

import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'decode.dart';

class MapDecoder implements ModelMapDecoder {
  MapDecoder(this._mp) :
    length = _mp.getMapLength();

  @override
  final int length;
  
  @override
  ModelArrayDecoder getArray() =>
    decodeArray(_mp);
  
  @override
  bool getBool() =>
    decodeBool(_mp);
  
  @override
  Uint8List getBytes() =>
    decodeBytes(_mp);
  
  @override
  double getFloat() =>
    decodeFloat(_mp);
  
  @override
  int getInt() =>
    decodeInt(_mp);
  
  @override
  String getKey() =>
    decodeString(_mp);
  
  @override
  ModelMapDecoder getMap() =>
    decodeMap(_mp);
  
  @override
  ModelObjectDecoder getObject() =>
    decodeObject(_mp);
  
  @override
  ModelRef getRef() =>
    decodeRef(_mp);
  
  @override
  String getString() =>
    decodeString(_mp);

  @override
  DateTime getTime() =>
    decodeTime(_mp);

  final MsgPackDecoder _mp;
}