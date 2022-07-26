class StudentValidationMixin {

  String validateFirstName(String value){
    if(value.length<2){
      return "Geçersiz isim";
    }
    else{
      return value;
    }
  }
}