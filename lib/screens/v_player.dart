import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/download1.dart';
import 'package:video_player/video_player.dart';

class VPlayer extends StatefulWidget {
  final String videoURL;
  final String videoName;
  final String imageURL;
  const VPlayer(
      {Key key, this.videoURL, this.videoName, @required this.imageURL})
      : super(key: key);
  @override
  _VPlayerState createState() => _VPlayerState();

  void downloadVideo(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Download1(
            vUrl: videoURL,
            imageUrl: imageURL,
            title: videoName,
          );
        },
      ),
    );
  }
}

class _VPlayerState extends State<VPlayer> {
  VideoPlayerController _videoController;
  int _playbackTime = 0;

  @override
  void initState() {
    super.initState();
    _initPlayer();
    _videoController.addListener(() {
      setState(() {
        _playbackTime = _videoController.value.position.inSeconds;
      });
    });
  }

  void _initPlayer() {
    // _videoController = VideoPlayerController.network(
    //     "http://192.168.0.7:8000/The Big Bang Theory S07E01 The Hofstadter Insufficiency.mkv");
    _videoController = VideoPlayerController.network(widget.videoURL);
    print(widget.videoURL);
    // _videoController = VideoPlayerController.network(
    //     "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4");
    _videoController.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final videoUrl = routeArgs['videoUrl'];
    // final videoName = routeArgs['videoName'];
    // widget.videoURL = videoUrl;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.videoName,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      //body: _playerWidget(),
      body: Center(
          child: _videoController.value.isInitialized
              ? SingleChildScrollView(child: _playerWidget())
              : Container()),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:
    );
  }

  Widget _playerWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
        Slider(
            value: _playbackTime.toDouble(),
            min: 0,
            max: _videoController.value.duration.inSeconds.toDouble(),
            onChanged: (v) {
              _videoController.seekTo(Duration(seconds: v.toInt()));
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                shape: BoxShape.circle,
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  _videoController.value.isPlaying
                      ? _videoController.pause()
                      : _videoController.play();
                  setState(() {});
                },
                child: _videoController.value.isPlaying
                    ? Icon(
                        Icons.pause,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                shape: BoxShape.circle,
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                onPressed: () => widget.downloadVideo(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
