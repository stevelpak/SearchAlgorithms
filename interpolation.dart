void main(List<String> args) {
  List<int> array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  InterPolationSearch inter = InterPolationSearch();
  print(inter.find(array, 5));
}

class InterPolationSearch {
  int find(List<int> array, int key) {
    int start = 0, end = array.length - 1;

    while (start <= end && key >= array[start] && key <= array[end]) {
      int pos = start +
          (((end - start) ~/ (array[end] - array[start])) *
              (key - array[start]));
      if (array[pos] == key) {
        return pos;
      }

      if (array[pos] < key) {
        start = pos + 1;
      } else {
        end = pos - 1;
      }
    }

    return -1;
  }
}
