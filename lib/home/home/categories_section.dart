import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xFFF1F4F8),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                            width: double.infinity,
                            height: 105,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                          child: Text(
                            'Salads',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            'Category  Name',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
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
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1497534446932-c925b458314e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1372&q=80',
                            width: double.infinity,
                            height: 105,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                          child: Text(
                            'Beverages',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            'Category  Name',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
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
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                            width: double.infinity,
                            height: 105,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                          child: Text(
                            'Dessert',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            'Category  Name',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
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
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                            width: double.infinity,
                            height: 105,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                          child: Text(
                            'Breakfast',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            'Category  Name',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
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
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x230E151B),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                            width: double.infinity,
                            height: 105,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                          child: Text(
                            'Main Course',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF14181B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            'Category  Name',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                                      FlutterFlowTheme.of(context)
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
    );
  }
}
