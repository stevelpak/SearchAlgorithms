void main(List<String> args) {
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  SaddleBackSearch saddle = SaddleBackSearch();
  print(saddle.find(matrix, 0, 1, 3));
}

class SaddleBackSearch {
  List<int> find(List<List<int>> array, int row, int col, int key) {
    List<int> ans = [-1, -1];

    if (row < 0 || col >= array[row].length) {
      return ans;
    }

    if (array[row][col] == key) {
      ans[0] = row;
      ans[1] = col;
      return ans;
    } else if (array[row][col] > key) {
      return find(array, row - 1, col, key);
    }

    return find(array, row, col + 1, key);
  }
}
