class SignupResponseModel {
  final String? userId;
  final String? message;

  const SignupResponseModel({required this.userId, required this.message});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      userId: json['userId'] as String?,
      message: json['message'] as String?,
    );
  }
}
