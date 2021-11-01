import 'package:flutter/material.dart';
import 'package:myapp/calls.dart';
import 'package:myapp/chats.dart';
import 'package:myapp/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        title: const Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.all(12),
            tabs: [
              Icon(Icons.camera_alt),
              Container(
                  width: 90, alignment: Alignment.center, child: Text('CHATS')),
              Container(
                  width: 90,
                  alignment: Alignment.center,
                  child: Text('STATUS')),
              Container(
                  width: 90, alignment: Alignment.center, child: Text('CALLS')),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        Text('CAMERA'),
        // START CHATS
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ChatScreen(
                  images: 'images/p1.jpg',
                  title: 'Sami Hossen',
                ),
                ChatScreen(
                  images: 'images/p2.jpg',
                  title: 'Farhad Hossen',
                ),
              ],
            );
          },
        ),
        // START STATUS
        ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                StatusScreen(
                  images: 'images/p1.jpg',
                ),
              ],
            );
          },
        ),

        //START CALLS
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CallsScreen(
                  images: 'images/p1.jpg',
                  title: 'Sami Hossen',
                ),
                CallsScreen(
                  images: 'images/p2.jpg',
                  title: 'Farhad Hossen',
                ),
              ],
            );
          },
        ),
      ]),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              child: Icon(Icons.message),
              backgroundColor: Theme.of(context).primaryColorLight,
              onPressed: () {},
            )
          : FloatingActionButton(
              child: Icon(Icons.camera_alt),
              backgroundColor: Theme.of(context).primaryColorLight,
              onPressed: () {},
            ),
    );
  }
}
