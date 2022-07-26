class Student{
  int id=0;
  String firstName="";
  String lastName="";
  int grade=0;
  String status="Geçti";
  Student.withId(int id,String firstName,String lastName,int grade){
    this.id=id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }
  Student.withoutInfo(){

  }
  Student( String firstName,String lastName,int grade){
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }
  String get getFirstName{
    return this.firstName;
  }
  void set setFirstName(String firstName){
    this.firstName=firstName;
  }
  String get getStatus{
    String message="";
    if(this.grade>=50){
      message="Geçti";
    }
    else if(this.grade>=40){
      message="bütünleme";
    }
    else{
      message="kaldı";
    }
    return message;
  }

}