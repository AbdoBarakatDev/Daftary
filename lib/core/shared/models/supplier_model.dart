class SupplierModel {
  final int id;
  final String? name;
  final String? phone;
  final double? get;
  final double? give;
  // final List<TransactionModel>? transactions;
  SupplierModel({required this.id, this.name, this.phone, this.get, this.give});
  factory SupplierModel.fromJson(Map<String, dynamic> parsedJson) {
    return SupplierModel(
      id: parsedJson["id"] ?? 0,
      name: parsedJson["name"] ?? "",
      phone: parsedJson["phone"] ?? "",
      give: parsedJson["give"] ?? 0.0,
      get: parsedJson["get"] ?? 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "give": phone,
      "get": get,
    };
  }
}
