import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoInfo {
  int? height;
  String? providerUrl;
  String? type;
  String? authorUrl;
  String? authorName;
  String? thumbnailUrl;
  String? title;
  int? width;
  int? thumbnailWidth;
  int? thumbnailHeight;
  String? downloadUrl;

  VideoInfo(
      {this.height,
      this.providerUrl,
      this.type,
      this.authorUrl,
      this.authorName,
      this.thumbnailUrl,
      this.title,
      this.width,
      this.thumbnailWidth,
      this.thumbnailHeight,
      this.downloadUrl});

  VideoInfo.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    providerUrl = json['provider_url'];
    type = json['type'];
    authorUrl = json['author_url'];
    authorName = json['author_name'];
    thumbnailUrl = json['thumbnail_url'];
    title = json['title'];
    width = json['width'];
    thumbnailWidth = json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'];
    downloadUrl = json['downloadUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = height;
    data['provider_url'] = providerUrl;
    data['type'] = type;
    data['author_url'] = authorUrl;
    data['author_name'] = authorName;
    data['thumbnail_url'] = thumbnailUrl;
    data['title'] = title;
    data['width'] = width;
    data['thumbnail_width'] = thumbnailWidth;
    data['thumbnail_height'] = thumbnailHeight;
    data['downloadUrl'] = downloadUrl;
    return data;
  }
}

class YoutubeDownloader {
  Future<VideoInfo?> downloadYoutubeVideo(String url, String format,
      [int? startTime = 0, int? endTime = 0]) async {
    try {
      http.Response globalResponse = await http.get(Uri.parse(
          "https://youtubedownloaderapii.herokuapp.com/?url=$url&format=$format&startTime=$startTime&endTime=$endTime"));

      if (globalResponse.statusCode == 200) {
        final result = json.decode(globalResponse.body);

        return VideoInfo.fromJson(result[0]);
      } else {
        throw Exception('Something went wrong, Please try again');
      }
    } catch (e) {
      throw Exception('Something went wrong, Please try again');
    }
  }

  bool isValidYoutubeUrl(String url) {
    if (url.contains("https://www.youtube.com/watch?v") ||
        url.contains("https://youtu.be/") ||
        url.contains("http://www.youtube.com/watch?v") ||
        url.contains("http://youtu.be/")) {
      return true;
    } else {
      return false;
    }
  }
}
