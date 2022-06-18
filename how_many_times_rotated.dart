import 'dart:io';

void main(List<String> args) {
  HowManyTimesRotated howMany = HowManyTimesRotated();
  int n = int.parse(stdin.readLineSync()!);
  List<int> array = [];

  for (var i = 0; i < n; i++) {
    array.add(int.parse(stdin.readLineSync()!));
  }

  print(
      "The array has been rotated ${howMany.rotated(array, 0, array.length - 1)} times");
}

class HowManyTimesRotated {
  int rotated(List<int> array, int low, int high) {
    int mid = 0;

    if (high < low) {
      return 0;
    }

    if (high == low) {
      return low;
    }

    mid = low + (high - low) ~/ 2;

    if (mid < high && array[mid + 1] < array[mid]) {
      return mid + 1;
    }

    if (mid > low && array[mid] < array[mid - 1]) {
      return mid;
    }

    if (array[high] > array[mid]) {
      return rotated(array, low, mid - 1);
    }

    return rotated(array, mid + 1, high);
  }
}
