
class SearchData  {
  final String id, searchData;
  final Object? extra;

  const SearchData({required this.id, required this.searchData, this.extra});

  @override
  String toString() {
    return 'SearchData( id: $id, searchData: $searchData )';
  }


}

class SearchResult {

 static List<SearchData> search(List<SearchData> data, String query) {
    List<SearchData> results = [];

    results = data
        .where((element) =>
            element.searchData.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return results;
  }
}
