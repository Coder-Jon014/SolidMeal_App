import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'onboarding3_model.dart';
export 'onboarding3_model.dart';

class Onboarding3Widget extends StatefulWidget {
  const Onboarding3Widget({Key? key}) : super(key: key);

  @override
  _Onboarding3WidgetState createState() => _Onboarding3WidgetState();
}

class _Onboarding3WidgetState extends State<Onboarding3Widget> {
  late Onboarding3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 4000));

      context.pushNamed('Home');
    });
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
        backgroundColor: Color(0xFFFFCC33),
        body: SafeArea(
          child: Container(
            width: 394.0,
            height: 849.0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.06, -0.38),
                  child: Container(
                    width: 377.0,
                    height: 353.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_6efbhc0k.json',
                        width: 35.0,
                        height: 151.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.72),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 60.0, 60.0, 60.0),
                    child: Image.asset(
                      'assets/images/solidMeal.png',
                      width: 400.0,
                      height: 80.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.03, 0.09),
                  child: Text(
                    'Cooking up something for you......',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
