import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_task/models/api_a_model.dart';
import 'package:music_app_task/view/trending_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => ApiAService()),
          ],
          child: TrendingPage(),
        ));
  }
}
