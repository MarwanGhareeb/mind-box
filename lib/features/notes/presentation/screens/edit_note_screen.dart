import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/action_buttons.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/color_selector.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_app_bar.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double offsetY = 0;

  Color backgroundNoteColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          offsetY += details.delta.dy;
        });
      },
      onVerticalDragEnd: (details) {
        if (offsetY > 100) {
          Navigator.pop(context);
        } else {
          setState(() => offsetY = 0);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform:
            Matrix4.translationValues(0, offsetY.clamp(0, double.infinity), 0),
        child: Scaffold(
          backgroundColor: Colors.white.withValues(alpha: 0.3),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: "Edit Note"),
          ),
          body: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.transparent),
              ),
              Form(
                key: _formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                  children: [
                    Text('Title',
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Write your title here...',
                      controller: widget.titleController,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 30),
                    Text('Note',
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Write your content here...',
                      controller: widget.contentController,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 40),
                    Text('Pick a Color',
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: 10),
                    ColorSelector(
                      colors: MindBoxTheme.noteColors,
                      onColorSelected: (selectedColor) =>
                          backgroundNoteColor = selectedColor,
                    ),
                    SizedBox(height: 50),
                    ActionButtons(onSave: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
