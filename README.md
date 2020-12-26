# 简介

底部导航栏是我们日常开发中经常用到的导航工具，用于切换到不同的展示页，比如微信、支付宝、淘宝等大厂APP都是使用底部导航栏设计，此设计也符合用户的使用习惯，下面我们使用`flutter`创建一个简单的底部工具栏。

![效果图](https://upload-images.jianshu.io/upload_images/16097449-ef1cc0af182c3590.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---

# 示例

在fluuter开发中，万物皆是`Wdiget`, `flutter`官方提供的一个底部导航组件`BottomNavigationBar`，我们就使用`BottomNavigationBar`创建。

## **方式一**

```dart
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class ZDLocalizations {
  ZDLocalizations(this.locale);

  final Locale locale;

  static ZDLocalizations of(BuildContext context) {
    return Localizations.of<ZDLocalizations>(context, ZDLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'List View',
    },
    'zh': {
      'title': '列表视图',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<ZDLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<ZDLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<ZDLocalizations>(ZDLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

// 静态类
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new CreateHome(),
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
      // 国际化
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', ''), const Locale('zh', '')],
    );
  }
}

// 动态类
class CreateHome extends StatefulWidget {
  @override
  CreateHomeState createState() => CreateHomeState();
}

class CreateHomeState extends State<CreateHome> {
  int _currentIndex = 0;
  final _bodyOptions = [
    Text('主页'),
    Text('商城'),
    Text('消息'),
  ];

  // IBAction
  void backOnPressed() {}

  void menuOnPressed() {}

  void onTabBarItemTapped(int idx) {
    setState(() {
      _currentIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Center(child: _bodyOptions.elementAt(_currentIndex)),
      bottomNavigationBar: _createTabBar(),
    );
  }

  Widget _createAppBar() {
    return new AppBar(
      brightness: Brightness.dark,
      elevation: 0.5,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        ZDLocalizations.of(context).title,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: menuOnPressed,
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: backOnPressed,
      ),
    );
  }

  Widget _createTabBar() {
    return new BottomNavigationBar(
      fixedColor: Colors.blue,
      backgroundColor: Colors.orange,
      currentIndex: _currentIndex,
      onTap: onTabBarItemTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: '商城'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息')
      ],
    );
  }
}

```
**说明：**

***以上代码有国际化示例部分，本博主比较懒，国际化的内容没删除，直接从工程里Copy出来的。***

## **方式二**

### 创建模块

![模块划分](https://upload-images.jianshu.io/upload_images/16097449-70c989dbc0602764.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> home_page		   首页
> dialogue_page   	对话
> record_page		  录音
> mine_page			 我的

在`home_page.dart`内添加模块组件

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
      color: Colors.white,
    ));
  }
}
```

其他模块同上，具体模块的`Scaffold`内容根据具体业务来实现，本文直接复制`home_page.dart`的内容，略微修改`Container`的颜色以区分模块。

### 创建组件控制dart

1. 导入模块dart

   ```dart
   import 'package:flutter/material.dart';
   import 'pages/home_page.dart';
   import 'pages/dialogue_page.dart';
   import 'pages/record_page.dart';
   import 'pages/mine_page.dart';
   ```

2. 添加底部导航按钮及点击控制

   ```dart
   class IndexPage extends StatefulWidget {
     @override
     _IndexPageState createState() => _IndexPageState();
   }
   
   class _IndexPageState extends State<IndexPage> {
     // 底部导航按钮数组
     final List<BottomNavigationBarItem> bottomTabs = [
       BottomNavigationBarItem(
         	// 使用asset图片，也可以使用系统提供的图片，如Icons.home等
           icon: Image.asset(
             'images/home_unselected.png',
             width: 18,
             height: 18,
           ),
           activeIcon: Image.asset(
             'images/home_selected.png',
             width: 18,
             height: 18,
           ),
           label: '首页'),
       BottomNavigationBarItem(
           icon: Image.asset(
             'images/dialogue_unselected.png',
             width: 18,
             height: 18,
           ),
           activeIcon: Image.asset(
             'images/dialogue_selected.png',
             width: 18,
             height: 18,
           ),
           label: '对话翻译'),
       BottomNavigationBarItem(
           icon: Image.asset(
             'images/record_unselected.png',
             width: 18,
             height: 18,
           ),
           activeIcon: Image.asset(
             'images/record_selected.png',
             width: 18,
             height: 18,
           ),
           label: '录音翻译'),
       BottomNavigationBarItem(
           icon: Image.asset(
             'images/mine_unselected.png',
             width: 18,
             height: 18,
           ),
           activeIcon: Image.asset(
             'images/mine_selected.png',
             width: 18,
             height: 18,
           ),
           label: '我的')
     ];
     // 模块容器数组
     final List tabPages = [HomePage(), DialoguePage(), RecordPage(), MinePage()];
     // 当前选择index
     int currentIndex = 0;
     // 当前页
     var currentPage;
   
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
           backgroundColor: Colors.lightGreen,
           type: BottomNavigationBarType.fixed,
           // elevation: 0,
           items: bottomTabs,
           onTap: (idx) {
             // 必须实现setState方法
             setState(() {
               currentIndex = idx;
               currentPage = tabPages[idx];
             });
           },
         ),
         appBar: AppBar(
           backgroundColor: Colors.lightGreen,
           title: Text(
             bottomTabs[currentIndex].label,
             style: TextStyle(color: Colors.orange),
           ),
           elevation: .5,
         ),
         body: currentPage,
       );
     }
   }
   ```

### 实现main.dart

```dart
import 'package:flutter/material.dart';
// 1.导入index_page.dart
import './index_page.dart';

// 2. 调用runApp
void main() => runApp(new MyApp());

// 3. 实现静态组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // 4. 调用IndexPage()方法，填充组件
      home: IndexPage(),
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}
```

# 特殊效果

在我们平时开发过程中不一定都是这种规则的底部导航，有时需要我们做出一些特殊处理，比如中间的item单元凸出显示。

![底部导航Item单元凸出显示](https://upload-images.jianshu.io/upload_images/16097449-5eac1c41db8d44a1.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在这里我们可以通过`Scaffold`中的`floatingActionButton`属性来实现这个效果

```dart
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
        Icons.add,
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
```



---

> **个人博客:** 🏡 [ForgetSou](https://forgetsou.github.io)
>
> **简书:** [Flutter-创建底部导航栏](https://www.jianshu.com/p/bc1b1ee4a7ef)

---