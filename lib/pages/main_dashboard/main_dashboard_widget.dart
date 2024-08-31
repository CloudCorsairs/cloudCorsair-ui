import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'main_dashboard_model.dart';
export 'main_dashboard_model.dart';

class MainDashboardWidget extends StatefulWidget {
  const MainDashboardWidget({super.key});

  @override
  State<MainDashboardWidget> createState() => _MainDashboardWidgetState();
}

class _MainDashboardWidgetState extends State<MainDashboardWidget> {
  late MainDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isProfileSet) {
        _model.claimsAll = await ClaimsTable().queryRows(
          queryFn: (q) => q.order('id', ascending: true),
        );
        _model.claimsDataRows = _model.claimsAll!.toList().cast<ClaimsRow>();
        setState(() {});
        _model.authUser = await UsersTable().queryRows(
          queryFn: (q) => q.eq(
            'user_id',
            currentUserUid,
          ),
        );
        FFAppState().firstName = _model.authUser!.first.firstName!;
        FFAppState().lastName = _model.authUser!.first.lastName!;
        FFAppState().userRole = _model.authUser!.first.userRole!;
        setState(() {});
      } else {
        context.pushNamed('profile');
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: const SideNavWidget(
                  selectedNav: 1,
                ),
              ),
              Expanded(
                flex: 8,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 1170.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Container(
                              width: double.infinity,
                              height: 24.0,
                              decoration: const BoxDecoration(),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 4.0),
                            child: Text(
                              'Dashboard',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Claims History',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: const ['name', 'Status', 'Date'],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: 300.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select column to filter by...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      const Duration(milliseconds: 2000),
                                      () async {},
                                    ),
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search all claims...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0.0, 0.0, 0.0),
                                      suffixIcon: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Container(
                              width: double.infinity,
                              height: 12.0,
                              decoration: const BoxDecoration(),
                            ),
                          Flexible(
                            child: Container(
                              height: 600.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final claimsTable =
                                        _model.claimsDataRows.toList();

                                    return FlutterFlowDataTable<ClaimsRow>(
                                      controller:
                                          _model.paginatedDataTableController,
                                      data: claimsTable,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'ID',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          fixedWidth: 60.0,
                                          onSort: onSortChanged,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'Client',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          onSort: onSortChanged,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'Date',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          onSort: onSortChanged,
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'Status',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              'Actions',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      dataRowBuilder: (claimsTableItem,
                                              claimsTableIndex,
                                              selected,
                                              onSelectChanged) =>
                                          DataRow(
                                        selected: selected,
                                        onSelectChanged: onSelectChanged,
                                        color: WidgetStateProperty.all(
                                          claimsTableIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        cells: [
                                          Text(
                                            claimsTableItem.id.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              claimsTableItem.name,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              claimsTableItem.createdAt
                                                  .toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              claimsTableItem.status,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor: const Color(0xC230FF3C),
                                                  hoverColor: const Color(0x8502F60F),
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await ClaimsTable().update(
                                                      data: {
                                                        'status': 'Approved',
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        claimsTableItem.id,
                                                      ),
                                                    );
                                                    _model.updatedClaimsList =
                                                        await ClaimsTable()
                                                            .queryRows(
                                                      queryFn: (q) => q.order(
                                                          'id',
                                                          ascending: true),
                                                    );
                                                    _model.claimsDataRows =
                                                        _model
                                                            .updatedClaimsList!
                                                            .toList()
                                                            .cast<ClaimsRow>();
                                                    setState(() {});

                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor: const Color(0xD3F03A3A),
                                                  hoverColor: const Color(0x99E54444),
                                                  hoverIconColor: Colors.white,
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons.times,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await ClaimsTable().update(
                                                      data: {
                                                        'status': 'Rejected',
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        claimsTableItem.id,
                                                      ),
                                                    );
                                                    _model.updatedClaimsList2 =
                                                        await ClaimsTable()
                                                            .queryRows(
                                                      queryFn: (q) => q.order(
                                                          'id',
                                                          ascending: true),
                                                    );
                                                    _model.claimsDataRows =
                                                        _model
                                                            .updatedClaimsList2!
                                                            .toList()
                                                            .cast<ClaimsRow>();
                                                    setState(() {});

                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      onPageChanged: (currentRowIndex) async {},
                                      onSortChanged:
                                          (columnIndex, ascending) async {},
                                      paginated: true,
                                      selectable: true,
                                      hidePaginator: false,
                                      showFirstLastButtons: false,
                                      headingRowHeight: 56.0,
                                      dataRowHeight: 48.0,
                                      columnSpacing: 20.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      sortIconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      addHorizontalDivider: true,
                                      addTopAndBottomDivider: false,
                                      hideDefaultHorizontalDivider: true,
                                      horizontalDividerColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      horizontalDividerThickness: 1.0,
                                      addVerticalDivider: false,
                                      checkboxUnselectedFillColor:
                                          Colors.transparent,
                                      checkboxSelectedFillColor:
                                          Colors.transparent,
                                      checkboxCheckColor: const Color(0x8A000000),
                                      checkboxUnselectedBorderColor:
                                          const Color(0x8A000000),
                                      checkboxSelectedBorderColor:
                                          const Color(0x8A000000),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 30.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
