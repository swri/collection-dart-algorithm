import 'dart:io';

void stressen() {
  List<List<int>> a = List.generate(2, (_) => List.filled(2, 0));
  List<List<int>> b = List.generate(2, (_) => List.filled(2, 0));
  List<List<int>> c = List.generate(2, (_) => List.filled(2, 0));
  int m1, m2, m3, m4, m5, m6, m7;
  int n = 2;
  int i;
  int j;
  print('Masukan 4 element matrix pertama: ');
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      a[i][j] = int.parse(stdin.readLineSync()!);
    }
  }
  print('Masukan 4 element matrix kedua: ');
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      b[i][j] = int.parse(stdin.readLineSync()!);
    }
  }
  print('Matrix pertama');
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      stdout.write(' ${a[i][j]} ');
    }
  }
  print('\nMatrix kedua');
  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      stdout.write(' ${b[i][j]} ');
    }
  }
  m1 = (a[0][0] + a[1][1]) * (b[0][0] + b[1][1]);
  m2 = (a[1][0] + a[1][1]) * b[0][0];
  m3 = a[0][0] * (b[0][1] - b[1][1]);
  m4 = a[1][1] * (b[1][0] - b[0][0]);
  m5 = (a[0][0] + a[0][1]) * b[1][1];
  m6 = (a[1][0] - a[0][0]) * (b[0][0] + b[0][1]);
  m7 = (a[0][1] - a[1][1]) * (b[1][0] + b[1][1]);

  c[0][0] = m1 + m4 - m5 + m7;
  c[0][1] = m3 + m5;
  c[1][0] = m2 + m4;
  c[1][1] = m1 - m2 + m3 + m6;

  print('\nResult of multiplication: ');
  for (i = 0; i < 2; i++) {
    for (j = 0; j < 2; j++) {
      print(c[i][j]);
    }
  }
}

main(List<String> args) {
  stressen();
}
