int factorial(int value){
  if(value == 1){
    return 1;
  }else{
    return value * factorial(value - 1);
  }
}

void main(){
  print(factorial(10));
  print(factorial(20));
  print(factorial(30));
}