import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/home/pages/article_details_view.dart';
import 'package:news_app/pages/home/pages/home_view.dart';
import 'package:news_app/pages/settings/pages/settingsview.dart';

import '../../pages/splash/pages/splash_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: settings);

      case PagesRouteName.homeView:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: settings);

      case PagesRouteName.settingsView:
        return MaterialPageRoute(
            builder: (context) => SettingsView(), settings: settings);

      case PagesRouteName.articleDetailsView:
        return MaterialPageRoute(
            builder: (context) => ArticleDetailsView(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: settings);
    }
  }
}
