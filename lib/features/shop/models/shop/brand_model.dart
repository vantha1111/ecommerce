
class BrandModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? logoUrl;

  BrandModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.logoUrl});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    logoUrl = json['logoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['logoUrl'] = this.logoUrl;
    return data;
  }
}

