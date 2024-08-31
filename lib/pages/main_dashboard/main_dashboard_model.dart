import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_dashboard_widget.dart' show MainDashboardWidget;
import 'package:flutter/material.dart';

class MainDashboardModel extends FlutterFlowModel<MainDashboardWidget> {
  ///  Local state fields for this page.

  int selectedPage = 1;

  List<ClaimsRow> claimsDataRows = [];
  void addToClaimsDataRows(ClaimsRow item) => claimsDataRows.add(item);
  void removeFromClaimsDataRows(ClaimsRow item) => claimsDataRows.remove(item);
  void removeAtIndexFromClaimsDataRows(int index) =>
      claimsDataRows.removeAt(index);
  void insertAtIndexInClaimsDataRows(int index, ClaimsRow item) =>
      claimsDataRows.insert(index, item);
  void updateClaimsDataRowsAtIndex(int index, Function(ClaimsRow) updateFn) =>
      claimsDataRows[index] = updateFn(claimsDataRows[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in main_dashboard widget.
  List<ClaimsRow>? claimsAll;
  // Stores action output result for [Backend Call - Query Rows] action in main_dashboard widget.
  List<UsersRow>? authUser;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ClaimsRow>();
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ClaimsRow>? updatedClaimsList;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ClaimsRow>? updatedClaimsList2;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
