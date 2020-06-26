import 'package:flutter/cupertino.dart';

/// Flavor
///
/// DEV : 開発環境
/// QA : ステージング環境
/// PROD : 本番環境
enum Flavor { DEV, QA, PROD }

/// 環境ごとに分けたい変数等を定義する
class FlavorValues {
  final String baseUrl;

  FlavorValues({@required this.baseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig(
      {@required Flavor flavor, @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, flavor.toString(), values);
    return _instance;
  }
  FlavorConfig._internal(this.flavor, this.name, this.values);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PROD;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isQA() => _instance.flavor == Flavor.QA;
}
