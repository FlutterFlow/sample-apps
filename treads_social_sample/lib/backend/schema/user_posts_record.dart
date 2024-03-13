import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPostsRecord extends FirestoreRecord {
  UserPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postPhoto" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "postDescription" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "numComments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "dogProfile" field.
  DocumentReference? _dogProfile;
  DocumentReference? get dogProfile => _dogProfile;
  bool hasDogProfile() => _dogProfile != null;

  // "postOwner" field.
  bool? _postOwner;
  bool get postOwner => _postOwner ?? false;
  bool hasPostOwner() => _postOwner != null;

  void _initializeFields() {
    _postPhoto = snapshotData['postPhoto'] as String?;
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['numComments']);
    _dogProfile = snapshotData['dogProfile'] as DocumentReference?;
    _postOwner = snapshotData['postOwner'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userPosts');

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPostsRecord.fromSnapshot(s));

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPostsRecord.fromSnapshot(s));

  static UserPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  DocumentReference? dogProfile,
  bool? postOwner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postPhoto': postPhoto,
      'postTitle': postTitle,
      'postDescription': postDescription,
      'postUser': postUser,
      'timePosted': timePosted,
      'numComments': numComments,
      'dogProfile': dogProfile,
      'postOwner': postOwner,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPostsRecordDocumentEquality implements Equality<UserPostsRecord> {
  const UserPostsRecordDocumentEquality();

  @override
  bool equals(UserPostsRecord? e1, UserPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.dogProfile == e2?.dogProfile &&
        e1?.postOwner == e2?.postOwner;
  }

  @override
  int hash(UserPostsRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.dogProfile,
        e?.postOwner
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
