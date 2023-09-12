class UserProfileData {
  String name;
  String bio;

  UserProfileData({required this.name, required this.bio});

  void updateProfile(String newName, String newBio) {
    name = newName;
    bio = newBio;
  }
}
