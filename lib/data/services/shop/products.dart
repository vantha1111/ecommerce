
import 'package:computer_store/features/shop/models/shop/brand_model.dart';

class Products {
	List<Data>? data;
	Meta? meta;
	Links? links;

	Products({this.data, this.meta, this.links});

	Products.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = <Data>[];
			json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
		}
		meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
		links = json['links'] != null ? new Links.fromJson(json['links']) : null;
	}

  get images => null;

  get brand => null;

  get name => null;

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
		if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
		if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
		return data;
	}
}

class Data {
	String? id;
	String? createdAt;
	String? updatedAt;
	String? name;
	String? summary;
	num? price;
	Category? category;
	 List<Images>? images;
	BrandModel? brand;
  

	Data({this.id, this.createdAt, this.updatedAt, this.name, this.summary, this.price, this.category, this.images, this.brand});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdAt = json['createdAt'];
		updatedAt = json['updatedAt'];
		name = json['name'];
		summary = json['summary'];
		price = json['price'];
		category = json['category'] != null ? new Category.fromJson(json['category']) : null;
		if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
		brand = json['brand'] != null ? BrandModel.fromJson(json['brand']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['createdAt'] = this.createdAt;
		data['updatedAt'] = this.updatedAt;
		data['name'] = this.name;
		data['summary'] = this.summary;
		data['price'] = this.price;
		if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
		if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Category {
	String? id;
	String? name;

	Category({this.id, this.name});

	Category.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		return data;
	}
}

class Meta {
	int? itemsPerPage;
	int? totalItems;
	int? currentPage;
	int? totalPages;
	List<SortBy>? sortBy;

	Meta({this.itemsPerPage, this.totalItems, this.currentPage, this.totalPages, this.sortBy});

	Meta.fromJson(Map<String, dynamic> json) {
		itemsPerPage = json['itemsPerPage'];
		totalItems = json['totalItems'];
		currentPage = json['currentPage'];
		totalPages = json['totalPages'];
		if (json['sortBy'] != null) {
			sortBy = <SortBy>[];
			json['sortBy'].forEach((v) { sortBy!.add(SortBy.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemsPerPage'] = this.itemsPerPage;
		data['totalItems'] = this.totalItems;
		data['currentPage'] = this.currentPage;
		data['totalPages'] = this.totalPages;
		if (this.sortBy != null) {
      data['sortBy'] = this.sortBy!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SortBy {
  String? field;
  String? direction;

  SortBy({this.field, this.direction});

  SortBy.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['direction'] = this.direction;
    return data;
  }
}


class Links {
	String? current;

	Links({this.current});

	Links.fromJson(Map<String, dynamic> json) {
		current = json['current'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['current'] = this.current;
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
