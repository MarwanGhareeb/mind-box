import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/constants/database_keys.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/add_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/update_note_use_case.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase _getNotesUseCase;
  final AddNoteUseCase _addNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  NotesBloc(
    this._getNotesUseCase,
    this._addNoteUseCase,
    this._updateNoteUseCase,
    this._deleteNoteUseCase,
  ) : super(NotesInitial()) {
    on<GetNotesEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _getNotesUseCase.call(
        event.title.isEmpty ? null : NoteParams(title: event.title),
      );

      results.fold(
        (failure) => emit(NotesError(message: failure.message)),
        (notes) => emit(NotesLoaded(notes: notes)),
      );
    });

    on<AddNoteEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _addNoteUseCase.call(
        NoteParams(
          title: event.data.title,
          content: event.data.content,
          createdAt: event.data.createdAt,
        ),
      );

      results.fold((failure) => emit(NotesError(message: failure.message)), (
        _,
      ) async {
        final notes = await _getNotesUseCase.call();
        notes.fold(
          (failure) => emit(NotesError(message: failure.message)),
          (notes) => emit(NotesLoaded(notes: notes)),
        );
      });
    });

    on<UpdateNoteEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _updateNoteUseCase.call(
        NoteParams(
          id: event.id,
          title: event.data[NotesDBKeys.notesTitle],
          content: event.data[NotesDBKeys.notesContent],
          createdAt: DateTime.parse(event.data[NotesDBKeys.notesCreatedAt]),
        ),
      );

      results.fold((failure) => emit(NotesError(message: failure.message)), (
        _,
      ) async {
        final notes = await _getNotesUseCase.call();
        notes.fold(
          (failure) => emit(NotesError(message: failure.message)),
          (notes) => emit(NotesLoaded(notes: notes)),
        );
      });
    });

    on<DeleteNoteEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _deleteNoteUseCase.call(NoteParams(id: event.id));

      results.fold((failure) => emit(NotesError(message: failure.message)), (
        _,
      ) async {
        final notes = await _getNotesUseCase.call();
        notes.fold(
          (failure) => emit(NotesError(message: failure.message)),
          (notes) => emit(NotesLoaded(notes: notes)),
        );
      });
    });
  }
}
