class UserModel {
  final String email;
  final String gender;
  final UserName userName;
  final ProfileImage profileImage;

  UserModel({
    required this.email,
    required this.gender,
    required this.userName,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      gender: json['gender'],
      userName: UserName.fromJson(json['name']),
      profileImage: ProfileImage.fromJson(json['picture']),
    );
  }
}

class UserName {
  final String first;
  final String last;

  UserName({
    required this.first,
    required this.last,
  });

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      first: json['first'],
      last: json['last'],
    );
  }
}

class ProfileImage {
  final String large;
  final String medium;

  ProfileImage({
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      medium: json['medium'],
      large: json['large'],
    );
  }
}
