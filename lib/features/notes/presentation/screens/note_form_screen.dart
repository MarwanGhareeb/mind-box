import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/core/themes/app_colors.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/bloc/notes_bloc.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/save_button.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/color_selector.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_app_bar.dart';
import 'package:note_todo_app_mind_box/features/notes/presentation/widgets/custom_text_field.dart';

class NoteFormScreen extends StatefulWidget {
  const NoteFormScreen({
    super.key,
    required this.title,
    this.initialNote,
  });

  final String title;
  final NoteEntity? initialNote;

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
      backgroundNoteColor = AppColors.transparent;
    }

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.glass05,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: widget.title),
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
      Text('Title', style: Theme.of(context).textTheme.titleLarge),
      SizedBox(height: 10),
      CustomTextField(
        hintText: 'Write your title here...',
        controller: titleController,
        keyboardType: TextInputType.text,
      ),
      SizedBox(height: 30),
      Text('Note', style: Theme.of(context).textTheme.titleLarge),
      SizedBox(height: 10),
      CustomTextField(
        hintText: 'Write your content here...',
        controller: contentController,
        keyboardType: TextInputType.multiline,
      ),
      SizedBox(height: 40),
      Text('Pick a Color', style: Theme.of(context).textTheme.titleLarge),
      SizedBox(height: 10),
      ColorSelector(
        initialColor: backgroundNoteColor,
        onColorChanged: (value) => backgroundNoteColor = value,
      ),
      SizedBox(height: 50),
      SaveButton(
        onSave: _onSave,
      ),
      SizedBox(height: 200),
    ];
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final noteParams = NoteParams(
        id: widget.initialNote?.id,
        title: titleController.text,
        content: contentController.text,
        color: backgroundNoteColor.toARGB32(),
      );

      if (widget.initialNote != null) {
        context.read<NotesBloc>().add(UpdateNoteEvent(params: noteParams));
      } else {
        context.read<NotesBloc>().add(AddNoteEvent(params: noteParams));
      }

      Navigator.pop<bool>(context, true);
    }
  }
}
