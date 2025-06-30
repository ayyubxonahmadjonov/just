class CategoryModel {
  final int id;
  final String name;
  final String categoryType;
  final String? categoryTypeDisplay;
  final bool? isActive;

  CategoryModel({
    required this.id,
    required this.name,
    required this.categoryType,
    this.categoryTypeDisplay,
    this.isActive,
  });

  // JSONdan modelga
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      categoryType: json['category_type'] as String,
      categoryTypeDisplay: json['category_type_display'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }

  // modeldan JSONga
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_type': categoryType,
      'category_type_display': categoryTypeDisplay,
      'is_active': isActive,
    };
  }
}
