import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:github_repo_viewer/pages/favorite_page.dart';
import 'package:github_repo_viewer/pages/loading_page.dart';
import 'package:github_repo_viewer/pages/search_page.dart';
import 'package:go_router/go_router.dart';

part 'router_config.dart';

void main() {
  runApp(const GithubRepoViewerApp());
}

class GithubRepoViewerApp extends StatelessWidget {
  const GithubRepoViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __) {
        return CupertinoApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _routerConfig,
          title: Constants.appTitle,
        );
      },
    );
  }
}
