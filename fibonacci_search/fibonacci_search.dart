class Fibonacci {
  int min(int x, int y) {
    return (x <= y) ? x : y;
  }

  int fibonacciSearch(List<int> list, int x, int n) {
    int fibM2 = 0;
    int fibM1 = 1;
    int fibM = fibM2 + fibM1;
    while (fibM < n) {
      fibM2 = fibM1;
      fibM1 = fibM;
      fibM = fibM2 + fibM1;
    }
    int offset = -1;
    while (fibM > 1) {
      int i = min(offset + fibM2, n - 1);
      if (list[i] < x) {
        fibM = fibM1;
        fibM1 = fibM2;
        fibM2 = fibM - fibM1;
        offset = i;
      } else if (list[i] > x) {
        fibM = fibM2;
        fibM1 = fibM1 - fibM2;
        fibM2 = fibM - fibM1;
      } else {
        return i;
      }
    }
    if (fibM1 == 1 && list[n - 1] == x) return n - 1;
    return -1;
  }
}

main(List<String> args) {
  List<int> list = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100, 235];
  int n = list.length;
  int x = 22;

  Fibonacci fibo = Fibonacci();
  int result = fibo.fibonacciSearch(list, x, n);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di Index $result');
}
