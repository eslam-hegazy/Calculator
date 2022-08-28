import 'package:eslamportofolio/responsive/responsive_layout.dart';
import 'package:eslamportofolio/screens/desktop_screen.dart';
import 'package:eslamportofolio/screens/mobile_screen.dart';
import 'package:eslamportofolio/screens/web_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveLayout(
        mobile: MobileScreen(),
        web: WebScreen(),
        desktop: DeskTopScreen(),
      ),
    );
  }
}
