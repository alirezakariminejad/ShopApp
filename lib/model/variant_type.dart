class VariantType {
  String? id;
  String? name;
  String? title;
  String? type;

  VariantType(this.id, this.name, this.title, this.type);

  factory VariantType.fromMapJson(Map<String, dynamic> jsonObject) {
    return VariantType(
      jsonObject["id"],
      jsonObject["name"],
      jsonObject["title"],
      jsonObject["type"],
    );
  }
}
