import 'package:computer_store/data/services/shop/products.dart';

class CartModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  num? total;
  List<CartItem>? cartItem;
  num? itemCount;

  CartModel(
      {this.id, this.createdAt, this.updatedAt, this.total, this.cartItem, required this.itemCount});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    total = json['total'];
    if (json['cartItem'] != null) {
      cartItem = <CartItem>[];
      json['cartItem'].forEach((v) {
        cartItem!.add(new CartItem.fromJson(v));
      });
    }
    itemCount = json ['itemCount'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['total'] = this.total;
    if (this.cartItem != null) {
      data['cartItem'] = this.cartItem!.map((v) => v.toJson()).toList();
    }
    data['itemCount'] = this.itemCount;
    return data;
  }
}

class CartItem {
  String? id;
  int? quantity;
  Null productOption;
  Data? product;
  num? amount;

  CartItem(
      {this.id, this.quantity, this.productOption, this.product, this.amount});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    productOption = json['productOption'];
    product =
        json['product'] != null ? Data.fromJson(json['product']) : null;
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['productOption'] = this.productOption;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['amount'] = this.amount;
    return data;
  }
}

