<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Display a list of items in a circular order

## Features

Helps you display items in half circle

## Add dependency
```yaml
dependencies:
  circle_list: ^1.0.0
```

## Usage

```dart
import 'package:half_circle_list/half_circle_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Half Circle List'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(100),
          child: HalfCircleList(
            children: List.generate(
              7,
                  (index) => Container(
                key: ValueKey(index),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5)
                ),
                width: 70,
                height: 100,
                child: Center(child: Text(index.toString())),
                // child: Center(child: Image.asset("assets/png/angel-card-icon.png", width: 50, height: 70,)),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
```

## TODO
- add start angle
- add step angle
- add total angle