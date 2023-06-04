
import 'package:api_app/common/routes/pages.dart';
import 'package:flutter/material.dart';

class RouteObservers<NR extends Route<dynamic>> extends RouteObserver<NR> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> ? previousRoute) {
    super.didPush(route, previousRoute);
    var name = route.settings.name ?? '';
    if (name.isNotEmpty) AppPages.history.add(name);
  }
}