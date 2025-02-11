import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/motel_cubit.dart';
import 'presentation/bloc/tab_cubit.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moteis App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<MotelCubit>()..fetchMoteis(),
          ),
          BlocProvider(
            create: (context) => TabStateCubit(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
