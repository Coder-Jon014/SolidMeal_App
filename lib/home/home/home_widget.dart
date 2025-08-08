import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:async/async.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'categories_section.dart';
import 'top_picks_section.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;
  late Stream<List<dynamic>> _combinedStream;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.textController ??= TextEditingController(text: _model.queryVariable);
    _combinedStream = _createDataStream();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Stream<List<dynamic>> _createDataStream() {
    return queryUserNutrientContentRecord(
      parent: currentUserReference,
      singleRecord: true,
    ).asyncExpand((userList) {
      if (userList.isEmpty) {
        return Stream.value([null, null, null]);
      }
      final user = userList.first;
      final intoleranceStream = queryIntoleranceListRecord(
        queryBuilder: (intoleranceListRecord) =>
            intoleranceListRecord.whereIn(
                'intolerance', user.intolerances!.toList()),
        singleRecord: true,
      ).map((list) => list.isNotEmpty ? list.first : null);

      final favoriteStream = queryUserFavoriteRecord(
        queryBuilder: (userFavoriteRecord) =>
            userFavoriteRecord.where('userId', isEqualTo: currentUserUid),
        singleRecord: true,
      ).map((list) => list.isNotEmpty ? list.first : null);

      return StreamZip([
        Stream.value(user),
        intoleranceStream,
        favoriteStream,
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<dynamic>>(
      stream: _combinedStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: SpinKitPulse(
                color: Color(0xFF4B39EF),
                size: 150,
              ),
            ),
          );
        }
        final userNutrient =
            snapshot.data![0] as UserNutrientContentRecord?;
        final favoriteRecord =
            snapshot.data![2] as UserFavoriteRecord?;
        if (userNutrient == null || favoriteRecord == null) {
          return Container();
        }
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF1F4F8),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: AuthUserStreamWidget(
                builder: (context) => Text(
                  'Welcome, ${valueOrDefault(currentUserDocument?.firstName, '')}',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context)
                                .headlineMediumFamily),
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x27000000),
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: TextFormField(
                        controller: _model.textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 2000),
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
                              color:
                                  FlutterFlowTheme.of(context).accent3,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
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
                              color: const Color(0xFF14181B),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        maxLines: null,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  const CategoriesSection(),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            'Top Picks',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TopPicksSection(
                    query: _model.queryVariable,
                    nutrientContent: userNutrient,
                    favoriteRecord: favoriteRecord,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
