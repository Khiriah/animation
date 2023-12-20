import 'package:flutter/material.dart';
import '../../animated_align/widget/animated_align_widget.dart';
import '../../animated_align/widget/animated_align_widget1.dart';
import '../../animated_grid/widget/widget.dart';
import '../../animated_list/widget/widget.dart';

class AnimatedGridScreen extends StatelessWidget {
  const AnimatedGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This is from Flutter documentation:'),
            AnimatedGridWidget(),
          ],
        ),
      ),
    );
  }
}
