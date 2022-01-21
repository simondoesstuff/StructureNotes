import 'package:flutter/cupertino.dart';

import 'note_attribute.dart';


class NoteState extends ChangeNotifier {
  final List<NoteFormAttribute> _form =
      []; // the form dictates the structure of one entry in _values
  final List<List<dynamic>> _entries =
      []; // groups of   a set of values matching the form

  _updateEntry(entryIndex, attributeIndex, value) {
    // do the entries contain this index?
    if (!_entries.asMap().containsKey(entryIndex)) throw "The note no longer exists.";

    // does the entry contain the attribute index?
    if (!_entries.asMap().containsKey(entryIndex)) throw "The attribute no longer exists.";

    if (_form[attributeIndex].type != value.runtimeType) throw "The value type does not match the note's form.";

    _entries[entryIndex][attributeIndex] = value;
    notifyListeners();
  }

  bool createAttribute() {
    throw UnimplementedError();
    notifyListeners();
  }

  bool deleteAttribute() {
    throw UnimplementedError();
    notifyListeners();
  }

  bool modifyAttribute() {
    throw UnimplementedError();
    notifyListeners();
  }

  bool createEntry() {
    throw UnimplementedError();
    notifyListeners();
  }

  bool deleteEntry() {
    throw UnimplementedError();
    notifyListeners();
  }

  bool moveEntry() {
    throw UnimplementedError();
    notifyListeners();
  }

  /// Retrieve an entry (with the associated form).
  ///
  /// Changing ANYTHING invalidates previously
  /// retrieved entries. DO NOT CACHE.
  Iterable<NoteAttribute>? readEntry(int entryIndex) {
    // does the list contain this index?
    if (!_entries.asMap().containsKey(entryIndex)) return null;

    var entry = _entries[entryIndex];

    return entry.asMap().entries.map((attribute) {
      int attributeIndex = attribute.key;
      String value = attribute.value;
      var form = _form[attributeIndex];

      return NoteAttribute(
          form.name,
          form.position,
          value,
          ((e) => _updateEntry(entryIndex, attributeIndex, e))
      );
    });
  }
}