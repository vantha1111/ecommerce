class Categories {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? coverUrl;

  Categories({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.coverUrl
  });
  

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['description'] = description;
    data['coverUrl'] = coverUrl;
    return data;
  }
}
  

  
class Cover {
  String? id;
  String? path;
  String? url;

  Cover({this.id, this.path, this.url});

  Cover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}

