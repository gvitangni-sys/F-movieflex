import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieflex/models/user_model.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ImagePicker _picker = ImagePicker();

  ProfileBloc()
    : super(
        const ProfileInitialState(
          UserModel(
            fullName: "Andrew Anesley",
            nickname: "Andrew",
            email: "andrew.anesley@gmail.com",
            phone: "+225 0102002020",
            gender: "Male",
            country: "Côte d'Ivoire",
          ),
        ),
      ) {
    on<UpdateProfileEvent>((event, emit) {
      emit(ProfileUpdatedState(event.updatedUser));
    });

    on<PickProfileImageEvent>((event, emit) async {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality:
              80, // Optionnel : réduit la taille pour éviter la surcharge mémoire
        );

        if (pickedFile != null) {
          final updatedUser = state.user.copyWith(imagePath: pickedFile.path);
          emit(ProfileUpdatedState(updatedUser));
        }
      } catch (e) {
        // Capture l'erreur native ou de permission sans faire crasher le BLoC
        print("Erreur lors de la sélection de l'image : $e");
      }
    });
  }
}
