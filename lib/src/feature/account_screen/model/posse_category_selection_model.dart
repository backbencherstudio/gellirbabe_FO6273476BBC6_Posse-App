class PosseCategorySelectionModel {
  final String categoryName;
  final bool isSelected;
  PosseCategorySelectionModel({
    required this.categoryName,
    required this.isSelected,
  });

  factory PosseCategorySelectionModel.fromJson(Map<String, dynamic> json) =>
      PosseCategorySelectionModel(
        categoryName: json["categoryName"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "isSelected": isSelected,
  };

  PosseCategorySelectionModel copyWith({
    String? categoryName,
    bool? isSelected,
  }) {
    return PosseCategorySelectionModel(
      categoryName: categoryName ?? this.categoryName,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
