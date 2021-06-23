import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
}

const url = 'https://google.com';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> pages = const [
    Page1(),
    Page2(),
  ];

  Widget _bottomNavigationBar(int selectedIndex) => SafeArea(
        child: BottomNavigationBar(
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_dining), label: 'Page1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'Page2'),
          ],
        ),
        bottom: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO'),
      ),
      backgroundColor: Colors.amber,
      body: PageStorage(bucket: bucket, child: pages[_selectedIndex]),
      bottomNavigationBar: _bottomNavigationBar(
          _selectedIndex), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Link(
          uri: Uri.parse(url),
          target: LinkTarget.blank,
          builder: (context, onPressed) {
            return ElevatedButton(
                onPressed: onPressed, child: const Text('Button 1'));
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Link(
          uri: Uri.parse(url),
          target: LinkTarget.blank,
          builder: (context, onPressed) {
            return ElevatedButton(
                onPressed: onPressed, child: const Text('Button 2'));
          },
        ),
      ),
    );
  }
}
