import 'dart:typed_data';

import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

class MsgDecoder extends _ObjectDecoder {
  MsgDecoder(Uint8List b) : super(MsgPackDecoder(b)) {
    id = _mp.getInt();
  }

  late final int id;
}

class _ObjectDecoder implements ModelObjectDecoder {
  _ObjectDecoder(this._mp);
  
  @override
  ModelArrayDecoder getArray(String name) =>
    _decodeArray(_mp);
  
  @override
  DateTime getDate(String name) =>
    _decodeDate(_mp);
  
  @override
  int getInt(String name) =>
    _decodeInt(_mp);
  
  @override
  ModelObjectDecoder getObject(String name) =>
    _decodeObject(_mp);
  
  @override
  ModelRef getRef(String name) =>
    _decodeRef(_mp);
  
  @override
  String getString(String name) =>
    _decodeString(_mp);

  final MsgPackDecoder _mp;
}

class _ArrayDecoder implements ModelArrayDecoder {
  _ArrayDecoder(this._mp) :
    length = _mp.getArrayLength();

  @override
  final int length;
  
  @override
  ModelArrayDecoder getArray() =>
    _decodeArray(_mp);
  
  @override
  DateTime getDate() =>
    _decodeDate(_mp);
  
  @override
  int getInt() =>
    _decodeInt(_mp);
  
  @override
  ModelObjectDecoder getObject() =>
    _decodeObject(_mp);
  
  @override
  ModelRef getRef() =>
    _decodeRef(_mp);
  
  @override
  String getString() =>
    _decodeString(_mp);

  final MsgPackDecoder _mp;
}

_ArrayDecoder _decodeArray(MsgPackDecoder mp) =>
  _ArrayDecoder(mp);

DateTime _decodeDate(MsgPackDecoder mp) =>
  mp.getTime();

int _decodeInt(MsgPackDecoder mp) =>
  mp.getInt();

_ObjectDecoder _decodeObject(MsgPackDecoder mp) =>
  _ObjectDecoder(mp);

ModelRef _decodeRef(MsgPackDecoder mp) =>
  ModelRef(mp.getString());

String _decodeString(MsgPackDecoder mp) =>
  mp.getString();
