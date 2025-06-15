// Project imports:
import 'package:crowwn/features/profile/data/models/profile_model.dart';
import 'package:crowwn/utils/api_error.dart';

abstract class ProfileRepository {
  /// Fetches the profile of the currently logged-in user
  /// Returns a [ProfileModel] containing the user's profile data
  /// Throws [ApiError] if the request fails
  Future<ProfileModel> getProfile();

  /// Updates the profile of the currently logged in user
  ///
  /// [fullName] - The new full name
  /// [email] - The new email address
  /// [phoneNumber] - The new phone number
  ///
  /// Returns a [ProfileModel] if successful
  /// Throws [ApiError] if the request fails
  Future<ProfileModel> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
  });
}
