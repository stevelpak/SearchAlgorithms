import 'search_interface.dart';

void main(List<String> args) {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  BinarySearch binary = BinarySearch();

  print(binary.find<num>(nums, 8));
}

class BinarySearch implements SearchAlgorithm {
  @override
  find<T extends Comparable<T>>(List<T> array, T key) {
    return _search(array, key, 0, array.length);
  }

  int _search<T extends Comparable<T>>(
      List<T> array, T key, int left, int right) {
    if (right < left) {
      return -1;
    }

    int median = (left + right) >>> 1;
    int comp = key.compareTo(array[median]);

    if (comp == 0) {
      return median;
    } else if (comp < 0) {
      return _search(array, key, left, median - 1);
    } else {
      return _search(array, key, median + 1, right);
    }
  }
}
