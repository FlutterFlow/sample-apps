import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetsRecord extends FirestoreRecord {
  BudgetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "budetName" field.
  String? _budetName;
  String get budetName => _budetName ?? '';
  bool hasBudetName() => _budetName != null;

  // "budgetCreated" field.
  DateTime? _budgetCreated;
  DateTime? get budgetCreated => _budgetCreated;
  bool hasBudgetCreated() => _budgetCreated != null;

  // "budgetDescription" field.
  String? _budgetDescription;
  String get budgetDescription => _budgetDescription ?? '';
  bool hasBudgetDescription() => _budgetDescription != null;

  // "userBudgets" field.
  DocumentReference? _userBudgets;
  DocumentReference? get userBudgets => _userBudgets;
  bool hasUserBudgets() => _userBudgets != null;

  // "budgetStartDate" field.
  DateTime? _budgetStartDate;
  DateTime? get budgetStartDate => _budgetStartDate;
  bool hasBudgetStartDate() => _budgetStartDate != null;

  // "budgetTime" field.
  String? _budgetTime;
  String get budgetTime => _budgetTime ?? '';
  bool hasBudgetTime() => _budgetTime != null;

  // "budgetAmount" field.
  String? _budgetAmount;
  String get budgetAmount => _budgetAmount ?? '';
  bool hasBudgetAmount() => _budgetAmount != null;

  // "budgetAmountNumber" field.
  int? _budgetAmountNumber;
  int get budgetAmountNumber => _budgetAmountNumber ?? 0;
  bool hasBudgetAmountNumber() => _budgetAmountNumber != null;

  // "budgetSpentNumber" field.
  int? _budgetSpentNumber;
  int get budgetSpentNumber => _budgetSpentNumber ?? 0;
  bool hasBudgetSpentNumber() => _budgetSpentNumber != null;

  // "budgetSpent" field.
  String? _budgetSpent;
  String get budgetSpent => _budgetSpent ?? '';
  bool hasBudgetSpent() => _budgetSpent != null;

  void _initializeFields() {
    _budetName = snapshotData['budetName'] as String?;
    _budgetCreated = snapshotData['budgetCreated'] as DateTime?;
    _budgetDescription = snapshotData['budgetDescription'] as String?;
    _userBudgets = snapshotData['userBudgets'] as DocumentReference?;
    _budgetStartDate = snapshotData['budgetStartDate'] as DateTime?;
    _budgetTime = snapshotData['budgetTime'] as String?;
    _budgetAmount = snapshotData['budgetAmount'] as String?;
    _budgetAmountNumber = castToType<int>(snapshotData['budgetAmountNumber']);
    _budgetSpentNumber = castToType<int>(snapshotData['budgetSpentNumber']);
    _budgetSpent = snapshotData['budgetSpent'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgets');

  static Stream<BudgetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetsRecord.fromSnapshot(s));

  static Future<BudgetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetsRecord.fromSnapshot(s));

  static BudgetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetsRecordData({
  String? budetName,
  DateTime? budgetCreated,
  String? budgetDescription,
  DocumentReference? userBudgets,
  DateTime? budgetStartDate,
  String? budgetTime,
  String? budgetAmount,
  int? budgetAmountNumber,
  int? budgetSpentNumber,
  String? budgetSpent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'budetName': budetName,
      'budgetCreated': budgetCreated,
      'budgetDescription': budgetDescription,
      'userBudgets': userBudgets,
      'budgetStartDate': budgetStartDate,
      'budgetTime': budgetTime,
      'budgetAmount': budgetAmount,
      'budgetAmountNumber': budgetAmountNumber,
      'budgetSpentNumber': budgetSpentNumber,
      'budgetSpent': budgetSpent,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetsRecordDocumentEquality implements Equality<BudgetsRecord> {
  const BudgetsRecordDocumentEquality();

  @override
  bool equals(BudgetsRecord? e1, BudgetsRecord? e2) {
    return e1?.budetName == e2?.budetName &&
        e1?.budgetCreated == e2?.budgetCreated &&
        e1?.budgetDescription == e2?.budgetDescription &&
        e1?.userBudgets == e2?.userBudgets &&
        e1?.budgetStartDate == e2?.budgetStartDate &&
        e1?.budgetTime == e2?.budgetTime &&
        e1?.budgetAmount == e2?.budgetAmount &&
        e1?.budgetAmountNumber == e2?.budgetAmountNumber &&
        e1?.budgetSpentNumber == e2?.budgetSpentNumber &&
        e1?.budgetSpent == e2?.budgetSpent;
  }

  @override
  int hash(BudgetsRecord? e) => const ListEquality().hash([
        e?.budetName,
        e?.budgetCreated,
        e?.budgetDescription,
        e?.userBudgets,
        e?.budgetStartDate,
        e?.budgetTime,
        e?.budgetAmount,
        e?.budgetAmountNumber,
        e?.budgetSpentNumber,
        e?.budgetSpent
      ]);

  @override
  bool isValidKey(Object? o) => o is BudgetsRecord;
}
