import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rainbownews/screens/edupost.dart';
import 'package:rainbownews/screens/homepost.dart';
import 'package:rainbownews/screens/nationalpost.dart';
import 'package:rainbownews/screens/financepost.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> tabList = <Tab>[
    const Tab(
      child: Text(
        "Home",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "India",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "Finance",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "Education",
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("On Will Pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(
        const Duration(
          milliseconds: 200,
        ), () {
      print("Set Index");

      _tabController?.index = 0;
    });

    print("Return");

    return _tabController?.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'News',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
              Text(
                'App',
                style: TextStyle(letterSpacing: 1.2, color: Colors.blue),
              ),
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: tabList,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePost(),
            NationalPost(),
            FinancePost(),
            EduPost(),
          ],
        ),
      ),
    );
  }
}
