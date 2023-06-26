// import 'package:bloc_learning_tutorial/blocs/internetbloc/internet_bloc.dart';
// import 'package:bloc_learning_tutorial/blocs/internetbloc/internet_state.dart';
import 'package:bloc_learning_tutorial/cubits/internet_cubit.dart';
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
      create: (context) => InternetCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[300],
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.wifi), Icon(Icons.ac_unit_outlined)],
            ),
          ),
          backgroundColor: Colors.teal,
          body: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state == InternetState.gained) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    backgroundColor: Colors.green,
                    content: Text("Connected!"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    backgroundColor: Colors.red,
                    content: Text(" Not Connected!"),
                  ));
                }
              },
              builder: (context, state) {
                if (state == InternetState.gained) {
                  return Text(
                    'Connected... ',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 29),
                  );
                } else if (state == InternetState.lost) {
                  return Text(
                    ' Not Connected...',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 29),
                  );
                } else {
                  return Text(
                    ' Loading...',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 29),
                  );
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
