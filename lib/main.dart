import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
     // home: const CounterScreen(),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TO DO LIST'),),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index){
        return ListTile(
          title: Text(todos[index]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: (){
         // todos.add('New To do');
          setState(() {

          });
        },
      ),
    );
  }
}


class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text(count.toString(),
        style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            if(count>0){
              count--;
            }
            setState(() {

            });

          },
          child: const Icon(Icons.exposure_minus_1),),
          FloatingActionButton(
            onPressed: (){
              count++;
              setState(() {

              });

            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}


