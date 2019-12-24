
import 'package:flutter_paging/flutter_paging.dart';

abstract class PagedRepository {
  DataSource<T> createPaged<T>(
      Future<List<T>> Function(int index) load, int pageSize,
      {int startIndex = 1}) {
    return DataSource(load, pageSize, startIndex);
  }
}

class DataSource<T> extends KeyedDataSource<T> {
  final Future<List<T>> Function(int index) _load;
  final int _pageSize;
  int _currentIndex;

  DataSource(this._load, this._pageSize, this._currentIndex);

  @override
  Future<List<T>> loadInitial() {
    return loadNext();
  }

  @override
  Future<List<T>> loadAfter(T value) {
    return loadNext();
  }

  Future<List<T>> loadNext() async {
    try {
      return await _load(_currentIndex++);
    } on Exception {
      _currentIndex--;
      rethrow;
    }
  }

  @override
  int get pageSize => _pageSize;
}
