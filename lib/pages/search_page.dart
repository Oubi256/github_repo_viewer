import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Github repo list"),
        trailing: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.star),
          onPressed: () => context.go('/search/favorite'),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toString()),
          ],
        ),
      ),
    );
  }
}
