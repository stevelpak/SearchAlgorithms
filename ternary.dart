import 'dart:math';

import 'search_interface.dart';

class TernarySearch implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> arr, T value) {
    return ternarySearch(arr, value, 0, arr.length - 1);
  }

  int ternarySearch<T extends Comparable<T>>(
      List<T> arr, T key, int start, int end) {
    if (start > end) {
      return -1;
    }

    int mid1 = start + (end - start) ~/ 3;

    int mid2 = start + 2 * (end - start) ~/ 3;

    if (key.compareTo(arr[mid1]) == 0) {
      return mid1;
    } else if (key.compareTo(arr[mid2]) == 0) {
      return mid2;
    } else if (key.compareTo(arr[mid1]) < 0) {
      return ternarySearch(arr, key, start, --mid1);
    } else if (key.compareTo(arr[mid2]) > 0) {
      return ternarySearch(arr, key, ++mid2, end);
    } else {
      return ternarySearch(arr, key, mid1, mid2);
    }
  }
}

void main(List<String> args) {
  Random r = Random();

  List<int> integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  TernarySearch search = TernarySearch();
  int atIndex = search.find<num>(integers, 7);
  print(atIndex);
}
