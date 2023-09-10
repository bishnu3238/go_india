import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../package/package.dart';
import '../../utility/utility/utility.dart';

class Search<T> extends SearchDelegate<T> {
  Search({
    String? label,
    required this.data,
  }) : super(searchFieldLabel: label ?? _label);

  List<SearchData> data;

  static const String _label = 'Search ...';

  @override
  ThemeData appBarTheme(BuildContext context) => searchAppBarThemeData;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = "",
          icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null as T),
        icon: const FaIcon(FontAwesomeIcons.arrowLeft));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SearchData> suggestions = SearchResult.search(data, query);
    return Suggestions(
      searchData: suggestions,
      onTap: (data) => close(context, data as T),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Suggestions(
        searchData: data,
        onTap: (data) => close(context, data as T),
      );
    }

    List<SearchData> suggestions = SearchResult.search(data, query);
    return Suggestions(
      searchData: suggestions,
      onTap: (data) => close(context, data as T),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({
    super.key,
    required this.onTap,
    required this.searchData,
  });

  final List<SearchData> searchData;
  final Function(SearchData) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: searchData.length,
        itemBuilder: (context, index) {
          return ListTile(
              dense: true,
              onTap: () => onTap(searchData[index]),
              title: Text(
                searchData[index].searchData,
                style: inter(
                  weight: fw5,
                  size: getScreenWidth(kLayoutWidth * 1 / 20),
                ),
              ));
        },
      ),
    );
  }
}
