youtube\_downloader
===================

youtube\_downloader is a Flutter package that allows the developers to download youtube videos in several formats such as mp3 and mp4. You can define from videos boundaries which means you can download only a part from the while video. In fact this feature automatically trim and delete the unwanted parts from the video. Also, this feature is applicable on mp3 formats.

### Features

*   Get all information about youtube any youtube video.
*   Navigate to youtube video and provide downloading url.
*   Provide other information about youtube video such as thumbnail images and their dimensions.
*   Support Multiple formats such as mp3 and mp4.


Usage
-----
```dart
FutureBuilder<VideoInfo>(
        future: youtubeDownloader.downloadYoutubeVideo(
            "https://www.youtube.com/watch?v=CLn45NV6onE", "mp3"),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ElevatedButton(
                  onPressed: () {
                    print(snapshot.data?.authorName);
                    print(snapshot.data?.authorUrl);
                    print(snapshot.data?.downloadUrl);
                    print(snapshot.data?.height);
                    print(snapshot.data?.html);
                    print(snapshot.data?.providerUrl);
                    print(snapshot.data?.thumbnailHeight);
                    print(snapshot.data?.thumbnailWidth);
                    print(snapshot.data?.thumbnailUrl);
                    print(snapshot.data?.title);
                    print(snapshot.data?.type);
                    print(snapshot.data?.width);
                  },
                  child: const Text("Download Video"))
              : const CircularProgressIndicator();
        },
      ),
```

Author: [Nabil Krissane](https://linktr.ee/nabilkrs)
------

------
[![](https://i.ibb.co/dJ7KGwF/avatars-000146225244-3a983t-t500x500.jpg)](https://www.patreon.com/nabilkrs)