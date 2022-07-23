import 'package:flutter/material.dart';
import 'package:thien_220714/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = <BottomNavigationBarItem>[];
  final page = <Widget>[];
  var pageIndex = 0;

  @override
  void initState() {
    setupPage();
    setupBottomNavigationBarItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Expanded(child: Text('Home Page')),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage()),
                        (route) => false);
              },
            )
          ],
        ),
        // const Text(
        //   "Home Page",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        // ),
      ),
      body: page[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        items: items,
        onTap: (value) {
          pageIndex = value;
          setState(() {});
        },
      ),
    );
  }

  void setupBottomNavigationBarItem() {
    items.addAll([
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'Setting'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
    ]);
  }

  void setupPage() {
    page.addAll([
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.teal,
      ),
      Container(
        color: Colors.blueAccent,
      ),
    ]);
  }
}
