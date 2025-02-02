import 'package:counter_app/fancy_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hot Reload Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() {
        _counter = 0;
        _reversed = !_reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final incrementButton = FancyButton(
      key: _buttonKeys.first,
      child: Text(
        'Decrement',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _decrementCounter,
    );
    final decrementButton = FancyButton(
      key: _buttonKeys.last,
      child: Text(
        'Increment',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _incrementCounter,
    );
    List<Widget> buttons = _reversed
      ? <Widget>[decrementButton, incrementButton]
      : <Widget>[incrementButton, decrementButton];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                'flutter_logo_1080.png',
                width: 100.0,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
