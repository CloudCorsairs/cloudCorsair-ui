import '/backend/api_requests/api_calls.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_new_claim_widget.dart' show MainNewClaimWidget;
import 'package:flutter/material.dart';

class MainNewClaimModel extends FlutterFlowModel<MainNewClaimWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (processPhoto)] action in Button widget.
  ApiCallResponse? apiResponse;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
