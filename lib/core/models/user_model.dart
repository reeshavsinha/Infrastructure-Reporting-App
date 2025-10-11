enum UserRole { guest, civilian, government }

class AppUser {
  final String uid;
  final String name;
  final UserRole role;

  const AppUser({required this.uid, required this.name, required this.role});

  // A guest user for when no one is logged in
  static const guest =
      AppUser(uid: 'guest', name: 'Guest', role: UserRole.guest);
}
