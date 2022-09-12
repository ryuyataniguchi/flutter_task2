import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  final _textControllerA = TextEditingController();
  final _textControllerB = TextEditingController();

  int a = 0;
  int b = 0;
  int c = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Calculator'
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 100),
              Container(
                height: 50,
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _textControllerA,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'A',
                  ),
                  onChanged: (text) { // ★
                    setState(() {
                      a = int.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),

              Container(
                height: 50,
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _textControllerB,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'B',
                  ),
                  onChanged: (text) { // ★
                    setState(() {
                      b = int.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                height: 50,
                width: 100,
                child: Text(
                    '結果 : $c',
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('+'),
                  onPressed: () {
                    setState(() {
                      c = a + b;
                      print('$c');
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('-'),
                  onPressed: () {
                    setState(() {
                      c = a - b;
                      print('$c');
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('×'),
                  onPressed: () {
                    setState(() {
                      c = a * b;
                      print('$c');
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('÷'),
                  onPressed: () {
                    setState(() {
                      c = a % b;
                      print('$c');
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}