# flutter-flavor-demo
開発環境ごとにビルド設定を行う

## 手順

### (１) Flavorクラスを定義する

参考サイト
https://medium.com/flutter-community/flutter-ready-to-go-e59873f9d7de

パッケージを利用してもよい。
https://pub.dev/packages/flutter_flavor


```
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

```

### (２) 環境ごとに、エントリーポイント(main.dart)を定義する。

#### 開発環境

```
import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';
import 'package:flutterflavordemo/main/myapp.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV, values: FlavorValues(baseUrl: "https://dev"));
  runApp(MyApp());
}
```

#### ステージング環境

```
import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';
import 'package:flutterflavordemo/main/myapp.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.QA, values: FlavorValues(baseUrl: "https://qa"));
  runApp(MyApp());
}
```

#### 本番環境

```
import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';
import 'package:flutterflavordemo/main/myapp.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.PROD, values: FlavorValues(baseUrl: "https://prod"));
  runApp(MyApp());
}
```
### (３) 環境ごとに、エントリーポイントやパラメタ、Flavorを設定する。

| 環境 | エントリーポイント | パラメタ | Flavor |
|----|----|----|----|
|開発環境 | main_dev.dart | --debug | DEV |
|ステージング環境 | main_qa.dart | --release | QA |
|本番環境 | main_prod.dart | --release | PROD |


<img width="512" alt="スクリーンショット 2020-06-26 12 00 55" src="https://user-images.githubusercontent.com/9479568/85815986-f3248d80-b7a4-11ea-88d0-23fa1c92d3f6.png">

### (４) xcodeで、環境ごとに、Configurationsを設定する。
Configurations名は、{パラメタ}-{Flavor}として設定すること。

| 環境 | Configurations名 | パラメタ | Flavor |
|----|----|----|----|
|開発環境 | Debug-DEV | --debug | DEV |
|ステージング環境 | Release-QA | --release | QA |
|本番環境 | Release-PROD | --release | PROD |

### （５）参考

```
Text("${FlavorConfig.instance.values.baseUrl}"
```



