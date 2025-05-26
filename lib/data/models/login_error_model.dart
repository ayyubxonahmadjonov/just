class ErrorModel {
  final String error;
  final int? code;

  ErrorModel({required this.error, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: json['error'] as String,
      code: json['code'] != null ? json['code'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'error': error, if (code != null) 'code': code};
  }
}
