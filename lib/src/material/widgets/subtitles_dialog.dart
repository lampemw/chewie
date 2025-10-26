import 'package:chewie/src/models/subtitle_model.dart';
import 'package:flutter/material.dart';

class SubtitlesDialog extends StatefulWidget {
  const SubtitlesDialog({
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
  _SubtitlesDialogState createState() => _SubtitlesDialogState();
}

class _SubtitlesDialogState extends State<SubtitlesDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.subtitlesList.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return ListTile(
                  onTap: () => widget.onSubtitlesSelected(null),
                  title: Text(
                    'None',
                    style: TextStyle(
                      color: widget.selectedSubtitles == null
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                );
              }
              return ListTile(
                onTap: () =>
                    widget.onSubtitlesSelected(widget.subtitlesList[i - 1]),
                title: Text(
                  widget.subtitlesList[i - 1].name,
                  style: TextStyle(
                    color:
                        widget.selectedSubtitles == widget.subtitlesList[i - 1]
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
