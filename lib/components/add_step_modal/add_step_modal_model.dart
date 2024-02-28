import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'add_step_modal_widget.dart' show AddStepModalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddStepModalModel extends FlutterFlowModel<AddStepModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for StepNumberTextField widget.
  FocusNode? stepNumberTextFieldFocusNode;
  TextEditingController? stepNumberTextFieldController;
  String? Function(BuildContext, String?)?
      stepNumberTextFieldControllerValidator;
  String? _stepNumberTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for StepMainTextField widget.
  FocusNode? stepMainTextFieldFocusNode;
  TextEditingController? stepMainTextFieldController;
  String? Function(BuildContext, String?)? stepMainTextFieldControllerValidator;
  String? _stepMainTextFieldControllerValidator(
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    stepNumberTextFieldControllerValidator =
        _stepNumberTextFieldControllerValidator;
    stepMainTextFieldControllerValidator =
        _stepMainTextFieldControllerValidator;
    prepTimeTextFieldControllerValidator =
        _prepTimeTextFieldControllerValidator;
    cookTimeTextFieldControllerValidator =
        _cookTimeTextFieldControllerValidator;
  }

  @override
  void dispose() {
    stepNumberTextFieldFocusNode?.dispose();
    stepNumberTextFieldController?.dispose();

    stepMainTextFieldFocusNode?.dispose();
    stepMainTextFieldController?.dispose();

    prepTimeTextFieldFocusNode?.dispose();
    prepTimeTextFieldController?.dispose();

    cookTimeTextFieldFocusNode?.dispose();
    cookTimeTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
