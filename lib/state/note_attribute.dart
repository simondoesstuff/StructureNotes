import 'package:flutter/cupertino.dart';

@immutable
class NoteFormAttribute<T> {
  final String _name;
  final int _position;

  get name => _name;
  get position => _position;
  get type => T.runtimeType;

  const NoteFormAttribute(this._name, this._position);
}

@immutable
class NoteAttribute<T> extends NoteFormAttribute<T> {
  final T _value;

  /// Update the value of the note.
  ///
  /// value MUST match the note form's type.
  final void Function(T value) update;

  get value => _value;

  const NoteAttribute(String name, int position, this._value, this.update) : super(name, position);
}
