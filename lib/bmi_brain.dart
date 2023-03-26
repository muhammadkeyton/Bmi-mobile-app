import 'dart:math';

class Bmi{

  
  
  final int height;
  final int weight;

  double _bmi = 0.0;

  Bmi({required this.height, required this.weight});

  

  String calculateBmi(){
    _bmi = weight / pow(height/100,2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }


  String getResult(){
    if(_bmi >= 25.0 ){
      return 'OverWeight';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25.0 ){
      return 'this is too much,you need to exercise more!';
    }else if (_bmi > 18.5){
      return 'Good job,you are healthy!';
    }else{
      return 'ooh no! your bmi is low,you should start eating more!';
    }
  }


}