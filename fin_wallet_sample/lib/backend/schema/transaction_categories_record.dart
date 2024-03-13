import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionCategoriesRecord extends FirestoreRecord {
  TransactionCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "categoryName" field.
  List<String>? _categoryName;
  List<String> get categoryName => _categoryName ?? const [];
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _categoryName = getDataList(snapshotData['categoryName']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactionCategories');

  static Stream<TransactionCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionCategoriesRecord.fromSnapshot(s));

  static Future<TransactionCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransactionCategoriesRecord.fromSnapshot(s));

  static TransactionCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionCategoriesRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionCategoriesRecordDocumentEquality
    implements Equality<TransactionCategoriesRecord> {
  const TransactionCategoriesRecordDocumentEquality();

  @override
  bool equals(
      TransactionCategoriesRecord? e1, TransactionCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.categoryName, e2?.categoryName);
  }

  @override
  int hash(TransactionCategoriesRecord? e) =>
      const ListEquality().hash([e?.user, e?.categoryName]);

  @override
  bool isValidKey(Object? o) => o is TransactionCategoriesRecord;
}
