import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme() => ThemeData(
      iconTheme: IconThemeData(color: kBackgroundColor, size: iconSize),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: largeTextSize,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(
          fontFamily: 'San Francisco',
          fontSize: largeTextSize,
          color: kBackgroundColor,
        ),
        titleMedium: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: mediumTextSize,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: smallTextSize,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
          fontFamily: 'San Francisco',
          fontSize: smallTextSize,
          color: kBackgroundColor,
        ),
      ),
    );
