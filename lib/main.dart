import 'package:chang_background/bloc/color_bloc.dart';
import 'package:chang_background/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  height: 300,
                  color: state.colorvalue,
                );
              },
            ),
            const Text(
              'This button will change background color',
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
                },
                child: const Text("Change BG color")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SecondScreen()),
                  );
                },
                child: const Text("Go to Second Screen"))
          ],
        ),
      ),
    );
  }
}
