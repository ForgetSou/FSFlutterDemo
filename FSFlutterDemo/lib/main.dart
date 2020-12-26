import 'package:flutter/material.dart';
import './index_page.dart';

void main() => runApp(new MyApp());

// 静态类
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: IndexPage(),
      home: IndexPage(),
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}
