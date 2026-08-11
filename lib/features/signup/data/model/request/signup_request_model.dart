class SignupRequestModel {
  final String email;
  final String password;
  final String displayName;

  const SignupRequestModel({
    required this.email,
    required this.password,
    required this.displayName,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'displayName': displayName};
  }
}
