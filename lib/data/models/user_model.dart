class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String? lastName;
  final String? avatar;
  final String phpInvestBalance;
  final String phpReitBalance;
  final num totalBalance;
  final bool pushNotifications;
  final bool isPhoneVerified;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    this.lastName,
    this.avatar,
    required this.phpInvestBalance,
    required this.phpReitBalance,
    required this.totalBalance,
    required this.pushNotifications,
    required this.isPhoneVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? "no data",
      firstName: json['first_name'] ?? "no data",
      lastName: json['last_name'] ?? "no data",
      avatar: json['avatar'] ?? "no data",
      phpInvestBalance: json['php_invest_balance'] ?? "no data",
      phpReitBalance: json['php_reit_balance'] ?? "no data",
      totalBalance: json['total_balance'] ?? 0,
      pushNotifications: json['push_notifications'] ?? false,
      isPhoneVerified: json['is_phone_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'php_invest_balance': phpInvestBalance,
      'php_reit_balance': phpReitBalance,
      'total_balance': totalBalance,
      'push_notifications': pushNotifications,
      'is_phone_verified': isPhoneVerified,
    };
  }
}
