void main() {
  //done Soal 1
  print('// Soal 1');
  List<String> data1 = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List<String> data2 = [
    'JS Racing',
    'amuse',
    'spoon',
    'spoon',
    'JS Racing',
    'amuse'
  ];

  List<String> uniqueData1 = removeDuplicates(data1);
  List<String> uniqueData2 = removeDuplicates(data2);

  print(uniqueData1);
  print(uniqueData2);

  //todo Soal 2
  print('\n// Soal 2');
  List<String> data = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  Map<String, int> frequency = countFrequency(data);

  frequency.forEach((key, value) {
    print('$key: $value');
  });
}

//done Fungsi Soal 1
List<String> removeDuplicates(List<String> data) {
  List<String> uniqueData = [];
  for (String item in data) {
    if (!uniqueData.contains(item)) {
      uniqueData.add(item);
    }
  }
  return uniqueData;
}

//todo Fungsi Soal 2
Map<String, int> countFrequency(List<String> data) {
  Map<String, int> frequency = {};
  for (String item in data) {
    frequency[item] = (frequency[item] ?? 0) + 1;
  }
  return frequency;
}
