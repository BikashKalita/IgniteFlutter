class GameSearchModel {
  String? name;
  String? slug;
  String? backgroundImage;
  String? backgroundImageRaw;

  GameSearchModel({
    this.name,
    this.slug,
    this.backgroundImage,
    this.backgroundImageRaw,
  });

  GameSearchModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    backgroundImage = json['background_image'];
    backgroundImageRaw = json['background_image_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['background_image'] = this.backgroundImage;
    data['background_image_raw'] = this.backgroundImageRaw;
    return data;
  }
}
