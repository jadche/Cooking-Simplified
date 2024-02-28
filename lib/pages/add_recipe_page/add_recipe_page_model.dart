import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'add_recipe_page_widget.dart' show AddRecipePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRecipePageModel extends FlutterFlowModel<AddRecipePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  String? _nameTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ShortDescriptionTextField widget.
  FocusNode? shortDescriptionTextFieldFocusNode;
  TextEditingController? shortDescriptionTextFieldController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextFieldControllerValidator;
  String? _shortDescriptionTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LongDescriptionTextField widget.
  FocusNode? longDescriptionTextFieldFocusNode;
  TextEditingController? longDescriptionTextFieldController;
  String? Function(BuildContext, String?)?
      longDescriptionTextFieldControllerValidator;
  String? _longDescriptionTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PrepTimeTextField widget.
  FocusNode? prepTimeTextFieldFocusNode;
  TextEditingController? prepTimeTextFieldController;
  String? Function(BuildContext, String?)? prepTimeTextFieldControllerValidator;
  String? _prepTimeTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CookTimeTextField widget.
  FocusNode? cookTimeTextFieldFocusNode;
  TextEditingController? cookTimeTextFieldController;
  String? Function(BuildContext, String?)? cookTimeTextFieldControllerValidator;
  String? _cookTimeTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in AddRecipeButton widget.
  RecipesRecord? createdRecipeID;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameTextFieldControllerValidator = _nameTextFieldControllerValidator;
    shortDescriptionTextFieldControllerValidator =
        _shortDescriptionTextFieldControllerValidator;
    longDescriptionTextFieldControllerValidator =
        _longDescriptionTextFieldControllerValidator;
    prepTimeTextFieldControllerValidator =
        _prepTimeTextFieldControllerValidator;
    cookTimeTextFieldControllerValidator =
        _cookTimeTextFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameTextFieldFocusNode?.dispose();
    nameTextFieldController?.dispose();

    shortDescriptionTextFieldFocusNode?.dispose();
    shortDescriptionTextFieldController?.dispose();

    longDescriptionTextFieldFocusNode?.dispose();
    longDescriptionTextFieldController?.dispose();

    prepTimeTextFieldFocusNode?.dispose();
    prepTimeTextFieldController?.dispose();

    cookTimeTextFieldFocusNode?.dispose();
    cookTimeTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
