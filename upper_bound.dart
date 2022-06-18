import 'dart:math';

import 'search_interface.dart';

void main(List<String> args) {
  UpperBound search = UpperBound();
  Random r = Random.secure();

  List<int> integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int atIndex = search.find<num>(integers, 10);
  print(atIndex);
}

class UpperBound implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> array, T key) {
    return search(array, key, 0, array.length - 1);
  }

  int search<T extends Comparable<T>>(
      List<T> array, T key, int left, int right) {
    if (right <= left) {
      return left;
    }

    // find median
    int median = (left + right) >>> 1;
    int comp = key.compareTo(array[median]);

    if (comp < 0) {
      // key is smaller, median position can be a possible solution
      return search(array, key, left, median);
    } else {
      // key we are looking is greater, so we must look on the right of median position
      return search(array, key, median + 1, right);
    }
  }
}
