import 'dart:io';

bool prima(int x) {
  int y;
  bool test;

  if (x < 2)
    test = false;
  else if (x % 2 == 0) {
    if (x == 2)
      test = true;
    else
      test = false;
  } else {
    y = 3;
    test = true;
    while (test && y < x) {
      //do
      if (x % y == 0)
        test = false;
      else
        y = y + 2;
    }
  }
  return test;
}

void main(List<String> args) {
  print('find prime number');
  int value = int.parse(stdin.readLineSync()!);
  bool isRight = prima(value);
  if (isRight == true) {
    print('Value is prime');
  } else {
    print('Value is not prime');
  }
}
