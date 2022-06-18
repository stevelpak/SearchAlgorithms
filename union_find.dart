class UnionFind {
  List<int> _p = [];
  List<int> _r = [];

  unionFind(int n) {
    _p = List.filled(n, 0);
    _r = List.filled(n, 0);

    for (var i = 0; i < n; i++) {
      _p[i] = i;
    }
  }

  int find(int i) {
    int parent = _p[i];

    if (i == parent) {
      return i;
    }

    return _p[i] = find(parent);
  }

  void union(int x, int y) {
    int r0 = find(x);
    int r1 = find(y);

    if (r1 == r0) {
      return;
    }

    if (_r[r0] > _r[r1]) {
      _p[r1] = r0;
    } else if (_r[r1] > _r[r0]) {
      _p[r0] = r1;
    } else {
      _p[r1] = r0;
      _r[r0]++;
    }
  }

  int count() {
    List parents = [];

    for (var i = 0; i < _p.length; i++) {
      if (!parents.contains(find(i))) {
        parents.add(find(i));
      }
    }

    return parents.length;
  }
}
