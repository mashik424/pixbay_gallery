import 'package:flutter/material.dart';
import 'package:pixabay_gallery/src/screens/home.dart';
import 'package:pixabay_gallery/src/screens/splash.dart';
import 'package:pixabay_gallery/src/screens/unknown_route.dart';
import 'package:pixabay_gallery/src/screens/veiw_image.dart';

const splash = '/';
const home = 'home';
const viewImage = 'view_image';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case home:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case viewImage:
      return MaterialPageRoute(
        builder: (context) => VeiwImageScreen(
          imageUrl: settings.arguments! as String,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const UnknownRouteScreen(),
      );
  }
}
