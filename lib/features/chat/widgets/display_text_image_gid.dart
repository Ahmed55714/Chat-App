// ignore_for_file: non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat/features/chat/widgets/video_player_item.dart';
import 'package:flutter/material.dart';

import '../../../common/enums/message_enum.dart';

class DisplayTextImageGIF extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayTextImageGIF(
      {Key? key, required this.message, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.audio
            ? StatefulBuilder(builder: (context, SetState) {
                return IconButton(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                      SetState(() {
                        isPlaying = false;
                      });
                    } else {
                      await audioPlayer.play(UrlSource(message));
                      SetState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                  ),
                );
              })
            : type == MessageEnum.video
                ? VideoPlayerItem(videoUrl: message)
                : type == MessageEnum.gif
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23),
                            topRight: Radius.circular(23),
                            bottomLeft: Radius.circular(23)),
                        child: CachedNetworkImage(imageUrl: message))
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23),
                            topRight: Radius.circular(23),
                            bottomLeft: Radius.circular(23)),
                        child: CachedNetworkImage(
                          imageUrl: message,
                        ),
                      );
  }
}
