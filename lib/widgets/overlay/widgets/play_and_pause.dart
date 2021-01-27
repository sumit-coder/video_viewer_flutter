import 'package:flutter/material.dart';
import 'package:video_viewer/data/repositories/video.dart';

enum PlayAndPauseType { center, bottom }

class PlayAndPause extends StatelessWidget {
  const PlayAndPause({
    Key key,
    @required this.type,
    this.padding,
  }) : super(key: key);

  final PlayAndPauseType type;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final query = VideoQuery();
    final style = query.getVideoStyle(context).playAndPauseStyle;
    final video = query.getVideo(context);

    return GestureDetector(
      onTap: video.onTapPlayAndPause,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: padding,
        child: type == PlayAndPauseType.bottom
            ? !video.isPlaying
                ? style.play
                : style.pause
            : !video.isPlaying
                ? style.playWidget
                : style.pauseWidget,
      ),
    );
  }
}
