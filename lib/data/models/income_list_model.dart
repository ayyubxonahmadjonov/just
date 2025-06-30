class IncomeModel {
  final int id;
  final String userName;
  final int category;
  final String categoryName;
  final String amount;
  final String date;
  final DateTime createdAt;

  IncomeModel({
    required this.id,
    required this.userName,
    required this.category,
    required this.categoryName,
    required this.amount,
    required this.date,
    required this.createdAt,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      id: json['id'],
      userName: json['user_name'] ?? "",
      category: json['category'],
      categoryName: json['category_name'],
      amount: json['amount'],
      date: json['date'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'category': category,
      'category_name': categoryName,
      'amount': amount,
      'date': date,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
