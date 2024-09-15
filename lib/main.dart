import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Counter Button',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 130, 92, 137)
      ),
      home: const CounterScreen(title: 'Counter Button Page'),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  bool _firstImage = true;

  void _imageToggle(){
    setState(() {
      _firstImage = !_firstImage;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 15),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: _incrementCounter, 
              child: const Text('Increment Counter')
            ),
            const SizedBox(height: 15),

            _firstImage
               ? Image.asset('images/SadCat.png')
               : Image.asset('images/HappyCat.png'),
            const SizedBox(height: 15,),
            
            ElevatedButton(
              onPressed: _imageToggle, 
              child: const Text('Image Toggle'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
