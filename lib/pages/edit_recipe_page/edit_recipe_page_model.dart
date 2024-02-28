import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_ingredient_modal/add_ingredient_modal_widget.dart';
import '/components/add_step_modal/add_step_modal_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_recipe_page_widget.dart' show EditRecipePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRecipePageModel extends FlutterFlowModel<EditRecipePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for RecipeSelectDropDown widget.
  String? recipeSelectDropDownValue;
  FormFieldController<String>? recipeSelectDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in RecipeSelectDropDown widget.
  RecipesRecord? selectedRecipe;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for ShortDescriptionTextField widget.
  FocusNode? shortDescriptionTextFieldFocusNode;
  TextEditingController? shortDescriptionTextFieldController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextFieldControllerValidator;
  // State field(s) for LongDescriptionTextField widget.
  FocusNode? longDescriptionTextFieldFocusNode;
  TextEditingController? longDescriptionTextFieldController;
  String? Function(BuildContext, String?)?
      longDescriptionTextFieldControllerValidator;
  // State field(s) for PrepTimeTextField widget.
  FocusNode? prepTimeTextFieldFocusNode;
  TextEditingController? prepTimeTextFieldController;
  String? Function(BuildContext, String?)? prepTimeTextFieldControllerValidator;
  // State field(s) for CookTimeTextField widget.
  FocusNode? cookTimeTextFieldFocusNode;
  TextEditingController? cookTimeTextFieldController;
  String? Function(BuildContext, String?)? cookTimeTextFieldControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for AddStepModal component.
  late AddStepModalModel addStepModalModel;
  // Model for addIngredientModal component.
  late AddIngredientModalModel addIngredientModalModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    addStepModalModel = createModel(context, () => AddStepModalModel());
    addIngredientModalModel =
        createModel(context, () => AddIngredientModalModel());
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

    addStepModalModel.dispose();
    addIngredientModalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
