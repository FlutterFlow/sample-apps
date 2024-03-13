import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportCenterRecord extends FirestoreRecord {
  SupportCenterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('support_center');

  static Stream<SupportCenterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportCenterRecord.fromSnapshot(s));

  static Future<SupportCenterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportCenterRecord.fromSnapshot(s));

  static SupportCenterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportCenterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportCenterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportCenterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportCenterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportCenterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportCenterRecordData({
  String? question,
  String? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportCenterRecordDocumentEquality
    implements Equality<SupportCenterRecord> {
  const SupportCenterRecordDocumentEquality();

  @override
  bool equals(SupportCenterRecord? e1, SupportCenterRecord? e2) {
    return e1?.question == e2?.question && e1?.answer == e2?.answer;
  }

  @override
  int hash(SupportCenterRecord? e) =>
      const ListEquality().hash([e?.question, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is SupportCenterRecord;
}
