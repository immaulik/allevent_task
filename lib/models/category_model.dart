class CategoryModel {
  String category = "";
  String data = "";

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] ?? "";
    data = json['data'] ?? "";
  }
}
