import 'package:sirialization/models/user.dart';

class History {
  final String createdAt;
  final String history;
  final User user;

  History({
    required this.createdAt,
    required this.history,
    required this.user,
  });

  History.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'],
        history = json['history'],
        user = User.fromJson(json['user']);

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'history': history,
      'user': user,
    };
  }
}
