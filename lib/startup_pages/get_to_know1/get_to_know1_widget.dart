import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'get_to_know1_model.dart';
export 'get_to_know1_model.dart';

class GetToKnow1Widget extends StatefulWidget {
  const GetToKnow1Widget({Key? key}) : super(key: key);

  @override
  _GetToKnow1WidgetState createState() => _GetToKnow1WidgetState();
}

class _GetToKnow1WidgetState extends State<GetToKnow1Widget>
    with TickerProviderStateMixin {
  late GetToKnow1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, 140.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.9, 0.9),
          end: Offset(1.0, 1.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(-0.349, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetToKnow1Model());
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final getToKnow1UsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 50.0),
                            child: Container(
                              width: 200.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'SolidMeal',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: StreamBuilder<List<IllnessesRecord>>(
                              stream: queryIllnessesRecord(),
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
                                List<IllnessesRecord>
                                    containerIllnessesRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 570.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 15.0, 15.0),
                                      child: StreamBuilder<
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
                                              columnUserNutrientContentRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final columnUserNutrientContentRecord =
                                              columnUserNutrientContentRecordList
                                                      .isNotEmpty
                                                  ? columnUserNutrientContentRecordList
                                                      .first
                                                  : null;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 24.0),
                                                child: Text(
                                                  'We want to get to know you better so we\ncan give the best recipe options \nthat fits you.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  'What illnesses do you have?\n (select one that apply then Next,\n if none click Next)',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .hypertensionValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .hypertensionValue =
                                                            newValue!);
                                                      },
                                                      activeColor:
                                                          Color(0xFFFFCC33),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Hypertension',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .diabetesValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .diabetesValue =
                                                            newValue!);
                                                      },
                                                      activeColor: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Diabetes',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 80.0, 0.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final userFavoriteCreateData =
                                                        createUserFavoriteRecordData(
                                                      userId: currentUserUid,
                                                    );
                                                    await UserFavoriteRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            userFavoriteCreateData);
                                                    if (_model.diabetesValue!) {
                                                      final usersUpdateData1 =
                                                          createUsersRecordData(
                                                        userIllness: 'Diabetes',
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData1);

                                                      final usersUpdateData2 = {
                                                        'list_of_illness':
                                                            FieldValue
                                                                .arrayUnion([
                                                          'Diabetes'
                                                        ]),
                                                      };
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData2);

                                                      final userNutrientContentUpdateData1 =
                                                          createUserNutrientContentRecordData(
                                                        maxSaturatedFat:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetSaturatedFat
                                                                ?.toDouble(),
                                                        maxSodium:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetSodium
                                                                ?.toDouble(),
                                                        maxSugar:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetSugar
                                                                ?.toDouble(),
                                                        minCarbs: 10.0,
                                                        maxCarbs: 60.0,
                                                        minProtein: 10.0,
                                                        maxProtein:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetProtein,
                                                        minCalories: 50.0,
                                                        maxCalories: 666.7,
                                                        minFat: 1.0,
                                                        maxFat:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetSaturatedFat
                                                                ?.toDouble(),
                                                        minCalcium: 0.0,
                                                        maxCalcium:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetCalcium,
                                                        minCholesterol: 0.0,
                                                        maxCholesterol: 100.0,
                                                        minSaturatedFat: 0.0,
                                                        minPotassium: 0.0,
                                                        maxPotassium:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetPotassium,
                                                        maxFiber:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetFiber,
                                                        maxMagnesium:
                                                            containerIllnessesRecordList[
                                                                    1]
                                                                .targetMagnesium,
                                                      );
                                                      await columnUserNutrientContentRecord!
                                                          .reference
                                                          .update(
                                                              userNutrientContentUpdateData1);
                                                      if (_model
                                                          .hypertensionValue!) {
                                                        final usersUpdateData3 =
                                                            createUsersRecordData(
                                                          userIllness:
                                                              'Hypertension',
                                                        );
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData3);

                                                        final usersUpdateData4 =
                                                            {
                                                          'list_of_illness':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            'Hypertension'
                                                          ]),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData4);

                                                        context.pushNamed(
                                                            'GetToKnow3');
                                                      } else {
                                                        context.pushNamed(
                                                            'GetToKnow3');
                                                      }

                                                      return;
                                                    } else {
                                                      if (_model
                                                          .hypertensionValue!) {
                                                        final usersUpdateData5 =
                                                            createUsersRecordData(
                                                          userIllness:
                                                              'Hypertension',
                                                        );
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData5);

                                                        final usersUpdateData6 =
                                                            {
                                                          'list_of_illness':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            'Hypertension'
                                                          ]),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData6);

                                                        final userNutrientContentUpdateData2 =
                                                            createUserNutrientContentRecordData(
                                                          maxSaturatedFat:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetSaturatedFat
                                                                  ?.toDouble(),
                                                          maxSodium:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetSodium
                                                                  ?.toDouble(),
                                                          maxSugar:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetSugar
                                                                  ?.toDouble(),
                                                          minCarbs: 10.0,
                                                          maxCarbs: 60.0,
                                                          minProtein: 10.0,
                                                          maxProtein:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetProtein,
                                                          minCalories: 50.0,
                                                          maxCalories: 666.7,
                                                          minFat: 1.0,
                                                          maxFat: containerIllnessesRecordList[
                                                                  0]
                                                              .targetSaturatedFat
                                                              ?.toDouble(),
                                                          minCalcium: 0.0,
                                                          maxCalcium:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetCalcium,
                                                          minCholesterol: 0.0,
                                                          maxCholesterol: 100.0,
                                                          minSaturatedFat: 0.0,
                                                          minPotassium: 0.0,
                                                          maxPotassium:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetPotassium,
                                                          maxFiber:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetFiber,
                                                          maxMagnesium:
                                                              containerIllnessesRecordList[
                                                                      0]
                                                                  .targetMagnesium,
                                                        );
                                                        await columnUserNutrientContentRecord!
                                                            .reference
                                                            .update(
                                                                userNutrientContentUpdateData2);

                                                        context.pushNamed(
                                                            'GetToKnow3');
                                                      } else {
                                                        final userNutrientContentUpdateData3 =
                                                            createUserNutrientContentRecordData(
                                                          maxSaturatedFat:
                                                              100.0,
                                                          maxSodium: 100.0,
                                                          maxSugar: 100.0,
                                                          minCarbs: 10.0,
                                                          maxCarbs: 100.0,
                                                          minProtein: 10.0,
                                                          maxProtein: 100.0,
                                                          minCalories: 50.0,
                                                          maxCalories: 800.0,
                                                          minFat: 1.0,
                                                          maxFat: 100.0,
                                                          minCalcium: 0.0,
                                                          maxCalcium: 100.0,
                                                          minCholesterol: 0.0,
                                                          maxCholesterol: 100.0,
                                                          minSaturatedFat: 0.0,
                                                          minPotassium: 0.0,
                                                          maxPotassium: 100.0,
                                                        );
                                                        await columnUserNutrientContentRecord!
                                                            .reference
                                                            .update(
                                                                userNutrientContentUpdateData3);

                                                        final usersUpdateData7 =
                                                            {
                                                          'list_of_illness':
                                                              FieldValue
                                                                  .arrayUnion(
                                                                      ['None']),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData7);

                                                        final usersUpdateData8 =
                                                            createUsersRecordData(
                                                          userIllness: 'None',
                                                        );
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData8);

                                                        context.pushNamed(
                                                            'GetToKnow3');
                                                      }

                                                      return;
                                                    }
                                                  },
                                                  text: 'Next',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 44.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.black,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
