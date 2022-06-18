import 'dart:math';

import 'binary.dart';
import 'search_interface.dart';

class IterativeBinarySearch implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> array, T key) {
    int l, r, k, cmp;

    l = 0;
    r = array.length - 1;

    while (l <= r) {
      k = (l + r) >>> 1;
      cmp = key.compareTo(array[k]);

      if (cmp == 0) {
        return k;
      } else if (cmp < 0) {
        r = --k;
      } else {
        l = ++k;
      }
    }

    return -1;
  }
}

void main(List<String> args) {
  Random r = Random();
  List<int> integers = [
    1,
    2,
    3,
    4,
    4,
    5,
    6,
    6,
    7,
    6,
    4,
    3,
    3,
    4,
    5,
    6,
    6,
    7,
    7,
    7,
    75,
    4565,
    34,
    634,
    34,
    534
  ];
  BinarySearch binarySearch = BinarySearch();
  IterativeBinarySearch search = IterativeBinarySearch();
  int atIndex = search.find<num>(integers, 34);

  print(
      "Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

  int toCheck = binarySearch.find<num>(integers, 7);
  print(
      "Found by system method at an index: $toCheck. Is equal: ${toCheck == atIndex}");
}
