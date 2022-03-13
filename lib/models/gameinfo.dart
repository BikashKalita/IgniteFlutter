import 'dart:convert';

GameDetailsModel gameDetailsModelFromJson(String str) =>
    GameDetailsModel.fromJson(json.decode(str));

String gameDetailsModelToJson(GameDetailsModel data) =>
    json.encode(data.toJson());

class GameDetailsModel {
  GameDetailsModel({
    this.id,
    this.name,
    this.rating,
    this.parentPlatforms,
    this.backgroundImage,
    this.backgroundImageRaw,
    this.description,
    this.descriptionRaw,
    this.screenshots,
  });

  int? id;
  String? name;
  double? rating;
  List<ParentPlatform>? parentPlatforms;
  String? backgroundImage;
  String? backgroundImageRaw;
  String? description;
  String? descriptionRaw;
  List<Screenshot>? screenshots;

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) =>
      GameDetailsModel(
        id: json["id"],
        name: json["name"],
        rating: json["rating"].toDouble(),
        parentPlatforms: List<ParentPlatform>.from(
            json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        backgroundImage: json["background_image"],
        backgroundImageRaw: json["background_image_raw"],
        description: json["description"],
        descriptionRaw: json["description_raw"],
        screenshots: List<Screenshot>.from(
            json["screenshots"].map((x) => Screenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "parent_platforms":
            List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "background_image": backgroundImage,
        "background_image_raw": backgroundImageRaw,
        "description": description,
        "description_raw": descriptionRaw,
        "screenshots": List<dynamic>.from(screenshots!.map((x) => x.toJson())),
      };
}

class ParentPlatform {
  ParentPlatform({
    required this.platform,
  });

  Platform platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: Platform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class Platform {
  Platform({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Screenshot {
  Screenshot({
    required this.id,
    required this.image,
    required this.width,
    required this.height,
    required this.isDeleted,
    required this.imageRaw,
  });

  int id;
  String image;
  int width;
  int height;
  bool isDeleted;
  String imageRaw;

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
        width: json["width"],
        height: json["height"],
        isDeleted: json["is_deleted"],
        imageRaw: json["image_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "width": width,
        "height": height,
        "is_deleted": isDeleted,
        "image_raw": imageRaw,
      };
}
