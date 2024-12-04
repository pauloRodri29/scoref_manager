// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volleyball_score_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VolleyballScoreStore on _VolleyballScoreStoreBase, Store {
  Computed<int>? _$isScoreTeam1Computed;

  @override
  int get isScoreTeam1 =>
      (_$isScoreTeam1Computed ??= Computed<int>(() => super.isScoreTeam1,
              name: '_VolleyballScoreStoreBase.isScoreTeam1'))
          .value;
  Computed<int>? _$isScoreTeam2Computed;

  @override
  int get isScoreTeam2 =>
      (_$isScoreTeam2Computed ??= Computed<int>(() => super.isScoreTeam2,
              name: '_VolleyballScoreStoreBase.isScoreTeam2'))
          .value;

  late final _$scoreTeam1Atom =
      Atom(name: '_VolleyballScoreStoreBase.scoreTeam1', context: context);

  @override
  int get scoreTeam1 {
    _$scoreTeam1Atom.reportRead();
    return super.scoreTeam1;
  }

  @override
  set scoreTeam1(int value) {
    _$scoreTeam1Atom.reportWrite(value, super.scoreTeam1, () {
      super.scoreTeam1 = value;
    });
  }

  late final _$scoreTeam2Atom =
      Atom(name: '_VolleyballScoreStoreBase.scoreTeam2', context: context);

  @override
  int get scoreTeam2 {
    _$scoreTeam2Atom.reportRead();
    return super.scoreTeam2;
  }

  @override
  set scoreTeam2(int value) {
    _$scoreTeam2Atom.reportWrite(value, super.scoreTeam2, () {
      super.scoreTeam2 = value;
    });
  }

  late final _$_VolleyballScoreStoreBaseActionController =
      ActionController(name: '_VolleyballScoreStoreBase', context: context);

  @override
  int incrementStoreTeam1() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.incrementStoreTeam1');
    try {
      return super.incrementStoreTeam1();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int decrementStorieTeam1() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.decrementStorieTeam1');
    try {
      return super.decrementStorieTeam1();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int resetStoreTeam1() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.resetStoreTeam1');
    try {
      return super.resetStoreTeam1();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int incrementStoreTeam2() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.incrementStoreTeam2');
    try {
      return super.incrementStoreTeam2();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int decrementStorieTeam2() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.decrementStorieTeam2');
    try {
      return super.decrementStorieTeam2();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int resetStoreTeam2() {
    final _$actionInfo = _$_VolleyballScoreStoreBaseActionController
        .startAction(name: '_VolleyballScoreStoreBase.resetStoreTeam2');
    try {
      return super.resetStoreTeam2();
    } finally {
      _$_VolleyballScoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scoreTeam1: ${scoreTeam1},
scoreTeam2: ${scoreTeam2},
isScoreTeam1: ${isScoreTeam1},
isScoreTeam2: ${isScoreTeam2}
    ''';
  }
}
