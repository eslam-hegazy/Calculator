import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.web,
    required this.desktop,
  }) : super(key: key);
  final Widget mobile;
  final Widget web;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else if (constraints.maxWidth < 1050 && constraints.maxWidth >= 600) {
          return desktop;
        } else {
          return web;
        }
      }),
    );
  }
}
