import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void increment() {
    setState(() => _counter++);
  }

  void decrement() {
    setState(() => _counter--);
  }

  void reset() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButtons(
          increment: increment, decrement: decrement, reset: reset),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clicks Number:', style: textStyle),
            Text('$_counter', style: textStyle),
          ],
        ),
      ),
    );
  }
}

class CustomFloatingActionButtons extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final Function reset;

  const CustomFloatingActionButtons({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increment(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
        FloatingActionButton(
          onPressed: () => reset(),
          child: const Icon(Icons.exposure_zero_outlined),
        ),
        FloatingActionButton(
          onPressed: () => decrement(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
