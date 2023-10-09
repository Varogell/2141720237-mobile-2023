import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/date_time_widget.dart';
// import 'package:hello_world/basic_widgets/input_widget.dart';
// import 'package:hello_world/basic_widgets/dialog_widget.dart';
// import 'package:hello_world/basic_widgets/scaffold_widget.dart';
// import 'package:hello_world/basic_widgets/fab_widget.dart';
// import 'package:hello_world/basic_widgets/loading_cupertino.dart';
// import 'package:hello_world/basic_widgets/text_widget.dart';
// import 'package:hello_world/basic_widgets/image_widget.dart';
void main() {
  runApp(const DateTimeWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'My Increment App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // const MyTextWidget(),
            // const MyImageWidget(),
            // const ButtonCupertinoWidget(),
            // const ScaffoldWidget(),
            // const DialogWidget(),
            // const InputWidget(),
            const DateTimeWidget(),
            Text(
              '$_counter',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}