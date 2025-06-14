import 'package:flutter_model/flutter_model.dart';
import 'package:flutter_msgpack/flutter_msgpack.dart';

import 'decode.dart';

class ArrayDecoder implements ModelArrayDecoder {
  ArrayDecoder(this._mp) :
    length = _mp.getArrayLength();

  @override
  final int length;
  
  @override
  ModelArrayDecoder getArray() =>
    decodeArray(_mp);
  
  @override
  DateTime getDate() =>
    decodeDate(_mp);
  
  @override
  int getInt() =>
    decodeInt(_mp);
  
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

  final MsgPackDecoder _mp;
}