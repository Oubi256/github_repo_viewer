import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer/bloc/content_bloc/content_bloc.dart';
import 'package:github_repo_viewer/constants.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContentBloc, ContentState>(
      listener: (context, state) {
        context.go("/search");
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Constants.appTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.layerColor),
              ),
              SizedBox(height: Constants.headerBottomSeparatorHeight),
              CupertinoActivityIndicator(
                color: Constants.layerColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
