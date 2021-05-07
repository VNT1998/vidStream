import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _CustomHeaderMobile(featuredContent: featuredContent),
      desktop: _CustomHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _CustomHeaderMobile extends StatefulWidget {
  final Content featuredContent;

  const _CustomHeaderMobile({Key key, this.featuredContent}) : super(key: key);

  @override
  __CustomHeaderMobileState createState() => __CustomHeaderMobileState();
}

class __CustomHeaderMobileState extends State<_CustomHeaderMobile> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.4),
          title: Center(child: Text('Info')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'A lonely young woman, Sintel, helps and befriends a dragon,whom she calls Scales. But when he is kidnapped by an adult dragon, Sintel decides to embark on a dangerous quest to find her lost friend Scales.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.headline6,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
              width: 250.0,
              child: Image.asset(widget.featuredContent.titleImageUrl)),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    icon: Icons.add,
                    title: 'List',
                    onTap: () => print("Mylist")),
                CustomIconTextButton(iconName: Icons.play_arrow, title: "Play"),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onTap: () => _showMyDialog()),
              ],
            ))
      ],
    );
  }
}

class _CustomHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _CustomHeaderDesktop({Key key, this.featuredContent}) : super(key: key);

  @override
  __CustomHeaderDesktopState createState() => __CustomHeaderDesktopState();
}

class __CustomHeaderDesktopState extends State<_CustomHeaderDesktop> {
  VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 500.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 250.0,
                    child: Image.asset(widget.featuredContent.titleImageUrl)),
                const SizedBox(width: 15.0),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ]),
                ),
                const SizedBox(width: 20.0),
                Row(
                  children: [
                    CustomIconTextButton(
                      iconName: Icons.play_arrow,
                      title: "Play",
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    CustomIconTextButton(
                        title: "More Info", iconName: Icons.info_outline),
                    if (_videoController.value.isInitialized)
                      IconButton(
                        icon:
                            Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);
                          _isMuted = _videoController.value.volume == 0;
                        }),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
