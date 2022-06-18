import 'dart:math';

import 'search_interface.dart';

class JumpSearch implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> array, T key) {
    int length = array.length;
    /* length of array */
    var blockSize = sqrt(length);
    /* block size to be jumped */

    var limit = blockSize;
    while (
        key.compareTo(array[limit.toInt()]) > 0 && limit < array.length - 1) {
      limit = min(limit + blockSize, array.length - 1);
    }

    for (int i = (limit - blockSize).toInt(); i <= limit; i++) {
      if (array[i] == key) {
        /* execute linear search */
        return i;
      }
    }
    return -1;
    /* not found */
  }
}

void main(List<String> args) {
  JumpSearch jumpSearch = JumpSearch();
  List<int> array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int search = jumpSearch.find<num>(array, 4);
  int search1 = jumpSearch.find<num>(array, 11);
  print(search);
  print(search1);
}
