import 'dart:io';

const double e = 0.01;

main(List<String> args) {
  // ignore: unused_local_variable
  int i, j, k, n;

  List<List<double>> a = List.generate(10, (_) => List.filled(10, 0));
  List<double> x = List.filled(10, 0);
  double sum, temp, error, big;

  print('Enter the number of equations: ');
  n = int.parse(stdin.readLineSync()!);

  print('Enter the co-efficients of the equations: ');
  for (i = 1; i <= n; i++) {
    for (j = 1; j <= n + 1; j++) {
      stdout.write("a[$i][$j]= ");
      a[i][j] = double.parse(stdin.readLineSync()!);
    }
  }
  for (i = 1; i <= n; i++) {
    stdout.write("Masukkan nilai awal x[$i] = ");
    x[i] = double.parse(stdin.readLineSync()!);
  }
  do {
    big = 0;
    for (i = 1; i <= n; i++) {
      sum = 0;
      for (j = 1; j <= n; j++) {
        if (j != i) {
          sum = sum + a[i][j] * x[j];
        }
      }
      temp = (a[i][n + 1] - sum) / a[i][i];
      error = (x[i] - temp).abs();
      if (error > big) {
        big = error;
      }
      x[i] = temp;
      print("x[$i] = ${x[i]}");
    }
  } while (big >= e);
  print('Converges to solution');

  for (i = 1; i <= n; i++) {
    print('x[$i] = ${x[i]}');
  }
}
