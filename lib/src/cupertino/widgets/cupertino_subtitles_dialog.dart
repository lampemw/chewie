import 'package:chewie/src/models/subtitle_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSubtitlesDialog extends StatefulWidget {
  const CupertinoSubtitlesDialog({
    super.key,
    required this.subtitlesList,
    required this.onSubtitlesSelected,
    this.selectedSubtitles,
  });

  final List<Subtitles> subtitlesList;
  final Function(Subtitles? subtitles) onSubtitlesSelected;
  final Subtitles? selectedSubtitles;

  @override
  // ignore: library_private_types_in_public_api
  _CupertinoSubtitlesDialogState createState() =>
      _CupertinoSubtitlesDialogState();
}

class _CupertinoSubtitlesDialogState extends State<CupertinoSubtitlesDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => widget.onSubtitlesSelected(null),
            child: Text(
              'None',
              style: widget.selectedSubtitles == null
                  ? TextStyle(color: Theme.of(context).colorScheme.primary)
                  : null,
            ),
          ),
          ...widget.subtitlesList.map(
            (subtitles) => CupertinoActionSheetAction(
              onPressed: () => widget.onSubtitlesSelected(subtitles),

              child: Text(
                subtitles.name,
                style: TextStyle(
                  color: widget.selectedSubtitles == subtitles
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
