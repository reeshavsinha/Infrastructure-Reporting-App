import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/models/user_model.dart';

class AuthStateNotifier extends StateNotifier<AppUser> {
  AuthStateNotifier() : super(AppUser.guest);

  // Simulates logging in with a specific role
  Future<void> login(UserRole role) async {
    // In a real app, you would make an API call here
    if (role == UserRole.civilian) {
      state = const AppUser(
          uid: 'civ123', name: 'Civilian User', role: UserRole.civilian);
    } else if (role == UserRole.government) {
      state = const AppUser(
          uid: 'gov123', name: 'District Officer', role: UserRole.government);
    }
  }

  // Simulates logging out
  void logout() {
    state = AppUser.guest;
  }
}

final authProvider = StateNotifierProvider<AuthStateNotifier, AppUser>((ref) {
  return AuthStateNotifier();
});
