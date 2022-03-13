class GameDetails {
  int? id;
  String? name;
  double? rating;
  List<ParentPlatforms>? parentPlatforms;
  String? backgroundImage;
  String? backgroundImageRaw;
  String? description;
  String? descriptionRaw;
  List<Screenshots>? screenshots;

  GameDetails(
      {this.id,
      this.name,
      this.rating,
      this.parentPlatforms,
      this.backgroundImage,
      this.backgroundImageRaw,
      this.description,
      this.descriptionRaw,
      this.screenshots});

  GameDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    if (json['parent_platforms'] != null) {
      parentPlatforms = <ParentPlatforms>[];
      json['parent_platforms'].forEach((v) {
        parentPlatforms!.add(new ParentPlatforms.fromJson(v));
      });
    }
    backgroundImage = json['background_image'];
    backgroundImageRaw = json['background_image_raw'];
    description = json['description'];
    descriptionRaw = json['description_raw'];
    if (json['screenshots'] != null) {
      screenshots = <Screenshots>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(new Screenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    if (this.parentPlatforms != null) {
      data['parent_platforms'] =
          this.parentPlatforms!.map((v) => v.toJson()).toList();
    }
    data['background_image'] = this.backgroundImage;
    data['background_image_raw'] = this.backgroundImageRaw;
    data['description'] = this.description;
    data['description_raw'] = this.descriptionRaw;
    if (this.screenshots != null) {
      data['screenshots'] = this.screenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParentPlatforms {
  Platform? platform;

  ParentPlatforms({this.platform});

  ParentPlatforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? new Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? slug;

  Platform({this.id, this.name, this.slug});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Screenshots {
  int? id;
  String? image;
  int? width;
  int? height;
  bool? isDeleted;
  String? imageRaw;

  Screenshots(
      {this.id,
      this.image,
      this.width,
      this.height,
      this.isDeleted,
      this.imageRaw});

  Screenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    width = json['width'];
    height = json['height'];
    isDeleted = json['is_deleted'];
    imageRaw = json['image_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['width'] = this.width;
    data['height'] = this.height;
    data['is_deleted'] = this.isDeleted;
    data['image_raw'] = this.imageRaw;
    return data;
  }
}
