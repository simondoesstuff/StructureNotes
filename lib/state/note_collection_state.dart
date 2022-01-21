import 'package:flutter/cupertino.dart';

import 'note_state.dart';


class NoteCollectionState extends ChangeNotifier {
  final Map<String, NoteState> _notes = {};

  /// Create a note.
  ///
  /// Returns the created note or null if a note already
  /// already exists by that name.
  NoteState? createNote(name) {
    if (_notes.containsKey(name)) {
      return null;
    }

    var note = NoteState();
    _notes[name] = note;

    notifyListeners();

    return note;
  }

  /// Delete a note.
  ///
  /// Returns true if a note by that name was found.
  bool deleteNote(name) {
    if (_notes.containsKey(name)) {
      _notes.remove(name);

      notifyListeners();

      return true;
    }

    return false;
  }
}