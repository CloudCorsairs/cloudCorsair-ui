import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
      if (FFAppState().userRole == 'Client') {
        _model.claimsClient = await ClaimsTable().queryRows(
          queryFn: (q) => q
              .eq(
                'user_id',
                currentUserUid,
              )
              .order('id'),
        );
        _model.claimsDataRows = _model.claimsClient!.toList().cast<ClaimsRow>();
        setState(() {});
      } else {
        _model.claimsAll = await ClaimsTable().queryRows(
          queryFn: (q) => q.order('id'),
        );
        _model.claimsDataRows = _model.claimsAll!.toList().cast<ClaimsRow>();
        setState(() {});
      }

      _model.authUser = await UsersTable().queryRows(
        queryFn: (q) => q.eq(
          'user_id',
          currentUserUid,
        ),
      );
      FFAppState().firstName = _model.authUser!.first.firstName!;
      FFAppState().lastName = _model.authUser!.first.lastName!;
      FFAppState().userRole = _model.authUser!.first.userRole!;
      FFAppState().profilePic = _model.authUser!.first.profilePic!;
      setState(() {});
    });

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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 4.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Dashboard - ',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: FFAppState().userRole,
                                        style: const TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              if (FFAppState().userRole == 'Client')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('main_new_claim');
                                    },
                                    text: 'New Claim',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                height: 550.0,
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
                                            fixedWidth: 120.0,
                                            onSort: onSortChanged,
                                          ),
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Text(
                                                'Image',
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
                                            fixedWidth: 100.0,
                                          ),
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Text(
                                                'Damages',
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
                                            fixedWidth: 350.0,
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
                                            fixedWidth: 120.0,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              claimsTableItem
                                                                  .imageUrl,
                                                              'https://picsum.photos/seed/6/600',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: valueOrDefault<
                                                              String>(
                                                            claimsTableItem
                                                                .imageUrl,
                                                            'https://picsum.photos/seed/6/600' '$claimsTableIndex',
                                                          ),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: valueOrDefault<String>(
                                                      claimsTableItem.imageUrl,
                                                      'https://picsum.photos/seed/6/600' '$claimsTableIndex',
                                                    ),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          claimsTableItem
                                                              .imageUrl,
                                                          'https://picsum.photos/seed/6/600',
                                                        ),
                                                        width: 50.0,
                                                        height: 50.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                claimsTableItem.parts,
                                                'N.A',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                if (FFAppState().userRole ==
                                                    'Broker')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          const Color(0xC230FF3C),
                                                      hoverColor:
                                                          const Color(0x8502F60F),
                                                      icon: const FaIcon(
                                                        FontAwesomeIcons.check,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await ClaimsTable()
                                                            .update(
                                                          data: {
                                                            'status':
                                                                'Approved',
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            claimsTableItem.id,
                                                          ),
                                                        );
                                                        _model.updatedClaimsList =
                                                            await ClaimsTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.order('id',
                                                                  ascending:
                                                                      true),
                                                        );
                                                        _model.claimsDataRows =
                                                            _model
                                                                .updatedClaimsList!
                                                                .toList()
                                                                .cast<
                                                                    ClaimsRow>();
                                                        setState(() {});

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                if (FFAppState().userRole ==
                                                    'Broker')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          const Color(0xD3F03A3A),
                                                      hoverColor:
                                                          const Color(0x99E54444),
                                                      hoverIconColor:
                                                          Colors.white,
                                                      icon: const FaIcon(
                                                        FontAwesomeIcons.times,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await ClaimsTable()
                                                            .update(
                                                          data: {
                                                            'status':
                                                                'Rejected',
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            claimsTableItem.id,
                                                          ),
                                                        );
                                                        _model.updatedClaimsList2 =
                                                            await ClaimsTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.order('id',
                                                                  ascending:
                                                                      true),
                                                        );
                                                        _model.claimsDataRows =
                                                            _model
                                                                .updatedClaimsList2!
                                                                .toList()
                                                                .cast<
                                                                    ClaimsRow>();
                                                        setState(() {});

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                if (FFAppState().userRole ==
                                                    'Client')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          const Color(0xD3F03A3A),
                                                      hoverColor:
                                                          const Color(0x99E54444),
                                                      hoverIconColor:
                                                          Colors.white,
                                                      icon: const FaIcon(
                                                        FontAwesomeIcons
                                                            .solidTrashAlt,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await ClaimsTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            claimsTableItem.id,
                                                          ),
                                                        );
                                                        _model.updatedClaimsList3 =
                                                            await ClaimsTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.order('id',
                                                                  ascending:
                                                                      true),
                                                        );
                                                        _model.claimsDataRows =
                                                            _model
                                                                .updatedClaimsList3!
                                                                .toList()
                                                                .cast<
                                                                    ClaimsRow>();
                                                        setState(() {});

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ].map((c) => DataCell(c)).toList(),
                                        ),
                                        onPageChanged:
                                            (currentRowIndex) async {},
                                        onSortChanged:
                                            (columnIndex, ascending) async {},
                                        paginated: true,
                                        selectable: false,
                                        hidePaginator: false,
                                        showFirstLastButtons: false,
                                        headingRowHeight: 56.0,
                                        dataRowHeight: 80.0,
                                        columnSpacing: 20.0,
                                        headingRowColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        sortIconColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        addHorizontalDivider: true,
                                        addTopAndBottomDivider: false,
                                        hideDefaultHorizontalDivider: true,
                                        horizontalDividerColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        horizontalDividerThickness: 1.0,
                                        addVerticalDivider: false,
                                      );
                                    },
                                  ),
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
