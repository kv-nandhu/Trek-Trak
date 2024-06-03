import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trek_trak/domain/user_model.dart';
import 'package:trek_trak/repository/profile_repo/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final imageurl =
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw0B6FsRF9gDGW8njle5S92J&ust=1717064531634000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODKh6y8tIYDFQAAAAAdAAAAABAE";
  ProfileBloc(UserProfileRepo userProfileRepo) : super(ProfileInitial()) {
    on<GetUserEvent>(_profileget);
    on<UploadImageEvent>(_uploadimage);
  }

  Future<void> _profileget(
      GetUserEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {
      var user = await UserProfileRepo().getUser();
      emit(UserProfileLoadState(user: user!));
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> _uploadimage(
      UploadImageEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    try {} catch (e) {}
  }
}
