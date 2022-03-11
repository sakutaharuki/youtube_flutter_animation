// Youtube URL: 
// This is the code presented in the URL above.
// The reading order is easier if you follow the numbers in the file.

import 'package:flutter/material.dart';

import 'circle_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Tween<double> _tween;

  int maxValue = 10;

  // Set animation when screen is displayed.
  // （画面が表示されたときにアニメーションをセット）
  @override
  void initState() {
    super.initState();
    arcProgressAnimation();
  }

  /// Animation Settings.（アニメーションの設定）
  void arcProgressAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: maxValue),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Called whenever the animation State changes. (e.g., when it ends)
        // アニメーションのStateが変化するたびに呼ばれる。（終了した時など)
      }
    });
    _animationController.addListener(() {
      setState(() {
        // Called each time the animation value changes.
        // （アニメーションの値が変わる度に呼ばれる）
      });
    });
    _tween = Tween(begin: 0.0, end: 10.0);
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanks for watching'),
      ),
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(_animation.value, maxValue),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_animation.value.toInt()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: const Icon(Icons.play_arrow),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
