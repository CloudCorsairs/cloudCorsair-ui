import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_notifications_widget.dart' show MainNotificationsWidget;
import 'package:flutter/material.dart';

class MainNotificationsModel extends FlutterFlowModel<MainNotificationsWidget> {
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
