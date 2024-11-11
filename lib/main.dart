import 'package:eeats/core/di/eeats_blocs.dart';
import 'package:eeats/core/di/eeats_router.dart';
import 'package:eeats/core/di/eeats_style.dart';
import 'package:eeats/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
