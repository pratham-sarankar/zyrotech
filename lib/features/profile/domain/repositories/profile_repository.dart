// Project imports:
import 'package:crowwn/features/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  /// Fetches the profile of the currently logged-in user
  /// Returns a [ProfileModel] containing the user's profile data
  /// Throws [ApiError] if the request fails
  Future<ProfileModel> getProfile();
}
