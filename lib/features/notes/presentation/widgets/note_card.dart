import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime? createdAt;
  final Color? color;
  final void Function() onTapEdit;
  final void Function() onTapDelete;

  const NoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.onTapEdit,
    required this.onTapDelete,
    this.createdAt,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Card(
        color: theme.colorScheme.secondary,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                content,
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onTapEdit,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                  FloatingActionButton.small(
                    onPressed: onTapDelete,
                    backgroundColor: const Color.fromARGB(255, 255, 127, 127),
                    child: Icon(
                      CupertinoIcons.trash,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
