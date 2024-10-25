import 'package:eeats/core/constants/eeats_style.dart';
import 'package:eeats/core/di/eeats_blocs.dart';
import 'package:eeats/core/di/eeats_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(
    MyApp(blocList: await blocs()),
  );
}

class MyApp extends StatelessWidget {
  final List<BlocProvider> blocList;

  const MyApp({
    super.key,
    required this.blocList,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList,
      child: MaterialApp.router(
        routerConfig: eeatsRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: EeatsColor.main200,
            selectionColor: EeatsColor.main200,
            selectionHandleColor: EeatsColor.main200,
          ),
        ),
      ),
    );
  }
}
