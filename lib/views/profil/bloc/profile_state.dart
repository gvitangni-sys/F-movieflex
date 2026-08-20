import 'package:movieflex/models/user_model.dart';

abstract class ProfileState {
  final UserModel user;
  const ProfileState(this.user);
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState(super.user);
}

class ProfileUpdatedState extends ProfileState {
  const ProfileUpdatedState(super.user);
}
