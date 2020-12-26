import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/dialogue_page.dart';
import 'pages/record_page.dart';
import 'pages/mine_page.dart';
import 'pages/mall_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/home_unselected.png',
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          'images/home_selected.png',
          width: 20,
          height: 20,
        ),
        label: '首页'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/dialogue_unselected.png',
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          'images/dialogue_selected.png',
          width: 20,
          height: 20,
        ),
        label: '对话翻译'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
          size: 20,
        ),
        label: '商城'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/record_unselected.png',
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          'images/record_selected.png',
          width: 20,
          height: 20,
        ),
        label: '录音翻译'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/mine_unselected.png',
          width: 20,
          height: 20,
        ),
        activeIcon: Image.asset(
          'images/mine_selected.png',
          width: 20,
          height: 20,
        ),
        label: '我的')
  ];
  final List tabPages = [
    HomePage(),
    DialoguePage(),
    MallPage(),
    RecordPage(),
    MinePage()
  ];

  int currentIndex = 0;
  var currentPage;

  int get idx => null;

  @override
  void initState() {
    currentPage = tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        // elevation: 0,
        items: bottomTabs,
        onTap: (idx) {
          setState(() {
            currentIndex = idx;
            currentPage = tabPages[idx];
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.local_mall,
          size: 30,
        ),
        onPressed: () {
          setState(() {
            currentIndex = 2;
            currentPage = tabPages[2];
          });
        },
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          bottomTabs[currentIndex].label,
          style: TextStyle(color: Colors.orange),
        ),
        elevation: 0.5,
      ),
      body: currentPage,
    );
  }
}
