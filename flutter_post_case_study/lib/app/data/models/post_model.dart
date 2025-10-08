import 'package:flutter_post_case_study/core/extensions/string_extensions.dart';

class PostModel {
  PostModel({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.status,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
    required this.userId,
  }) {
    readingTimeText = (content?.isNotEmpty == true)
        ? "${content!.readingTime()} min read"
        : '';
    publishedDateText = publishedAt?.toFormattedDate() ?? '';
  }
  final int? id;
  final String? slug;
  final String? url;
  final String? title;
  final String? content;
  final String? image;
  final String? thumbnail;
  final String? status;
  final String? category;
  final String? publishedAt;
  final String? updatedAt;
  final int? userId;

  late final String readingTimeText;
  late final String publishedDateText;


  PostModel copyWith({
    int? id,
    String? slug,
    String? url,
    String? title,
    String? content,
    String? image,
    String? thumbnail,
    String? status,
    String? category,
    String? publishedAt,
    String? updatedAt,
    int? userId,
  }) {
    return PostModel(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      url: url ?? this.url,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      thumbnail: thumbnail ?? this.thumbnail,
      status: status ?? this.status,
      category: category ?? this.category,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"] as int?,
      slug: json["slug"]?.toString(),
      url: json["url"]?.toString(),
      title: json["title"]?.toString(),
      content: json["content"]?.toString(),
      image: json["image"]?.toString(),
      thumbnail: json["thumbnail"]?.toString(),
      status: json["status"]?.toString(),
      category: json["category"]?.toString(),
      publishedAt: json["publishedAt"]?.toString(),
      updatedAt: json["updatedAt"]?.toString(),
      userId: json["userId"] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "url": url,
    "title": title,
    "content": content,
    "image": image,
    "thumbnail": thumbnail,
    "status": status,
    "category": category,
    "publishedAt": publishedAt,
    "updatedAt": updatedAt,
    "userId": userId,
  };

  @override
  String toString() {
    return "$id, $slug, $url, $title, $content, $image, $thumbnail, $status, $category, $publishedAt, $updatedAt, $userId";
  }
}
