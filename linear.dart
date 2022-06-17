import 'search_interface.dart';

void main(List<String> args) {
  LinearSearch linear = LinearSearch();

  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  print(linear.find<num>(nums, 8));
}

class LinearSearch implements SearchAlgorithm {
  @override
  find<T extends Comparable<T>>(List<T> array, T key) {
    for (var i = 0; i < array.length; i++) {
      if (array[i].compareTo(key) == 0) {
        return i;
      }
    }

    return -1;
  }
}
