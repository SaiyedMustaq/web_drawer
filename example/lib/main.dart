// ignore_for_file: implementation_imports

import 'package:example/route/app_router.dart';
import 'package:example/route/router_name.dart';
import 'package:example/wrap_with_drawer.dart';
import 'package:flutter/material.dart';
import 'package:web_drawer/src/model/drawer_menu_item.dart';
import 'package:web_drawer/src/model/drawer_sub_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

List<DrawerMenuItem> menuItems = [
  DrawerMenuItem(
    title: 'Buying Station',
    route: RouteName.byuingstation,
    notificationCount: 3,
    iconUrl: "assets/piggy-bank.png",
    subCategories: [
      DrawerSubMenuMenuItem(
        parentTitle: 'Buying Station',
        title: 'Quality',
        iconUrl: "assets/piggy-bank.png",
        route: RouteName.byuingstation1,
        notificationCount: 25,
      ),
      DrawerSubMenuMenuItem(parentTitle: 'Buying Station', title: 'Opetation', iconUrl: "assets/piggy-bank.png", route: RouteName.byuingstation2),
    ],
  ),

  DrawerMenuItem(title: 'Procurement', iconUrl: "assets/box.png", route: RouteName.procurement),

  DrawerMenuItem(title: 'Sales Invoice', iconUrl: "assets/user.png", route: RouteName.saleinvoice, notificationCount: 36),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router,
      //home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapWithDrawer(
        pageTitle: "Home Screen",
        child: Center(child: Text("Home Screen")),
      ),
    );
  }
}
