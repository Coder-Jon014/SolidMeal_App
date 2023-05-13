import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'intolerances_page_model.dart';
export 'intolerances_page_model.dart';

class IntolerancesPageWidget extends StatefulWidget {
  const IntolerancesPageWidget({Key? key}) : super(key: key);

  @override
  _IntolerancesPageWidgetState createState() => _IntolerancesPageWidgetState();
}

class _IntolerancesPageWidgetState extends State<IntolerancesPageWidget> {
  late IntolerancesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntolerancesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Intolerances',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Choose the intolerances that fits you:',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: StreamBuilder<List<IntolerancesRecord>>(
                      stream: queryIntolerancesRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 150.0,
                              height: 150.0,
                              child: SpinKitPulse(
                                color: Color(0xFF4B39EF),
                                size: 150.0,
                              ),
                            ),
                          );
                        }
                        List<IntolerancesRecord>
                            listViewIntolerancesRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewIntolerancesRecord =
                            listViewIntolerancesRecordList.isNotEmpty
                                ? listViewIntolerancesRecordList.first
                                : null;
                        return Builder(
                          builder: (context) {
                            final intolerances = listViewIntolerancesRecord!
                                .intolerances!
                                .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: intolerances.length,
                              itemBuilder: (context, intolerancesIndex) {
                                final intolerancesItem =
                                    intolerances[intolerancesIndex];
                                return StreamBuilder<
                                    List<UserNutrientContentRecord>>(
                                  stream: queryUserNutrientContentRecord(
                                    parent: currentUserReference,
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 150.0,
                                          height: 150.0,
                                          child: SpinKitPulse(
                                            color: Color(0xFF4B39EF),
                                            size: 150.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserNutrientContentRecord>
                                        containerUserNutrientContentRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerUserNutrientContentRecord =
                                        containerUserNutrientContentRecordList
                                                .isNotEmpty
                                            ? containerUserNutrientContentRecordList
                                                .first
                                            : null;
                                    return Container(
                                      height: 68.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              intolerancesItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Color(0xFF040404),
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValueMap[
                                                        intolerancesItem] ??=
                                                    containerUserNutrientContentRecord!
                                                        .intolerances!
                                                        .toList()
                                                        .contains(
                                                            intolerancesItem),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxValueMap[
                                                          intolerancesItem] =
                                                      newValue!);
                                                  if (newValue!) {
                                                    final userNutrientContentUpdateData =
                                                        {
                                                      'intolerances': FieldValue
                                                          .arrayUnion([
                                                        intolerancesItem
                                                      ]),
                                                    };
                                                    await containerUserNutrientContentRecord!
                                                        .reference
                                                        .update(
                                                            userNutrientContentUpdateData);
                                                  } else {
                                                    final userNutrientContentUpdateData =
                                                        {
                                                      'intolerances': FieldValue
                                                          .arrayRemove([
                                                        intolerancesItem
                                                      ]),
                                                    };
                                                    await containerUserNutrientContentRecord!
                                                        .reference
                                                        .update(
                                                            userNutrientContentUpdateData);
                                                  }
                                                },
                                                activeColor: Color(0xFFFFC000),
                                                checkColor: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
