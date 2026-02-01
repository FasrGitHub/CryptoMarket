import 'dart:math';
import 'package:flutter/material.dart';

class RgbColorGenerator {
  final Random _random;

  RgbColorGenerator([Random? random]) : _random = random ?? Random();

  Color generateColor() => Color.fromARGB(
    255,
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
  );
}
