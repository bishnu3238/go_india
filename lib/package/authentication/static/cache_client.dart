class CacheClient {
  final Map<String, Object> _cache;
  CacheClient() : _cache = <String, Object>{};

  void write<T extends Object>({required String key, required Object value}) =>
      _cache[key] = value;

  T? read<T extends Object>(String key) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
