class PerfectBinarySearch {
  int binarySearch(List<int> arr, int target) {
    int low = 0;
    int high = arr.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (arr[mid] == target) {
        return mid;
      } else if (arr[mid] > target) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
    return -1;
  }
}

void main(List<String> args) {
  PerfectBinarySearch BinarySearch = PerfectBinarySearch();
  List<int> array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(BinarySearch.binarySearch(array, 11));
  print(BinarySearch.binarySearch(array, 7));
}
