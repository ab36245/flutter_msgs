import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'array.dart';
import 'map.dart';
import 'object.dart';

ArrayDecoder decodeArray(MsgPackDecoder mp) =>
  ArrayDecoder(mp);

bool decodeBool(MsgPackDecoder mp) =>
  mp.getBool();

double decodeFloat(MsgPackDecoder mp) =>
  mp.getFloat();

int decodeInt(MsgPackDecoder mp) =>
  mp.getInt();

MapDecoder decodeMap(MsgPackDecoder mp) =>
  MapDecoder(mp);

ObjectDecoder decodeObject(MsgPackDecoder mp) =>
  ObjectDecoder(mp);

ModelRef decodeRef(MsgPackDecoder mp) =>
  ModelRef(mp.getString());

String decodeString(MsgPackDecoder mp) =>
  mp.getString();

DateTime decodeTime(MsgPackDecoder mp) =>
  mp.getTime();
