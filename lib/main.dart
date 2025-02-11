import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/motel_cubit.dart';
import 'bloc/tab_cubit.dart';
import 'pages/home_page.dart';
import 'repositories/motel_repository.dart';

void main() {
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
            create: (context) => MotelCubit(MotelRepository())..fetchMoteis(),
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
