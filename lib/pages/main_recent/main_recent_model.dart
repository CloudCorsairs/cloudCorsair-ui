import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_recent_widget.dart' show MainRecentWidget;
import 'package:flutter/material.dart';

class MainRecentModel extends FlutterFlowModel<MainRecentWidget> {
  ///  Local state fields for this page.

  int selectedPage = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
  }
}
