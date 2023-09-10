import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class Hydrated {
  Hydrated._();
  static final Hydrated _instance = Hydrated._();
 static Hydrated get instance => _instance;

  initialize() async {
    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            :await getApplicationDocumentsDirectory());
  }
}
