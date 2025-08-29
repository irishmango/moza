import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:moza/src/shared/general_background.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          const GeneralBackground(),
          if (body != null)
            Padding(
              padding: kIsWeb
                  ? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0) // for web!!
                  : EdgeInsets.zero,
              child: body!,
            ),
        ],
      ),
    );
  }
}