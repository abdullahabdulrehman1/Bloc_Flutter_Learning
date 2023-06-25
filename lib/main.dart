import 'package:bloc_learning_tutorial/blocs/internetbloc/internet_bloc.dart';
import 'package:bloc_learning_tutorial/blocs/internetbloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return Text('Connected...');
                } else if (state is InternetLostState) {
                  return Text(' Not Connected...');
                } else {
                  return Text(' Loading...');
                }
                // Ret}urn the Text widget directly
              },
            ),
          ),
        ),
      ),
    );
  }
}
