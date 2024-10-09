import 'package:flutter/material.dart';

extension ContextExts on BuildContext {
  Size get size => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Future<T?> pushNamed<T>(String name, {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(
        name,
        arguments: arguments,
      );
}
