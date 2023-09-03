void main() {
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
}
