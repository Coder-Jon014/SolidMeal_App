import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController(text: _model.queryVariable);
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

    return StreamBuilder<List<UserNutrientContentRecord>>(
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
        List<UserNutrientContentRecord> homeUserNutrientContentRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homeUserNutrientContentRecord =
            homeUserNutrientContentRecordList.isNotEmpty
                ? homeUserNutrientContentRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF1F4F8),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: AuthUserStreamWidget(
                builder: (context) => Text(
                  'Welcome, ${valueOrDefault(currentUserDocument?.firstName, '')}',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: StreamBuilder<List<UserFavoriteRecord>>(
              stream: queryUserFavoriteRecord(
                queryBuilder: (userFavoriteRecord) => userFavoriteRecord
                    .where('userId', isEqualTo: currentUserUid),
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
                List<UserFavoriteRecord> columnUserFavoriteRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnUserFavoriteRecord =
                    columnUserFavoriteRecordList.isNotEmpty
                        ? columnUserFavoriteRecordList.first
                        : null;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x27000000),
                              offset: Offset(0.0, 3.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  _model.queryVariable =
                                      _model.textController.text;
                                });
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF14181B),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            maxLines: null,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Salad',
                                      queryParams: {
                                        'type': serializeParam(
                                          'salad',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          'Salad',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                              width: double.infinity,
                                              height: 105.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Salads',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Category  Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Beverages',
                                      queryParams: {
                                        'type': serializeParam(
                                          'drink',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          'Beverage',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1372&q=80',
                                              width: double.infinity,
                                              height: 105.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Beverages',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Category  Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Dessert',
                                      queryParams: {
                                        'type': serializeParam(
                                          'dessert',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          'Dessert',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                                              width: double.infinity,
                                              height: 105.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Dessert',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Category  Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Breakfast',
                                      queryParams: {
                                        'type': serializeParam(
                                          'breakfast',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          'Breakfast',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                                              width: double.infinity,
                                              height: 105.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Breakfast',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Category  Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MainCourse',
                                      queryParams: {
                                        'type': serializeParam(
                                          'main course',
                                          ParamType.String,
                                        ),
                                        'title': serializeParam(
                                          'Main Course',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x230E151B),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                                              width: double.infinity,
                                              height: 105.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Main Course',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Category  Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                'Top Picks',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: RecipesCall.call(
                            query: _model.queryVariable,
                            number: 20,
                            diet: homeUserNutrientContentRecord!
                                    .diets!.isNotEmpty
                                ? homeUserNutrientContentRecord!.diets!.first
                                : null,
                            sort: 'random',
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
                            final wrapRecipesResponse = snapshot.data!;
                            final recipesJson = wrapRecipesResponse
                                .jsonBody; // get the JSON body of the response
                            // Convert the JSON to a list of maps (recipes)
                            final recipes = recipesJson['results']
                                .cast<Map<String, dynamic>>();

                            // call the knn algorithm integrator on the recipes
                            final knnRecipes = functions.knnAlgorithmIntegrator(
                              homeUserNutrientContentRecord!.maxCarbs!,
                              homeUserNutrientContentRecord!.maxProtein!,
                              homeUserNutrientContentRecord!.maxCalories!,
                              homeUserNutrientContentRecord!.maxFat!,
                              homeUserNutrientContentRecord!.maxCalcium!,
                              homeUserNutrientContentRecord!.maxCholesterol!,
                              homeUserNutrientContentRecord!.maxSaturatedFat!,
                              homeUserNutrientContentRecord!.maxPotassium!,
                              homeUserNutrientContentRecord!.maxSugar!,
                              homeUserNutrientContentRecord!.maxSodium!,
                              homeUserNutrientContentRecord!.maxFiber!,
                              homeUserNutrientContentRecord!.maxMagnesium!,
                              recipes,
                            );

                            return Builder(
                              builder: (context) {
                                return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.vertical,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(knnRecipes.length,
                                      (recipeIndex) {
                                    final recipeItem = knnRecipes[recipeIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child:
                                          StreamBuilder<List<RecipeListRecord>>(
                                        stream: queryRecipeListRecord(),
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
                                          List<RecipeListRecord>
                                              containerRecipeListRecordList =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (containerRecipeListRecordList
                                                  .first.listOfRecipes!
                                                  .toList()
                                                  .contains(getJsonField(
                                                    recipeItem,
                                                    r'''$.id''',
                                                  ))) {
                                                context.pushNamed(
                                                  'DetailsScreenDatabase',
                                                  queryParams: {
                                                    'recipeId': serializeParam(
                                                      getJsonField(
                                                        recipeItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                final recipeListUpdateData = {
                                                  'list_of_recipes':
                                                      FieldValue.arrayUnion([
                                                    getJsonField(
                                                      recipeItem,
                                                      r'''$.id''',
                                                    )
                                                  ]),
                                                };
                                                await containerRecipeListRecordList
                                                    .first.reference
                                                    .update(
                                                        recipeListUpdateData);

                                                context.pushNamed(
                                                  'recipeAdder',
                                                  queryParams: {
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        recipeItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.89,
                                              height: 236.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x230E151B),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 4.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          recipeItem,
                                                          r'''$.image''',
                                                        ),
                                                        width: double.infinity,
                                                        height: 155.0,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.99,
                                                                    -1.29),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                getJsonField(
                                                                  recipeItem,
                                                                  r'''$.title''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.94, -0.8),
                                                          child: ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              final recipeIdElement =
                                                                  getJsonField(
                                                                recipeItem,
                                                                r'''$.id''',
                                                              );
                                                              final recipeIdUpdate = columnUserFavoriteRecord!
                                                                      .recipeId!
                                                                      .toList()
                                                                      .contains(
                                                                          recipeIdElement)
                                                                  ? FieldValue
                                                                      .arrayRemove([
                                                                      recipeIdElement
                                                                    ])
                                                                  : FieldValue
                                                                      .arrayUnion([
                                                                      recipeIdElement
                                                                    ]);
                                                              final userFavoriteUpdateData =
                                                                  {
                                                                'recipeId':
                                                                    recipeIdUpdate,
                                                              };
                                                              await columnUserFavoriteRecord!
                                                                  .reference
                                                                  .update(
                                                                      userFavoriteUpdateData);
                                                            },
                                                            value: columnUserFavoriteRecord!
                                                                .recipeId!
                                                                .toList()
                                                                .contains(
                                                                    getJsonField(
                                                                  recipeItem,
                                                                  r'''$.id''',
                                                                )),
                                                            onIcon: Icon(
                                                              Icons
                                                                  .bookmark_outlined,
                                                              color: Color(
                                                                  0xFFFFCC33),
                                                              size: 35.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .bookmark_border_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: RecipesCall.call(
                            query: _model.queryVariable,
                            number: 1,
                            diet: homeUserNutrientContentRecord!
                                    .diets!.isNotEmpty
                                ? homeUserNutrientContentRecord!.diets!.first
                                : null,
                            sort: 'random',
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
                            final wrapRecipesResponse = snapshot.data!;
                            final recipesJson = wrapRecipesResponse
                                .jsonBody; // get the JSON body of the response
                            // Convert the JSON to a list of maps (recipes)
                            List<Map<String, dynamic>> recipes =
                                List<Map<String, dynamic>>.from(
                                    recipesJson["results"]);

                            // Apply your custom function to the recipes
                            recipes = functions.knnAlgorithmIntegrator(
                                homeUserNutrientContentRecord!.maxCarbs ?? 100,
                                homeUserNutrientContentRecord!.maxProtein ??
                                    100,
                                homeUserNutrientContentRecord!.maxCalories ??
                                    2000,
                                homeUserNutrientContentRecord!.maxFat ?? 100,
                                homeUserNutrientContentRecord!.maxCalcium ??
                                    100,
                                homeUserNutrientContentRecord!.maxCholesterol ??
                                    100,
                                homeUserNutrientContentRecord!
                                        .maxSaturatedFat ??
                                    100,
                                homeUserNutrientContentRecord!.maxPotassium ??
                                    100,
                                homeUserNutrientContentRecord!.maxSugar ?? 100,
                                homeUserNutrientContentRecord!.maxSodium ?? 100,
                                homeUserNutrientContentRecord!.maxFiber ?? 100,
                                homeUserNutrientContentRecord!.maxMagnesium ??
                                    100,
                                recipes);

                            // Convert the list of recipes back to JSON
                            // Map<String, dynamic> newRecipesJson = {
                            //   "results": recipes
                            // };

                            return Builder(
                              builder: (context) {
                                final recipe = recipes;
                                return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.vertical,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(recipe.length,
                                      (recipeIndex) {
                                    final recipeItem = recipe[recipeIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child:
                                          StreamBuilder<List<RecipeListRecord>>(
                                        stream: queryRecipeListRecord(),
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
                                          List<RecipeListRecord>
                                              containerRecipeListRecordList =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (containerRecipeListRecordList
                                                  .first.listOfRecipes!
                                                  .toList()
                                                  .contains(getJsonField(
                                                    recipeItem,
                                                    r'''$.id''',
                                                  ))) {
                                                context.pushNamed(
                                                  'DetailsScreenDatabase',
                                                  queryParams: {
                                                    'recipeId': serializeParam(
                                                      getJsonField(
                                                        recipeItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                final recipeListUpdateData = {
                                                  'list_of_recipes':
                                                      FieldValue.arrayUnion([
                                                    getJsonField(
                                                      recipeItem,
                                                      r'''$.id''',
                                                    )
                                                  ]),
                                                };
                                                await containerRecipeListRecordList
                                                    .first.reference
                                                    .update(
                                                        recipeListUpdateData);

                                                context.pushNamed(
                                                  'recipeAdder',
                                                  queryParams: {
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        recipeItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.89,
                                              height: 236.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x230E151B),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 4.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          recipeItem,
                                                          r'''$.image''',
                                                        ),
                                                        width: double.infinity,
                                                        height: 155.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.99,
                                                                    -1.29),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                getJsonField(
                                                                  recipeItem,
                                                                  r'''$.title''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          18.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.96, 0.54),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final recipeIdElement =
                                                                    getJsonField(
                                                                  recipeItem,
                                                                  r'''$.id''',
                                                                );
                                                                final recipeIdUpdate = columnUserFavoriteRecord!
                                                                        .recipeId!
                                                                        .toList()
                                                                        .contains(
                                                                            recipeIdElement)
                                                                    ? FieldValue
                                                                        .arrayRemove([
                                                                        recipeIdElement
                                                                      ])
                                                                    : FieldValue
                                                                        .arrayUnion([
                                                                        recipeIdElement
                                                                      ]);
                                                                final userFavoriteUpdateData =
                                                                    {
                                                                  'recipeId':
                                                                      recipeIdUpdate,
                                                                };
                                                                await columnUserFavoriteRecord!
                                                                    .reference
                                                                    .update(
                                                                        userFavoriteUpdateData);
                                                              },
                                                              value: columnUserFavoriteRecord!
                                                                  .recipeId!
                                                                  .toList()
                                                                  .contains(
                                                                      getJsonField(
                                                                    recipeItem,
                                                                    r'''$.id''',
                                                                  )),
                                                              onIcon: Icon(
                                                                Icons
                                                                    .bookmark_outlined,
                                                                color: Color(
                                                                    0xFFFFCC33),
                                                                size: 35.0,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .bookmark_border_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
