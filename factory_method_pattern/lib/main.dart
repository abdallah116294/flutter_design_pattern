
import 'package:factory_method_pattern/shape.dart';
import 'package:factory_method_pattern/utils.dart';
import 'package:flutter/material.dart';

/// global state data
Shape currShape = NullShape();

void main() {
  runApp(MyApp());
}

/// Creationg a raised button style for our button
///
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

/// Main application widget entry point
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Method Pattern',
      home: MyHomePage(),
    );
  }
}

/// Our Main Widget Scaffolding
///
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// Bulk of the inside of our stateful-widget
///
/// We create a simple canvas container [400x400] in which we will render our
/// shapes.
/// We use a custom painter to delegate drawing anything to the canvas.
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Method Pattern'),
      ),
      body: ListView(children: <Widget>[
        Text(
          '${currShape.getName}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: CanvasPainter(),
          ),
        ),
        ElevatedButton(
          style: raisedButtonStyle,
          child: const Text('Generate New Random Shape'),
          onPressed: () {
            setState(() {
              currShape = Utils.generateRandomShape(const Size(400, 400));
            });
          },
        ),
      ]),
    );
  }
}

/// our custom painter
/// We simply draw the current shape by delegating to its draw(Canvas) method
///
class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    currShape.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
