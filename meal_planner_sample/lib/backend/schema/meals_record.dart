import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "meal_name" field.
  String? _mealName;
  String get mealName => _mealName ?? '';
  bool hasMealName() => _mealName != null;

  // "meal_image" field.
  String? _mealImage;
  String get mealImage => _mealImage ?? '';
  bool hasMealImage() => _mealImage != null;

  // "meal_ingredients" field.
  String? _mealIngredients;
  String get mealIngredients => _mealIngredients ?? '';
  bool hasMealIngredients() => _mealIngredients != null;

  // "meal_allergens" field.
  List<String>? _mealAllergens;
  List<String> get mealAllergens => _mealAllergens ?? const [];
  bool hasMealAllergens() => _mealAllergens != null;

  // "meal_favorites" field.
  List<DocumentReference>? _mealFavorites;
  List<DocumentReference> get mealFavorites => _mealFavorites ?? const [];
  bool hasMealFavorites() => _mealFavorites != null;

  // "meal_calories" field.
  int? _mealCalories;
  int get mealCalories => _mealCalories ?? 0;
  bool hasMealCalories() => _mealCalories != null;

  // "meal_diet" field.
  List<String>? _mealDiet;
  List<String> get mealDiet => _mealDiet ?? const [];
  bool hasMealDiet() => _mealDiet != null;

  void _initializeFields() {
    _mealName = snapshotData['meal_name'] as String?;
    _mealImage = snapshotData['meal_image'] as String?;
    _mealIngredients = snapshotData['meal_ingredients'] as String?;
    _mealAllergens = getDataList(snapshotData['meal_allergens']);
    _mealFavorites = getDataList(snapshotData['meal_favorites']);
    _mealCalories = castToType<int>(snapshotData['meal_calories']);
    _mealDiet = getDataList(snapshotData['meal_diet']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealsRecordData({
  String? mealName,
  String? mealImage,
  String? mealIngredients,
  int? mealCalories,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meal_name': mealName,
      'meal_image': mealImage,
      'meal_ingredients': mealIngredients,
      'meal_calories': mealCalories,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealsRecordDocumentEquality implements Equality<MealsRecord> {
  const MealsRecordDocumentEquality();

  @override
  bool equals(MealsRecord? e1, MealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mealName == e2?.mealName &&
        e1?.mealImage == e2?.mealImage &&
        e1?.mealIngredients == e2?.mealIngredients &&
        listEquality.equals(e1?.mealAllergens, e2?.mealAllergens) &&
        listEquality.equals(e1?.mealFavorites, e2?.mealFavorites) &&
        e1?.mealCalories == e2?.mealCalories &&
        listEquality.equals(e1?.mealDiet, e2?.mealDiet);
  }

  @override
  int hash(MealsRecord? e) => const ListEquality().hash([
        e?.mealName,
        e?.mealImage,
        e?.mealIngredients,
        e?.mealAllergens,
        e?.mealFavorites,
        e?.mealCalories,
        e?.mealDiet
      ]);

  @override
  bool isValidKey(Object? o) => o is MealsRecord;
}
