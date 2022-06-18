import 'dart:math';

import 'search_interface.dart';
import 'binary.dart';

class IterativeTernarySearch implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> array, T key) {
    int left = 0;
    int right = array.length - 1;

    while (right > left) {
      int leftCmp = array[left].compareTo(key);
      int rightCmp = array[right].compareTo(key);
      if (leftCmp == 0) {
        return left;
      }
      if (rightCmp == 0) {
        return right;
      }

      int leftThird = left + (right - left) ~/ 3 + 1;
      int rightThird = right - (right - left) ~/ 3 - 1;

      if (array[leftThird].compareTo(key) <= 0) {
        left = leftThird;
      } else {
        right = rightThird;
      }
    }

    return -1;
  }
}

void main(List<String> args) {
  // just generate data
  Random r = Random();
  List<int> integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 10];
  IterativeTernarySearch search = IterativeTernarySearch();
  BinarySearch binarySearch = BinarySearch();

  int atIndex = search.find<num>(integers, 7);

  print(
      "Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");
  int toCheck = binarySearch.find<num>(integers, 7);
  print(
      "Found by system method at an index: $toCheck. Is equal: ${toCheck == atIndex}");
}
