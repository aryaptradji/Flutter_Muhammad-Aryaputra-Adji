Future<List<int>> multiplyListAsync(List<int> data, int multiplier) async {
  List<int> multipliedList = [];

  for (int i = 0; i < data.length; i++) {
    int multipliedValue = await multiplyAsync(data[i], multiplier);
    multipliedList.add(multipliedValue);
  }

  return multipliedList;
}

Future<int> multiplyAsync(int value, int multiplier) {
  return Future.delayed(Duration(seconds: 1), () => value * multiplier);
}

// Contoh penggunaan fungsi
void main() {
  List<int> dataList = [1, 2, 3, 4, 5];
  int multiplier = 2;

  multiplyListAsync(dataList, multiplier).then((result) {
    print(result); // Output: [2, 4, 6, 8, 10]
  }).catchError((error) {
    print(error);
  });
}
