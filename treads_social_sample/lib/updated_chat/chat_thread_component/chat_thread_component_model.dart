import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import '/updated_chat/chat_thread/chat_thread_widget.dart';
import '/updated_chat/empty_state_simple/empty_state_simple_widget.dart';
import 'chat_thread_component_widget.dart' show ChatThreadComponentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatThreadComponentModel
    extends FlutterFlowModel<ChatThreadComponentWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> lastSeenBy = [];
  void addToLastSeenBy(DocumentReference item) => lastSeenBy.add(item);
  void removeFromLastSeenBy(DocumentReference item) => lastSeenBy.remove(item);
  void removeAtIndexFromLastSeenBy(int index) => lastSeenBy.removeAt(index);
  void insertAtIndexInLastSeenBy(int index, DocumentReference item) =>
      lastSeenBy.insert(index, item);
  void updateLastSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastSeenBy[index] = updateFn(lastSeenBy[index]);

  List<String> imagesUploaded = [];
  void addToImagesUploaded(String item) => imagesUploaded.add(item);
  void removeFromImagesUploaded(String item) => imagesUploaded.remove(item);
  void removeAtIndexFromImagesUploaded(int index) =>
      imagesUploaded.removeAt(index);
  void insertAtIndexInImagesUploaded(int index, String item) =>
      imagesUploaded.insert(index, item);
  void updateImagesUploadedAtIndex(int index, Function(String) updateFn) =>
      imagesUploaded[index] = updateFn(imagesUploaded[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  List<ChatMessagesRecord>? listViewPreviousSnapshot;
  // Models for chatThread dynamic component.
  late FlutterFlowDynamicModels<ChatThreadModel> chatThreadModels;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? newChatCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    chatThreadModels = FlutterFlowDynamicModels(() => ChatThreadModel());
  }

  @override
  void dispose() {
    chatThreadModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
