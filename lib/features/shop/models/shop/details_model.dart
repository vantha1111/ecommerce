import 'package:computer_store/features/shop/models/shop/brand_model.dart';

class DetailModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  double? price;
  double? discount;
  List<Images>? images;
  int? quantity;
  Category? category;
  BrandModel? brand;
  // List<Null>? option;

  DetailModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.price,
      this.discount,
      this.images,
      this.quantity,
      this.category,
      this.brand,
      });

  DetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    quantity = json['quantity'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'];
    // if (json['option'] != null) {
    //   option = <Null>[];
    //   json['option'].forEach((v) {
    //     option!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['brand'] = this.brand;
    // if (this.option != null) {
    //   data['option'] = option!.map((v) => v?.toJson()).toList();
    // }
    return data;
  }
}

class Images {
  String? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class Category {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  Null coverUrl;

  Category(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.coverUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['coverUrl'] = this.coverUrl;
    return data;
  }
}
