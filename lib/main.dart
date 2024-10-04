import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_gallery/src/di/injection_container.dart' as di;
import 'package:pixabay_gallery/src/screens/home.dart';
import 'package:pixabay_gallery/src/screens/splash.dart';
import 'package:pixabay_gallery/src/screens/unknown_route.dart';

void main() {
  di.inject(
    apiKey: '46349755-9873d9e66a7478551e2799d70',
    baseUrl: 'https://pixabay.com/api',
  );
  runApp(const PixabayGalleryApp());
}

class PixabayGalleryApp extends StatelessWidget {
  const PixabayGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pixabay Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            );
          case '/home':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const UnknownRouteScreen(),
            );
        }
      },
    );
  }
}
