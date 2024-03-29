import 'package:api_app/common/middlewares/middlewares.dart';
import 'package:api_app/common/routes/routes.dart';
import 'package:api_app/pages/frame/registed/index.dart';
import 'package:api_app/pages/frame/splashscreen/index.dart';
import 'package:api_app/pages/main_navigation/button_nav/index.dart';
import 'package:api_app/pages/main_navigation/button_nav/view.dart';
import 'package:api_app/pages/main_navigation/feed/index.dart';
import 'package:api_app/pages/main_navigation/feed/post_feed/index.dart';
import 'package:api_app/pages/main_navigation/home/detail-konsult/index.dart';
import 'package:api_app/pages/main_navigation/home/index.dart';
import 'package:api_app/pages/main_navigation/messages/chat-room/index.dart';
import 'package:api_app/pages/main_navigation/messages/index.dart';
import 'package:api_app/pages/main_navigation/profile/index.dart';
import 'package:api_app/pages/main_navigation/store/detail-produk/index.dart';
import 'package:api_app/pages/main_navigation/store/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/frame/login/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [

    // Splash Screen
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const SplashPage(),
      binding: SplashBinding(), 
    ),

    // Login
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(), 
    ),

    // Register
    GetPage(
      name: AppRoutes.Register,
      page: () => const SignUpPage(),
      binding: SignUpBinding()
    ),

    GetPage(
      name: AppRoutes.BtnNav,
      page: () => const MainNavbarPage(),
      binding: MainNavbarBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1)
      ]
    ),

    // Home
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding()
    ),

    // Feed
    GetPage(
      name: AppRoutes.Feed,
      page: () => const FeedPage(),
      binding: FeedBinding()
    ),

    // Store
    GetPage(
      name: AppRoutes.Store,
      page: () => const StorePage(),
      binding: StoreBinding()
    ),

    // Message
    GetPage(
      name: AppRoutes.Message,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ]
    ),

    // Profile
    GetPage(
      name: AppRoutes.Profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding()
    ),

    // Chat
    GetPage(
      name: AppRoutes.Chat,
      page: () => const ChatRoomPage(),
      binding: ChatRoomBinding()
    ),
    
    // Detail Konsultan
    GetPage(
      name: AppRoutes.DetailKonsult, 
      page: () => const DetailKonsultPage(),
      binding: KonsultasiBinding()
    ),

    // Detail Produk
    GetPage(
      name: AppRoutes.DetailProduk,
      page: () => const DetailProdukPage(),
      binding: DetailProdukBinding()
    ),

    // Post Feed
    GetPage(
      name: AppRoutes.PostFeed,
      page: () => const PostFeedPage(),
      binding: PostFeedBinding()
    )
  ];
}