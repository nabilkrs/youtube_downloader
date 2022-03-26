import 'package:flutter/material.dart';
import 'package:youtube_downloader/youtube_downloader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DownloadVideo(),
    );
  }
}

class DownloadVideo extends StatelessWidget {
  YoutubeDownloader youtubeDownloader = YoutubeDownloader();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<VideoInfo?>(
        future: youtubeDownloader.downloadYoutubeVideo(
            "https://www.youtube.com/watch?v=yX0LzL9SHig", "mp3"),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data?.authorName}"),
                        Text("${snapshot.data?.authorUrl}"),
                        Text("${snapshot.data?.downloadUrl}"),
                        Text("${snapshot.data?.height}"),
                        Text("${snapshot.data?.providerUrl}"),
                        Text("${snapshot.data?.thumbnailHeight}"),
                        Text("${snapshot.data?.thumbnailWidth}"),
                        Text("${snapshot.data?.thumbnailUrl}"),
                        Text("${snapshot.data?.title}"),
                        Text("${snapshot.data?.type}"),
                        Text("${snapshot.data?.width}"),
                      ]),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
