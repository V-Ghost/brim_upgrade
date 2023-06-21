import 'package:flutter/material.dart';
import 'package:sucrose/pages/chatroom.dart';
import 'package:sucrose/widgets/buttons/animatedbrimbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: "Rage"),
      home: const MyHomePage(title: 'Chatroom Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 1;
  double brimbuttonwidth = 100.0;
  double brimbuttonheight = 100.0;
  String text = "Brim";
  void elevatedButtonOnPress() async {
    setState(() {
      // _opacity = 0;
      // brimbuttonwidth = 150.0;
      // brimbuttonheight = 150.0;
      // text = "Pairing....";
    });
    // await Future.delayed(Duration(milliseconds: 9000));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Chatroom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var elevatedButton = ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              const Size(200.0, 50.0)), // Set the desired size
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set the desired corner radius
            ),
          ),
        ),
        onPressed: elevatedButtonOnPress,
        child: const Text("Start Brimming Here"));
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Container()),
            Animatedbrimbutton(
              buttonHeight: brimbuttonheight,
              buttonWidth: brimbuttonwidth,
              text: text,
            ),
            Expanded(child: Container()),
            AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 1000),
                child: elevatedButton),
            SizedBox.fromSize(
              size: const Size(150, 150),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
