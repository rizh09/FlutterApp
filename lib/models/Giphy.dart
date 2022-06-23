class Giphy {
  List<Data> data;

  Giphy({this.data});

  Giphy.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  Images images;

  Data(
      {this.type,
      this.id,
      this.url,
      this.slug,
      this.bitlyGifUrl,
      this.bitlyUrl,
      this.embedUrl,
      this.username,
      this.source,
      this.title,
      this.rating,
      this.contentUrl,
      this.sourceTld,
      this.sourcePostUrl});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    source = json['source'];
    title = json['title'];
    rating = json['rating'];
    contentUrl = json['content_url'];
    sourceTld = json['source_tld'];
    sourcePostUrl = json['source_post_url'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['url'] = this.url;
    data['slug'] = this.slug;
    data['bitly_gif_url'] = this.bitlyGifUrl;
    data['bitly_url'] = this.bitlyUrl;
    data['embed_url'] = this.embedUrl;
    data['username'] = this.username;
    data['source'] = this.source;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['content_url'] = this.contentUrl;
    data['source_tld'] = this.sourceTld;
    data['source_post_url'] = this.sourcePostUrl;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}

class Images {
  DownsizedLarge downsizedLarge;
  DownsizedLarge fixedHeightSmallStill;
  Original original;
  FixedHeightDownsampled fixedHeightDownsampled;
  DownsizedLarge downsizedStill;
  DownsizedLarge previewWebp;
  DownsizedLarge fixedHeightStill;
  DownsizedLarge downsizedMedium;
  DownsizedLarge downsized;
  FixedHeightDownsampled fixedWidthDownsampled;
  DownsizedLarge fixedWidthSmallStill;
  DownsizedLarge d480wStill;
  DownsizedLarge originalStill;
  DownsizedLarge fixedWidthStill;
  DownsizedLarge previewGif;

  Images(
      {this.downsizedLarge,
      this.fixedHeightSmallStill,
      this.original,
      this.fixedHeightDownsampled,
      this.downsizedStill,
      this.previewWebp,
      this.fixedHeightStill,
      this.downsizedMedium,
      this.downsized,
      this.fixedWidthDownsampled,
      this.fixedWidthSmallStill,
      this.d480wStill,
      this.originalStill,
      this.fixedWidthStill,
      this.previewGif});

  Images.fromJson(Map<String, dynamic> json) {
    downsizedLarge = json['downsized_large'] != null
        ? new DownsizedLarge.fromJson(json['downsized_large'])
        : null;
    fixedHeightSmallStill = json['fixed_height_small_still'] != null
        ? new DownsizedLarge.fromJson(json['fixed_height_small_still'])
        : null;
    original = json['original'] != null
        ? new Original.fromJson(json['original'])
        : null;
    fixedHeightDownsampled = json['fixed_height_downsampled'] != null
        ? new FixedHeightDownsampled.fromJson(json['fixed_height_downsampled'])
        : null;
    downsizedStill = json['downsized_still'] != null
        ? new DownsizedLarge.fromJson(json['downsized_still'])
        : null;
    previewWebp = json['preview_webp'] != null
        ? new DownsizedLarge.fromJson(json['preview_webp'])
        : null;
    fixedHeightStill = json['fixed_height_still'] != null
        ? new DownsizedLarge.fromJson(json['fixed_height_still'])
        : null;
    downsizedMedium = json['downsized_medium'] != null
        ? new DownsizedLarge.fromJson(json['downsized_medium'])
        : null;
    downsized = json['downsized'] != null
        ? new DownsizedLarge.fromJson(json['downsized'])
        : null;

    fixedWidthDownsampled = json['fixed_width_downsampled'] != null
        ? new FixedHeightDownsampled.fromJson(json['fixed_width_downsampled'])
        : null;
    fixedWidthSmallStill = json['fixed_width_small_still'] != null
        ? new DownsizedLarge.fromJson(json['fixed_width_small_still'])
        : null;
    d480wStill = json['480w_still'] != null
        ? new DownsizedLarge.fromJson(json['480w_still'])
        : null;
    originalStill = json['original_still'] != null
        ? new DownsizedLarge.fromJson(json['original_still'])
        : null;
    fixedWidthStill = json['fixed_width_still'] != null
        ? new DownsizedLarge.fromJson(json['fixed_width_still'])
        : null;
    previewGif = json['preview_gif'] != null
        ? new DownsizedLarge.fromJson(json['preview_gif'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.downsizedLarge != null) {
      data['downsized_large'] = this.downsizedLarge.toJson();
    }
    if (this.fixedHeightSmallStill != null) {
      data['fixed_height_small_still'] = this.fixedHeightSmallStill.toJson();
    }
    if (this.original != null) {
      data['original'] = this.original.toJson();
    }
    if (this.fixedHeightDownsampled != null) {
      data['fixed_height_downsampled'] = this.fixedHeightDownsampled.toJson();
    }
    if (this.downsizedStill != null) {
      data['downsized_still'] = this.downsizedStill.toJson();
    }
    if (this.previewWebp != null) {
      data['preview_webp'] = this.previewWebp.toJson();
    }
    if (this.fixedHeightStill != null) {
      data['fixed_height_still'] = this.fixedHeightStill.toJson();
    }
    if (this.downsizedMedium != null) {
      data['downsized_medium'] = this.downsizedMedium.toJson();
    }
    if (this.downsized != null) {
      data['downsized'] = this.downsized.toJson();
    }
    if (this.fixedWidthDownsampled != null) {
      data['fixed_width_downsampled'] = this.fixedWidthDownsampled.toJson();
    }
    if (this.fixedWidthSmallStill != null) {
      data['fixed_width_small_still'] = this.fixedWidthSmallStill.toJson();
    }
    if (this.d480wStill != null) {
      data['480w_still'] = this.d480wStill.toJson();
    }
    if (this.originalStill != null) {
      data['original_still'] = this.originalStill.toJson();
    }
    if (this.fixedWidthStill != null) {
      data['fixed_width_still'] = this.fixedWidthStill.toJson();
    }
    if (this.previewGif != null) {
      data['preview_gif'] = this.previewGif.toJson();
    }
    return data;
  }
}

class DownsizedLarge {
  String height;
  String size;
  String url;
  String width;

  DownsizedLarge({this.height, this.size, this.url, this.width});

  DownsizedLarge.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['size'] = this.size;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class Original {
  String frames;
  String hash;
  String height;
  String mp4;
  String mp4Size;
  String size;
  String url;
  String webp;
  String webpSize;
  String width;

  Original(
      {this.frames,
      this.hash,
      this.height,
      this.mp4,
      this.mp4Size,
      this.size,
      this.url,
      this.webp,
      this.webpSize,
      this.width});

  Original.fromJson(Map<String, dynamic> json) {
    frames = json['frames'];
    hash = json['hash'];
    height = json['height'];
    mp4 = json['mp4'];
    mp4Size = json['mp4_size'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frames'] = this.frames;
    data['hash'] = this.hash;
    data['height'] = this.height;
    data['mp4'] = this.mp4;
    data['mp4_size'] = this.mp4Size;
    data['size'] = this.size;
    data['url'] = this.url;
    data['webp'] = this.webp;
    data['webp_size'] = this.webpSize;
    data['width'] = this.width;
    return data;
  }
}

class FixedHeightDownsampled {
  String height;
  String size;
  String url;
  String webp;
  String webpSize;
  String width;

  FixedHeightDownsampled(
      {this.height, this.size, this.url, this.webp, this.webpSize, this.width});

  FixedHeightDownsampled.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    webp = json['webp'];
    webpSize = json['webp_size'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['size'] = this.size;
    data['url'] = this.url;
    data['webp'] = this.webp;
    data['webp_size'] = this.webpSize;
    data['width'] = this.width;
    return data;
  }
}
