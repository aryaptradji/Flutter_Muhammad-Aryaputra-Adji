import 'dart:async';

void main() {
  //* Soal 1
  print('// Soal 1');
  List<List<int>> dataList = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];

  Map<int, List<int>> dataMap = {};

  for (int i = 0; i < dataList.length; i++) {
    dataMap[i] = dataList[i];
  }

  print(dataMap);

  //$ Soal 2
  print('\n// Soal 2');
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  double total = 0;
  for (int i = 0; i < nilai.length; i++) {
    total += nilai[i];
  }

  double rataRata = total / nilai.length;
  int rataRataBulat = rataRata.ceil();

  print(rataRataBulat);

  //# Soal 3
  print('\n// Soal 3');
  int input = 5;

  factorialAsync(input).then((result) {
    print(result);
  }).catchError((error) {
    print('Error: $error');
  });
}

//# Fungsi Soal 3
Future<int> factorialAsync(int n) async {
  if (n == 0) {
    return 1;
  } else {
    return n * await factorialAsync(n - 1);
  }
}
