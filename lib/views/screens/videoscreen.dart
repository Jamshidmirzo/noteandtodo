import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoscreen extends StatefulWidget {
  final Map<String, dynamic> lessons; // Specify the type for lessons
  const Videoscreen({super.key, required this.lessons});

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final url = widget.lessons['videolesson'];
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lessons['title']),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: Text(
                    'Sunt proidentReprehenderit minim sit adipisicing elit voluptate aute adipisicing excepteur amet anim reprehenderit sunt esse anim.Dolore laboris sint culpa esse voluptate ea occaecat excepteur incididunt laborum nisi.Id reprehenderit minim velit officia.Qui Lorem dolore irure cupidatat. eiusmod pariatur amet magna veniam pariatur ex nisi qui commodo consequat cupidatat.In proident adipisicing duis veniam est.Aliqua cillum enim aliqua cillum mollit qui veniam officia dolore voluptate.Non dolore eu commodo deserunt in culpa dolore incididunt dolor aliqua Lorem occaecat voluptate amet.'),
              ),
            ],
          );
        },
      ),
    );
  }
}
