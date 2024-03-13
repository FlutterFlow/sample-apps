// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DietOptionsStruct extends FFFirebaseStruct {
  DietOptionsStruct({
    String? dietName,
    String? dietTagline,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dietName = dietName,
        _dietTagline = dietTagline,
        super(firestoreUtilData);

  // "diet_name" field.
  String? _dietName;
  String get dietName => _dietName ?? '';
  set dietName(String? val) => _dietName = val;
  bool hasDietName() => _dietName != null;

  // "diet_tagline" field.
  String? _dietTagline;
  String get dietTagline => _dietTagline ?? '';
  set dietTagline(String? val) => _dietTagline = val;
  bool hasDietTagline() => _dietTagline != null;

  static DietOptionsStruct fromMap(Map<String, dynamic> data) =>
      DietOptionsStruct(
        dietName: data['diet_name'] as String?,
        dietTagline: data['diet_tagline'] as String?,
      );

  static DietOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? DietOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'diet_name': _dietName,
        'diet_tagline': _dietTagline,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'diet_name': serializeParam(
          _dietName,
          ParamType.String,
        ),
        'diet_tagline': serializeParam(
          _dietTagline,
          ParamType.String,
        ),
      }.withoutNulls;

  static DietOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DietOptionsStruct(
        dietName: deserializeParam(
          data['diet_name'],
          ParamType.String,
          false,
        ),
        dietTagline: deserializeParam(
          data['diet_tagline'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DietOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DietOptionsStruct &&
        dietName == other.dietName &&
        dietTagline == other.dietTagline;
  }

  @override
  int get hashCode => const ListEquality().hash([dietName, dietTagline]);
}

DietOptionsStruct createDietOptionsStruct({
  String? dietName,
  String? dietTagline,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DietOptionsStruct(
      dietName: dietName,
      dietTagline: dietTagline,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DietOptionsStruct? updateDietOptionsStruct(
  DietOptionsStruct? dietOptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dietOptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDietOptionsStructData(
  Map<String, dynamic> firestoreData,
  DietOptionsStruct? dietOptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dietOptions == null) {
    return;
  }
  if (dietOptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dietOptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dietOptionsData =
      getDietOptionsFirestoreData(dietOptions, forFieldValue);
  final nestedData =
      dietOptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dietOptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDietOptionsFirestoreData(
  DietOptionsStruct? dietOptions, [
  bool forFieldValue = false,
]) {
  if (dietOptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dietOptions.toMap());

  // Add any Firestore field values
  dietOptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDietOptionsListFirestoreData(
  List<DietOptionsStruct>? dietOptionss,
) =>
    dietOptionss?.map((e) => getDietOptionsFirestoreData(e, true)).toList() ??
    [];
