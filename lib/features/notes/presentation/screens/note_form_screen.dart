import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/core/utils/app_themes.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/action_buttons.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/color_selector.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_app_bar.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_text_field.dart';

class NoteFormScreen extends StatefulWidget {
  const NoteFormScreen({
    super.key,
    required this.appBarTitle,
    this.initialNote,
  });

  final String appBarTitle;
  final NoteParams? initialNote;

  @override
  State<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController contentController;

  late Color backgroundNoteColor;

  @override
  void initState() {
    if (widget.initialNote != null) {
      titleController = TextEditingController(text: widget.initialNote!.title);
      contentController =
          TextEditingController(text: widget.initialNote!.content);
      backgroundNoteColor = Color(widget.initialNote!.color);
    } else {
      titleController = TextEditingController();
      contentController = TextEditingController();
      backgroundNoteColor = Colors.transparent.withValues(alpha: 0.3);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.3),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: widget.appBarTitle),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
          children: _itemsForAddScreen(),
        ),
      ),
    );
  }

  List<Widget> _itemsForAddScreen() {
    return [
      Text('Title', style: Theme.of(context).textTheme.titleMedium),
      SizedBox(height: 10),
      CustomTextField(
        hintText: 'Write your title here...',
        controller: titleController,
        keyboardType: TextInputType.text,
      ),
      SizedBox(height: 30),
      Text('Note', style: Theme.of(context).textTheme.titleMedium),
      SizedBox(height: 10),
      CustomTextField(
        hintText: 'Write your content here...',
        controller: contentController,
        keyboardType: TextInputType.multiline,
      ),
      SizedBox(height: 40),
      Text('Pick a Color', style: Theme.of(context).textTheme.titleMedium),
      SizedBox(height: 10),
      ColorSelector(
        colors: MindBoxTheme.noteColors,
        onColorSelected: (selectedColor) {
          backgroundNoteColor = selectedColor;
        },
      ),
      SizedBox(height: 50),
      ActionButtons(
        onSave: _onSave,
        onCancle: () => Navigator.pop(context),
      ),
    ];
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      if (backgroundNoteColor != Colors.transparent) {
        AwesomeDialog(
          context: context,
        );
      }

      final noteParams = NoteParams(
        id: widget.initialNote?.id,
        title: titleController.text,
        content: contentController.text,
        color: backgroundNoteColor.toARGB32(),
      );

      if (widget.initialNote != null) {
        context.read<NotesBloc>().add(
              UpdateNoteEvent(params: noteParams),
            );
      } else {
        context.read<NotesBloc>().add(
              AddNoteEvent(params: noteParams),
            );
      }

      Navigator.pop<bool>(context, true);
    }
  }
}
