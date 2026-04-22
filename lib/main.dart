import 'package:counter_num_bloc/home_pages/bloc/counter/counter_bloc.dart';
import 'package:counter_num_bloc/home_pages/ui/home_screen.dart';
import 'package:counter_num_bloc/switch_page/bloc/switch/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: const MaterialApp(title: 'Counter App', home: HomeScreen()),
    );
  }
}
