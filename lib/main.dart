import 'package:counter_num_bloc/home_pages/bloc/counter/counter_bloc.dart';
import 'package:counter_num_bloc/home_pages/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(title: 'Counter App', home: const HomeScreen()),
    );
  }
}
