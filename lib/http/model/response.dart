import 'package:baselib/constant/lib_config.dart';

import '../net_exception.dart';

class AppResponse<T> {
  int _code = 0;

  int get code => _code;

  T? _data;

  T? get data => _data;

  String _msg = "";

  String get msg => _msg;

  bool get ok => _code == LibConfig.net_ok_code;

  AppResponse.ok(T? data, {int? code, msg = ""}) {
    this._data = data;
    this._code = code ?? LibConfig.net_ok_code;
    this._msg = msg;
  }

  AppResponse.exception(NetException e) {
    this._code = e.code;
    this._msg = e.message;
  }

/*
  AppResponse.fromJson(Map<String, dynamic> json) {
    this._code = json['code'];
    this._data = json['data'];
    this._msg = json['msg'];
  }*/

  Map<String, dynamic> toJson() => {'code': code, 'data': data, 'msg': msg};
}