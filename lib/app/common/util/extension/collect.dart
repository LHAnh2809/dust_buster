import 'dart:math';

extension Sillier<T extends num> on Iterable<T> {
  T get rSum => reduce((a, b) => (a + b) as T);

  T get rMax => reduce(max);

  double get avg => rSum / length;
}

extension Silx<T> on Iterable<T>? {
  List? asList<T>() => this != null ? List<T>.from(this!) : null;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  T? get firstOrNull => isNullOrEmpty ? null : this!.first;

  T? findOrFirst(bool Function(T item) finder, {T Function()? orElse}) {
    if (isNullOrEmpty) return null;
    return this!.firstWhere(finder, orElse: () => orElse as T ?? firstOrNull!);
  }

  T? find(bool Function(T item) finder, {T Function()? orElse}) {
    if (isNullOrEmpty) return null;
    return this!.firstWhere(finder, orElse: () => orElse as T);
  }
}

extension Solx on List {
  get rand {
    final size = length;
    final x = min(Random().nextInt(size), size - 1);
    return this[x];
  }

  List<int> pagingCount(stream, {int nullCount = 5, bool notNull = false}) {
    final l = isNotEmpty ? length : (notNull ? 0 : nullCount);
    final x = stream is Stream ? 1 : 0;
    //include separators
    final ls = max(0, l * 2 - 1);
    return [ls + x, ls];
  }

  bool equal(List other) {
    if (length != other.length) return false;
    final l = other.length;
    for (int i = 0; i < l; i++) {
      if (this[i] != other[i]) return false;
    }
    return true;
  }
}

extension Moil on Map {
  bool get isNullOrEmpty => isEmpty;
}
