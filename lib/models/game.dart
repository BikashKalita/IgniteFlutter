class GamesInfo {
  static List<GameModel>? games;
}

class GameModel {
  String? name;
  String? slug;
  String? backgroundImage;
  String? backgroundImageRaw;
  Clip? clip;

  GameModel(
      {this.name,
      this.slug,
      this.backgroundImage,
      this.backgroundImageRaw,
      this.clip});

  GameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    backgroundImage = json['background_image'];
    backgroundImageRaw = json['background_image_raw'];
    clip = json['clip'] != null ? new Clip.fromJson(json['clip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['background_image'] = this.backgroundImage;
    data['background_image_raw'] = this.backgroundImageRaw;
    if (this.clip != null) {
      data['clip'] = this.clip!.toJson();
    }
    return data;
  }
}

class Clip {
  String? clip;
  Clips? clips;
  String? video;
  String? preview;

  Clip({this.clip, this.clips, this.video, this.preview});

  Clip.fromJson(Map<String, dynamic> json) {
    clip = json['clip'];
    clips = json['clips'] != null ? new Clips.fromJson(json['clips']) : null;
    video = json['video'];
    preview = json['preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clip'] = this.clip;
    if (this.clips != null) {
      data['clips'] = this.clips!.toJson();
    }
    data['video'] = this.video;
    data['preview'] = this.preview;
    return data;
  }
}

class Clips {
  String? s320;
  String? s640;
  String? full;

  Clips({this.s320, this.s640, this.full});

  Clips.fromJson(Map<String, dynamic> json) {
    s320 = json['320'];
    s640 = json['640'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['320'] = this.s320;
    data['640'] = this.s640;
    data['full'] = this.full;
    return data;
  }
}
