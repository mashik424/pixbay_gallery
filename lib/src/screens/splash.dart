import 'package:flutter/material.dart';
import 'package:pixabay_gallery/src/routes/routes.dart' as routes;
import 'package:pixabay_gallery/src/utils/context_exts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.pushNamed<void>(routes.home),
    );
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'Pixabay Gallery',
          style: theme.textTheme.displayMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
