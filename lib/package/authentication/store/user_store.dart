 import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/user.dart';

class UserStore extends HydratedCubit<User> {
  UserStore() : super(User.empty);

  void setUser(User user)=> emit(user);



  @override
  User? fromJson(Map<String, dynamic> json) => User.formJson(json);

  @override
  Map<String, dynamic>? toJson(User state) => state.toMap();
}
