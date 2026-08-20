import 'package:movieflex/models/user_model.dart';

abstract class ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UserModel updatedUser;
  UpdateProfileEvent(this.updatedUser);
}

class PickProfileImageEvent extends ProfileEvent {}
