import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:notes/db/db.dart';
// import 'package:notes/pages/popup.dart';
// import 'package:notes/pages/popup2.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';




class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {



List todolist=[];



  final _clr = Colors.blueAccent;
  final _bgclr = Colors.blue[50];

  // final _clr = Colors.lightBlue.shade800;
  final _cntrl = TextEditingController();
  final _cntrl2 = TextEditingController();



  void checkbox(bool? value, int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
    // db.updatedb();
  }

  void popup(){
    showDialog(
        context: context,
        builder: (context){
          return Popupboxx(
            cancle: ()=>Navigator.of(context).pop(),
            controller: _cntrl,
            save: ()=>{
              save(),
              Navigator.of(context).pop()
            },
          );
        }
    );
  }

  void save(){
    setState(() {
      if(_cntrl.text==""){}else {
        todolist.add([_cntrl.text, false]);
      }
    });
    _cntrl.text="";
    // db.updatedb();

  }




  void popup2(index){
    showDialog(
        context: context,
        builder: (context){
          return Popupboxx2(
            cancle: ()=>Navigator.of(context).pop(),
            controller: _cntrl2,
            save: ()=> {save2(index),    Navigator.of(context).pop()
            },
          );
        }
    );
  }

  void save2(index){
    setState(() {
      if(_cntrl2.text==""){}else {
        todolist[index][0]=_cntrl2.text;
      }
    });
    _cntrl2.text="";
    // db.updatedb();

  }



  void deltask(index){
    setState(() {
      todolist.removeAt(index);
    });
    // db.updatedb();
        ()=>Navigator.of(context).pop();
  }


  // int completed(){
    // int i,c=0;
    // for(i=0;i<db.todolist.length;i++){
      // if(db.todolist[i][1]){c++;}
    // }
    // return c;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgclr,
      child: Scaffold(
        appBar:AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff6499E9),
          title: Row(
            children: [
              SizedBox(width: 135,),
              Center(child: Text("TASKS",style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(width: 90,),
              Text(""),
            ],
          ),),

        backgroundColor: Colors.transparent,

        // backgroundColor: _clr,
        floatingActionButton: FloatingActionButton(
          onPressed: popup,
          backgroundColor: Color(0xff6499E9),
          child: Icon(CupertinoIcons.add),
        ),
        body: Container(
          child: ListView.builder(

            //i want to display all items in array
            itemCount: todolist.length,
            itemBuilder: (context,index){
              return Card(
                taskname: todolist[index][0],
                taskcompleted: todolist[index][1],
                onChanged: (value)=>checkbox(value, index),
                deltaskfunction: (context)=> deltask(index),
                edittaskfunction: (context)=> popup2(index),
                color: _clr,
              );
            },

          ),
        ),
      ),
    );
  }
}










//ACB4C7

class Card extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final color;
  Function(bool?)? onChanged;
  Function(BuildContext)? deltaskfunction;
  Function(BuildContext)? edittaskfunction;

  Card({
    super.key,
    required this.taskcompleted,
    required this.taskname,
    required this.onChanged,
    required this.deltaskfunction,
    required this.edittaskfunction,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
// Container(height: 0.1,color: Colors.white,),
        Padding(

          padding: const EdgeInsets.fromLTRB(20, 7, 20, 0),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),


            child: Slidable(
              startActionPane: ActionPane(
                extentRatio: 0.2,
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: edittaskfunction,
                    icon: Icons.edit,
                    backgroundColor: Colors.black,
                  )
                ],
              ),
              endActionPane: ActionPane(
                extentRatio: 0.2,
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: deltaskfunction,
                    icon: Icons.delete,
                    backgroundColor: Colors.black,
                  )
                ],
              ),

              child: Container(
                constraints: BoxConstraints(
                    minHeight: 50
                ),


                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 7, 10, 7),
                  child: Row(
                    children: [
                      Checkbox(value: taskcompleted,
                        onChanged: onChanged,
                        activeColor: Colors.blue.shade800,


                      ),


                      Flexible(
                        child: Text(taskname,
                          softWrap: true,
                          style: TextStyle(color: Color(0xff000000),
                              fontSize: 13.5,
                              fontFamily: 'fira-M',

                              decoration: taskcompleted? TextDecoration.lineThrough:TextDecoration.none
                          ),),
                      )

                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent.shade100,
                        Colors.blue.shade200

                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  // color: Colors.transparent,
                  // color: color,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}


// import 'package:flutter/material.dart';

class Popupboxx extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancle;

  Popupboxx({super.key,
    required this.cancle,
    required this.controller,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: Container(
        height: 190,
        child: Column(
          children: [
            Container(height: 50 ,
              child: Text("ADD TASK",style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontFamily: 'fira-M',
              ),

              ),

            ),
            TextField(controller: controller,decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Write a task...",),cursorColor: Colors.black,),

            SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: cancle, child: Text("cancle"),),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: save, child: Text("save"),),


              ],
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

class Popupboxx2 extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancle;

  Popupboxx2({super.key,
    required this.cancle,
    required this.controller,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[100],
      content: Container(
        height: 190,
        child: Column(
          children: [
            Container(height: 50 ,
              child: Text("EDIT TASK",style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontFamily: 'fira-M',
              ),

              ),

            ),
            TextField(controller: controller,decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Write...",),cursorColor: Colors.black,),

            SizedBox(height: 24,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: cancle, child: Text("cancle"),),

                SizedBox(width: 20,),
                ElevatedButton(onPressed: save, child: Text("save"),),

              ],
            )
          ],
        ),
      ),
    );
  }
}







