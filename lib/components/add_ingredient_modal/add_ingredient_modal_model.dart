import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_ingredient_modal_widget.dart' show AddIngredientModalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddIngredientModalModel
    extends FlutterFlowModel<AddIngredientModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for IngredientsTextField widget.
  FocusNode? ingredientsTextFieldFocusNode;
  TextEditingController? ingredientsTextFieldController;
  String? Function(BuildContext, String?)?
      ingredientsTextFieldControllerValidator;
  String? _ingredientsTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    ingredientsTextFieldControllerValidator =
        _ingredientsTextFieldControllerValidator;
  }

  @override
  void dispose() {
    ingredientsTextFieldFocusNode?.dispose();
    ingredientsTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
