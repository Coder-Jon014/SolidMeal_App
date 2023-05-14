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
import 'diet_page_model.dart';
export 'diet_page_model.dart';

class DietPageWidget extends StatefulWidget {
  const DietPageWidget({Key? key}) : super(key: key);

  @override
  _DietPageWidgetState createState() => _DietPageWidgetState();
}

class _DietPageWidgetState extends State<DietPageWidget> {
  late DietPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DietPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
            'Diet',
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
                      'Choose the (one) diet that fits you:',
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
                    child: StreamBuilder<List<DietsRecord>>(
                      stream: queryDietsRecord(
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
                        List<DietsRecord> listViewDietsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final listViewDietsRecord =
                            listViewDietsRecordList.isNotEmpty
                                ? listViewDietsRecordList.first
                                : null;
                        return Builder(
                          builder: (context) {
                            final diets = listViewDietsRecord!.diets!.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: diets.length,
                              itemBuilder: (context, dietsIndex) {
                                final dietsItem = diets[dietsIndex];
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
                                              dietsItem,
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
                                                        dietsItem] ??=
                                                    containerUserNutrientContentRecord!
                                                        .diets!
                                                        .toList()
                                                        .contains(dietsItem),
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .checkboxValueMap[
                                                      dietsItem] = newValue!);
                                                  if (newValue!) {
                                                    final userNutrientContentUpdateData =
                                                        {
                                                      'diets': _model
                                                          .checkboxCheckedItems,
                                                    };
                                                    await containerUserNutrientContentRecord!
                                                        .reference
                                                        .update(
                                                            userNutrientContentUpdateData);
                                                  } else {
                                                    final userNutrientContentUpdateData =
                                                        {
                                                      'diets': FieldValue
                                                          .arrayRemove(
                                                              [dietsItem]),
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
