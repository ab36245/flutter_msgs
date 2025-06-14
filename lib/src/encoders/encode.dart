import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'array.dart';
import 'map.dart';
import 'object.dart';

void encodeArray(MsgPackEncoder mp, int length, Function(ModelArrayEncoder) handler) {
  handler(ArrayEncoder(mp, length));
}

void encodeDate(MsgPackEncoder mp, DateTime value) {
  mp.putTime(value);
}

void encodeInt(MsgPackEncoder mp, int value) {
  mp.putInt(value);
}

void encodeMap(MsgPackEncoder mp, int length, Function(ModelMapEncoder) handler) {
  handler(MapEncoder(mp, length));
}

void encodeObject(MsgPackEncoder mp, Function(ModelObjectEncoder) handler) {
  handler(ObjectEncoder(mp));
}

void encodeRef(MsgPackEncoder mp, ModelRef value) {
  mp.putString(value.id);
}

void encodeString(MsgPackEncoder mp, String value) {
  mp.putString(value);
}
