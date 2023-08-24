import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Favorite repo list"),
        leading: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.back),
          onPressed: () => context.pop(),
        ),
      ),
      child: Center(
        child: Text(toString()),
      ),
    );
  }
}
