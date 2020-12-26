import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/dialogue_page.dart';
import 'pages/record_page.dart';
import 'pages/mine_page.dart';
import 'pages/mall_page.dart';

class IndexPage extends StatefulWidget {
  @override
  // 凸出效果
  // _BulgeState createState() => _BulgeState();
  // 外弧效果
  _OuterArcState createState() => _OuterArcState();
}

// class _BulgeState extends State<IndexPage> {
//   final List<BottomNavigationBarItem> bottomTabs = [
//     BottomNavigationBarItem(
//         icon: Image.asset(
//           'images/home_unselected.png',
//           width: 20,
//           height: 20,
//         ),
//         activeIcon: Image.asset(
//           'images/home_selected.png',
//           width: 20,
//           height: 20,
//         ),
//         label: '首页'),
//     BottomNavigationBarItem(
//         icon: Image.asset(
//           'images/dialogue_unselected.png',
//           width: 20,
//           height: 20,
//         ),
//         activeIcon: Image.asset(
//           'images/dialogue_selected.png',
//           width: 20,
//           height: 20,
//         ),
//         label: '对话翻译'),
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.add,
//           size: 20,
//         ),
//         label: '商城'),
//     BottomNavigationBarItem(
//         icon: Image.asset(
//           'images/record_unselected.png',
//           width: 20,
//           height: 20,
//         ),
//         activeIcon: Image.asset(
//           'images/record_selected.png',
//           width: 20,
//           height: 20,
//         ),
//         label: '录音翻译'),
//     BottomNavigationBarItem(
//         icon: Image.asset(
//           'images/mine_unselected.png',
//           width: 20,
//           height: 20,
//         ),
//         activeIcon: Image.asset(
//           'images/mine_selected.png',
//           width: 20,
//           height: 20,
//         ),
//         label: '我的')
//   ];
//   final List tabPages = [
//     HomePage(),
//     DialoguePage(),
//     MallPage(),
//     RecordPage(),
//     MinePage()
//   ];

//   int currentIndex = 0;
//   var currentPage;

//   int get idx => null;

//   @override
//   void initState() {
//     currentPage = tabPages[currentIndex];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         // elevation: 0,
//         items: bottomTabs,
//         onTap: (idx) {
//           setState(() {
//             currentIndex = idx;
//             currentPage = tabPages[idx];
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Image.asset(
//           'images/home_selected.png',
//           width: 24,
//           height: 24,
//         ),
//         onPressed: () {
//           setState(() {
//             currentIndex = 2;
//             currentPage = tabPages[2];
//           });
//         },
//         backgroundColor: Colors.red,
//         elevation: 5,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreen,
//         title: Text(
//           bottomTabs[currentIndex].label,
//           style: TextStyle(color: Colors.orange),
//         ),
//         elevation: 0.5,
//       ),
//       body: currentPage,
//     );
//   }
// }

class _OuterArcState extends State<IndexPage> {
  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //构建页面
    return buildBottomTabScaffold();
  }

  //当前显示页面的
  int currentIndex = 0;
  //点击导航项是要显示的页面
  final pages = [HomePage(), DialoguePage(), RecordPage(), MinePage()];

  Widget buildBottomTabScaffold() {
    return SizedBox(
        height: 100,
        child: Scaffold(
          //对应的页面
          body: pages[currentIndex],
          //appBar: AppBar(title: const Text('Bottom App Bar')),
          //悬浮按钮的位置
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //悬浮按钮
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
          //其他菜单栏
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6.0,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildBotomItem(currentIndex, 0, Icons.home, "首页"),
                buildBotomItem(currentIndex, 1, Icons.chat, "对话"),
                buildBotomItem(currentIndex, -1, null, "商城"),
                buildBotomItem(currentIndex, 2, Icons.mic, "录音"),
                buildBotomItem(currentIndex, 3, Icons.person, "我的"),
              ],
            ),
          ),
        ));
  }

  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize = 20;
    EdgeInsetsGeometry padding = EdgeInsets.only(top: 8.0);

    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0, color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      iconSize = 25;
      padding = EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}
