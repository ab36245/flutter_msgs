import 'dart:typed_data';

import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

class MsgEncoder extends _ObjectEncoder {
  MsgEncoder() : super(MsgPackEncoder());

  Uint8List get bytes =>
    _mp.bytes;

  set id(int id) =>
    _mp.putInt(id);
}

class _ObjectEncoder implements ModelObjectEncoder {
  _ObjectEncoder(this._mp);

  @override
  void putArray(String name, int length, Function(ModelArrayEncoder target) handler) =>
    _encodeArray(_mp, length, handler);

  @override
  void putDate(String name, DateTime value) =>
    _encodeDate(_mp, value);

  @override
  void putInt(String name, int value) =>
    _encodeInt(_mp, value);

  @override
  void putObject(String name, Function(ModelObjectEncoder target) handler) =>
    _encodeObject(_mp, handler);
  
  @override
  void putRef(String name, ModelRef value) =>
    _encodeRef(_mp, value);

  @override
  void putString(String name, String value) =>
    _encodeString(_mp, value);

  final MsgPackEncoder _mp;
}

class _ArrayEncoder implements ModelArrayEncoder {
  _ArrayEncoder(this._mp, int length) {
    _mp.putArrayLength(length);
  }

  @override
  void putArray(int length, Function(ModelArrayEncoder target) handler) =>
    _encodeArray(_mp, length, handler);

  @override
  void putDate(DateTime value) =>
    _encodeDate(_mp, value);

  @override
  void putInt(int value) =>
    _encodeInt(_mp, value);

  @override
  void putObject(Function(ModelObjectEncoder target) handler) =>
    _encodeObject(_mp, handler);
  
  @override
  void putRef(ModelRef value) =>
    _encodeRef(_mp, value);

  @override
  void putString(String value) =>
    _encodeString(_mp, value);

  final MsgPackEncoder _mp;
}

void _encodeArray(MsgPackEncoder mp, int length, Function(ModelArrayEncoder) handler) {
  handler(_ArrayEncoder(mp, length));
}

void _encodeDate(MsgPackEncoder mp, DateTime value) {
  mp.putTime(value);
}

void _encodeInt(MsgPackEncoder mp, int value) {
  mp.putInt(value);
}

void _encodeObject(MsgPackEncoder mp, Function(ModelObjectEncoder) handler) {
  handler(_ObjectEncoder(mp));
}

void _encodeRef(MsgPackEncoder mp, ModelRef value) {
  mp.putString(value.id);
}

void _encodeString(MsgPackEncoder mp, String value) {
  mp.putString(value);
}
