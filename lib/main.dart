import 'package:chang_background/bloc/color_bloc.dart';
import 'package:chang_background/user.dart';
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
        debugShowCheckedModeBanner: false,
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
  final nameController = TextEditingController();
  final indexController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    indexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(10),
                        width: 300,
                        height: 100,
                        /*color:  state.index == index
                                      ? state.colorvalue
                                      :
                                      Colors.greenAccent,*/
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ID : $index"),
                              // Text(state.index == index
                              //     ? "Name : ${state.user.name}"
                              //     : "Name  : Harshil "),
                              Text("Name : ${state.userList[index].name}"),
                              Text("Age : ${state.userList[index].age}"),
                              Text("Email :${state.userList[index].email}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                labelText: 'Enter Name',
                                hintText: 'Enter Name to Change')),
                        TextField(
                          controller: indexController,
                          decoration: const InputDecoration(
                              labelText: 'Enter ID', hintText: "Enter ID"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ColorBloc>(context).add(
                                  NameChangeEvent(
                                      index: int.parse(indexController.text),
                                      user: User(
                                          name: nameController.text,
                                          age: state
                                              .userList[int.parse(
                                                  indexController.text)]
                                              .age,
                                          email: state
                                              .userList[int.parse(
                                                  indexController.text)]
                                              .email)));
                            },
                            child: const Text("Update"))
                      ],
                    ),
                  )

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (_) => SecondScreen()),
                  //       );
                  //     },
                  //     child: const Text("Go to Second Screen"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
