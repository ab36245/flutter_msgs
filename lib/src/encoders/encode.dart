import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'array.dart';
import 'map.dart';
import 'object.dart';

ModelArrayEncoder encodeArray(MsgPackEncoder mp, int length) =>
  ArrayEncoder(mp, length);

void encodeDate(MsgPackEncoder mp, DateTime value) =>
  mp.putTime(value);

void encodeInt(MsgPackEncoder mp, int value) =>
  mp.putInt(value);

ModelMapEncoder encodeMap(MsgPackEncoder mp, int length) =>
  MapEncoder(mp, length);

ModelObjectEncoder encodeObject(MsgPackEncoder mp) =>
  ObjectEncoder(mp);

void encodeRef(MsgPackEncoder mp, ModelRef value) {
  mp.putString(value.id);
}

void encodeString(MsgPackEncoder mp, String value) {
  mp.putString(value);
}
