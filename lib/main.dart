import 'package:flutter/material.dart';
import 'package:fund_widget/Screens/student_add.dart';
import 'package:fund_widget/models/student.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
  //return _MyAppState(); //aynı şey
}

class _MyAppState extends State<MyApp> {
  String mesaj="LOGIN";
  Student chosenStudent=Student.withId(0 ,"","",0);
  // ignore: prefer_collection_literals
  List<Student> students=[Student.withId(1,"Rümeysa","Ceylan",95),
    Student.withId(2,"merve","Ceylan",15),Student.withId(3,"ayse","koç",45)];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        backgroundColor: Colors.deepOrange,
      ),
      body: buildBody(context),
      backgroundColor: Colors.white70,


    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2020/06/10/02/22/caricature-5280770_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName+" "+students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : "+students[index].grade.toString()+" "+students[index].getStatus),
                    trailing : buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState((){
                        chosenStudent=students[index];

                      } );
                      print(students[index].firstName+" "+students[index].lastName);

                    },
                  );

                }
            )

        ),
    Text(chosenStudent.firstName+ " "+chosenStudent.lastName),
        Row(
          children: <Widget>[
            Flexible(
              fit:FlexFit.tight,
              flex:1,
              child:  RaisedButton(
                color: Colors.lightGreenAccent,
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));


                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("New"),
                    ],
                  ),
                ),

            ),Flexible(
              fit:FlexFit.tight,
              flex:1,
              child:  RaisedButton(
                color: Colors.amberAccent,
                onPressed: () {
                  var message="Güncellendi";
                  alert(message, context);

                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Update"),
                  ],
                ),
              ),

            ),Flexible(
              fit:FlexFit.tight,
              flex:1,
              child:  RaisedButton(
                color: Colors.redAccent,
                onPressed: () {
                  setState((){
                    students.remove(chosenStudent);
                    var message="silindi : "+chosenStudent.firstName+ " "+chosenStudent.lastName;
                    alert(message, context);
                  });

                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Delete"),
                  ],
                ),
              ),

            )
          ],

        ),



      ],
    );


  }

 Widget buildStatusIcon(int grade) {
   if(grade>=50){
     return Icon(Icons.done);
   }
   else if(grade>=40){
     return Icon(Icons.album);
   }
   else{
     return Icon(Icons.clear);
   }
 }
}
String examCalc(int puan){
  String message="";
  if(puan>=50){
    message="Geçti";
  }
  else if(puan>=40){
    message="bütünleme";
  }
  else{
    message="kaldı";
  }
  return message;
}
void alert(String message,BuildContext context){

  var alert=AlertDialog(
    title: Text("İşlem sonucu"),
    content: Text(message),
  );
  showDialog(context: context, builder: (BuildContext context)=>alert);

}