import 'dart:math';


import 'package:factory_method_pattern/shape.dart';
import 'package:factory_method_pattern/shape_factory.dart';
import 'package:flutter/material.dart';

class Utils {
  static Shape generateRandomShape(Size constraints) {
    Size margins = const Size(20, 20);
    Size radiusMinMax = const Size(4, 40);
    Size widthHeightMinMax = const Size(15, 100);
    Shape result = NullShape();
    Random rnd = Random();

    /// generate the variables
    ///

    ///
    /// randomly generate the shape type
    ShapesEnum shapeType =
        ShapesEnum.values[Random().nextInt(ShapesEnum.values.length)];
    debugPrint("generating random shape...");
    debugPrint("generated $shapeType");

    switch (shapeType) {
      case ShapesEnum.rectangle:
        {
          /// generate random Rectangle
          ///

          /// randomly generate the position of the origin
          /// which is left the upper corner of the Rectangle
          Point v1 = Point(
              rnd.nextDouble() * (constraints.width - margins.width),
              rnd.nextDouble() * (constraints.height - margins.height));

          double width = rnd.nextDouble() *
                  (widthHeightMinMax.height - widthHeightMinMax.width) +
              widthHeightMinMax.width;
          double height = rnd.nextDouble() *
                  (widthHeightMinMax.height - widthHeightMinMax.width) +
              widthHeightMinMax.width;

          /// randomly generate color
          Color color =
              Colors.primaries[Random().nextInt(Colors.primaries.length)];

          ///
          /// create the Rectangle using the factory method pattern
          ///
          ///
          ShapeBuildContext context = ShapeBuildContext()
            ..shapeType = shapeType
            ..color = color
            ..vertices = [v1]
            ..width = width
            ..height = height;
          result = ShapeFactory.createShape(context);
        }
        break;

      case ShapesEnum.circle:
        {
          /// randomly generate radius in the range of [radiusMinMax]
          double radius =
              rnd.nextDouble() * (radiusMinMax.height - radiusMinMax.width) +
                  radiusMinMax.width;
          Point v1 = Point(
              rnd.nextDouble() *
                  (constraints.width - margins.width - radius / 2),
              rnd.nextDouble() * (constraints.height - margins.height));

          /// randomly generate color
          Color color =
              Colors.primaries[Random().nextInt(Colors.primaries.length)];

          ///
          /// create the Triangle using the factory method pattern
          ///
          ///
          ShapeBuildContext context = ShapeBuildContext()
            ..shapeType = shapeType
            ..color = color
            ..vertices = [v1]
            ..radius = radius;
          result = ShapeFactory.createShape(context);
        }
        break;
    }
    return result;
  }
}
