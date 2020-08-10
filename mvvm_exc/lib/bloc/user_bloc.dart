import 'package:mvvm_exc/model/user.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, List<User>> {
  List<User> listUser = [];

  @override
  // TODO: implement initialState
  List<User> get initialState => [];

  @override
  Stream<List<User>> mapEventToState(int userId) async* {
    try {
      User user = await User.getData(userId);
      listUser.add(user);
      yield listUser;
    } catch (_) {}
  }
}
