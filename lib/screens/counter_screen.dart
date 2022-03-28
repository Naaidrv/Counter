import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void degrease() {
    counter--;
    setState(() {});
  }

  void start() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(
      fontSize: 28,
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('CounterScreen'),
          elevation: 6,
          backgroundColor: Colors.indigoAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Número de clicks:', style: fontSize),
              Text('$counter', style: fontSize)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingActions(
          increaseFn: increase,
          degreaseFn: degrease,
          start: start,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function degreaseFn;
  final Function start;

  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.degreaseFn,
      required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.teal,
              child: Icon(Icons.exposure_plus_1_outlined),
              onPressed: () => increaseFn()),
          FloatingActionButton(
              backgroundColor: Colors.indigoAccent,
              child: Icon(Icons.exposure_zero_outlined),
              onPressed: () => start()),
          FloatingActionButton(
              backgroundColor: Colors.teal,
              child: Icon(Icons.exposure_neg_1_rounded),
              onPressed: () => degreaseFn()),
        ],
      ),
    );
  }
}
