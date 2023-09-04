import 'dart:math';

import 'package:factory_method_pattern/shape.dart';
import 'package:flutter/material.dart';

///
/// Enumeration of available shape ids to be used when calling the
/// Factory Method for Shape creation
///
enum ShapesEnum { rectangle, circle }

///
/// Context data to build shapes.
/// You will normally add any specific and dependant initialization data in
/// here. So for example if you want to add a Rectangle shape you could add here
/// a [width] and [height].
class ShapeBuildContext {
  late Color color;
  late ShapesEnum shapeType;
  late List<Point> vertices;
  late double radius;
  late double width;
  late double height;
}

/// Shape Factory which follows the Factory Method Pattern (Simplified) so
/// that we have a single point of Shape instances creation.
///
/// We use [ShapesEnum] as a way to decide which specific shape implementation
/// is asked for and return it
///
class ShapeFactory {
  /// private constructor to prevent instantiation
  ShapeFactory._();

  /// main factory method to create instaces of Bullet children
  static Shape createShape(ShapeBuildContext context) {
    /// instead of null we have e NullShape here which follows the Null
    /// design pattern (bonus!)
    ///
    Shape result = NullShape();

    /// collect all the Shape definitions here
    /// Each case statement will need to know the specific constructor and
    /// match its initialization to the context data
    ///
    /// <TODO>
    /// it would make sense to add a validation step to ensure for example
    /// that all the vertcies for Triangle actually are defined and exist.
    ///
    switch (context.shapeType) {
      case ShapesEnum.rectangle:
        {
          result = Rectangle(context.color, context.vertices[0], context.width,
              context.height);
        }
        break;

      case ShapesEnum.circle:
        {
          result = Circle(context.color, context.vertices[0], context.radius);
        }
        break;
    }

    return result;
  }
}
