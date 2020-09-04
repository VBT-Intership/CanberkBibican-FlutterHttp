import 'package:flutter/material.dart';
import 'package:flutter_http_example/http_dogs/view/http_dogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HttpDogs(),
    );
  }
}
