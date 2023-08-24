import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toString()),
            CupertinoButton(child: Text('to search'), onPressed: () => context.go('/search')),
          ],
        ),
      ),
    );
  }
}
