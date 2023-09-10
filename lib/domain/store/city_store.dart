import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/searching/search_data.dart';

import '../entity/entity.dart';

class CityStore extends Cubit<List<Cities>> {
  CityStore() : super([]);

  void setCities(List<Cities> cities) => emit(cities);

  List<SearchData> get citySearchData {
    var data =
        state.map((e) => SearchData(id: e.id, searchData: e.cityName)).toList();

    data.sort((a, b) => a.searchData.length.compareTo(b.searchData.length));
    return data;
  }
}

extension SearchToCity on SearchData {
  Cities get searchToCities => Cities(
        id: id,
        cityName: searchData,
        status: 1,
      );
}
