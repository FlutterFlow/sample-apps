// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChefsStruct extends FFFirebaseStruct {
  ChefsStruct({
    String? profilePicture,
    String? name,
    String? bio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _profilePicture = profilePicture,
        _name = name,
        _bio = bio,
        super(firestoreUtilData);

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;
  bool hasProfilePicture() => _profilePicture != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;
  bool hasBio() => _bio != null;

  static ChefsStruct fromMap(Map<String, dynamic> data) => ChefsStruct(
        profilePicture: data['profile_picture'] as String?,
        name: data['name'] as String?,
        bio: data['bio'] as String?,
      );

  static ChefsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChefsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'profile_picture': _profilePicture,
        'name': _name,
        'bio': _bio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'profile_picture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChefsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChefsStruct(
        profilePicture: deserializeParam(
          data['profile_picture'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChefsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChefsStruct &&
        profilePicture == other.profilePicture &&
        name == other.name &&
        bio == other.bio;
  }

  @override
  int get hashCode => const ListEquality().hash([profilePicture, name, bio]);
}

ChefsStruct createChefsStruct({
  String? profilePicture,
  String? name,
  String? bio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChefsStruct(
      profilePicture: profilePicture,
      name: name,
      bio: bio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChefsStruct? updateChefsStruct(
  ChefsStruct? chefs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chefs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChefsStructData(
  Map<String, dynamic> firestoreData,
  ChefsStruct? chefs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chefs == null) {
    return;
  }
  if (chefs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chefs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chefsData = getChefsFirestoreData(chefs, forFieldValue);
  final nestedData = chefsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chefs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChefsFirestoreData(
  ChefsStruct? chefs, [
  bool forFieldValue = false,
]) {
  if (chefs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chefs.toMap());

  // Add any Firestore field values
  chefs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChefsListFirestoreData(
  List<ChefsStruct>? chefss,
) =>
    chefss?.map((e) => getChefsFirestoreData(e, true)).toList() ?? [];
