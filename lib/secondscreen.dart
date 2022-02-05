import 'package:chang_background/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Color colorBg;
  @override

  // void _changeBG() {
  //   widget.ab(
  //       colorBg == Colors.lightBlue ? Colors.greenAccent : Colors.lightBlue);
  //   setState(() {
  //     if (colorBg == Colors.lightBlue) {
  //       colorBg = Colors.greenAccent;
  //     } else {
  //       colorBg = Colors.lightBlue;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Second Screen",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
                onPressed:(){
                  BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
                },
                child: const Text("Change BG color")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go to First Screen"))
          ],
        ),
      ),
    );
  }
}
