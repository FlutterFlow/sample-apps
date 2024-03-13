import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetListRecord extends FirestoreRecord {
  BudgetListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "budget" field.
  List<String>? _budget;
  List<String> get budget => _budget ?? const [];
  bool hasBudget() => _budget != null;

  // "budgetUser" field.
  DocumentReference? _budgetUser;
  DocumentReference? get budgetUser => _budgetUser;
  bool hasBudgetUser() => _budgetUser != null;

  void _initializeFields() {
    _budget = getDataList(snapshotData['budget']);
    _budgetUser = snapshotData['budgetUser'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgetList');

  static Stream<BudgetListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetListRecord.fromSnapshot(s));

  static Future<BudgetListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetListRecord.fromSnapshot(s));

  static BudgetListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetListRecordData({
  DocumentReference? budgetUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'budgetUser': budgetUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetListRecordDocumentEquality implements Equality<BudgetListRecord> {
  const BudgetListRecordDocumentEquality();

  @override
  bool equals(BudgetListRecord? e1, BudgetListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.budget, e2?.budget) &&
        e1?.budgetUser == e2?.budgetUser;
  }

  @override
  int hash(BudgetListRecord? e) =>
      const ListEquality().hash([e?.budget, e?.budgetUser]);

  @override
  bool isValidKey(Object? o) => o is BudgetListRecord;
}
