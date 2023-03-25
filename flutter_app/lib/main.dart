import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: GameWidget(game: SampleGame()),
    );
  }
}

class SampleGame extends FlameGame with KeyboardEvents {
  late final paint;
  late Vector2 _loc;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = Paint();
    paint.color = Colors.blue;
    _loc = Vector2(100, 100);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(_loc.x, _loc.y, 100, 100);
    canvas.drawOval(rect, paint);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final _dpos = Vector2(0, 0);

    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _dpos.x = -10;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _dpos.x = 10;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      _dpos.y = -10;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      _dpos.y = 10;
    }
    _loc += _dpos;
    return KeyEventResult.handled;
  }
}