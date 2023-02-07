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

  //modal bottom sheet is used from anywhere in the screen for getting data from users
  //bottom sheet is used only for showing data

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> todos=[];
  TextEditingController todocontroller=TextEditingController();

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
         showModalBottomSheet(
             isDismissible: true,
             barrierColor: Colors.black12,
             backgroundColor: Colors.lightGreenAccent,

             shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(20),
                 topRight: Radius.circular(20),
               )
             ),

             isScrollControlled: false,
            // enableDrag: true,
             context: context,
             builder: (context){
           return Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               children: [
                 TextField(
                   decoration: const InputDecoration(
                     hintText: 'Write New To Do here',
                   ),

                   controller: todocontroller,
                 ),
                 ElevatedButton(onPressed: (){

                   todos.add(todocontroller.text);
                   todocontroller.clear();

                   setState(() {});
                   Navigator.pop(context);



                 }, child: const Text('Add Item'))
               ],
             ),
           );
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


