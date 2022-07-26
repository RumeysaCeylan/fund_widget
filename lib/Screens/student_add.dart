import 'package:flutter/material.dart';
import 'package:fund_widget/models/student.dart';
import 'package:fund_widget/validation/studentValidator.dart';

class StudentAdd extends StatefulWidget{
 /* List<Student> students;
  StudentAdd(List<Student> students){
    this.students=students;
  }*/
  @override
  State<StatefulWidget> createState() {

    return _studentAddState();
  }

}

class _studentAddState extends State<StudentAdd> with StudentValidationMixin{
  //List<Student> students;

  var student= Student.withoutInfo();
  var formKey=GlobalKey<FormState>();

/*  _studentAddState(List<Student> students){
    this.students=students;
  }*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      )
      );

  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı ",hintText:"RÜMEYSA" ),
      //validator: validateFirstName(student.firstName),
      onSaved: (String? value){
        student.firstName=value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı ",hintText:"Ceylan" ),
    //  validator: validateFirstName(student.firstName),
      onSaved: (String? value){
        student.lastName=value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci notu ",hintText:"75" ),
      //validator: validateFirstName(student.firstName),
      onSaved: (String? value){
        student.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
        child:Text("Kaydet"),
        onPressed: (){
        //if(formKey.currentState.validate()){
          formKey.currentState!.save();
          saveStudent();


          Navigator.pop(context);
       // }
    },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }


}