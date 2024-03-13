import '/backend/backend.dart';
import '/components/accordion_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accordion_section_model.dart';
export 'accordion_section_model.dart';

class AccordionSectionWidget extends StatefulWidget {
  const AccordionSectionWidget({super.key});

  @override
  State<AccordionSectionWidget> createState() => _AccordionSectionWidgetState();
}

class _AccordionSectionWidgetState extends State<AccordionSectionWidget> {
  late AccordionSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccordionSectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SupportCenterRecord>>(
      stream: querySupportCenterRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<SupportCenterRecord> columnSupportCenterRecordList =
            snapshot.data!;
        if (columnSupportCenterRecordList.isEmpty) {
          return Container(
            width: double.infinity,
            child: EmptyStateWidget(
              icon: Icon(
                Icons.question_mark_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 64.0,
              ),
              title: 'No FAQs',
              description: 'No frquency asked questions have been created.',
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(columnSupportCenterRecordList.length,
              (columnIndex) {
            final columnSupportCenterRecord =
                columnSupportCenterRecordList[columnIndex];
            return AccordionWidget(
              key: Key(
                  'Keygq1_${columnIndex}_of_${columnSupportCenterRecordList.length}'),
              expandedAccordionIndex: _model.accordionSectionExpanded,
              accordionIndex: columnIndex,
              question: columnSupportCenterRecord.question,
              answer: columnSupportCenterRecord.answer,
              action: () async {
                logFirebaseEvent('ACCORDION_SECTION_Container_gq10ioan_CAL');
                if (columnIndex == _model.accordionSectionExpanded) {
                  logFirebaseEvent('accordion_update_component_state');
                  setState(() {
                    _model.accordionSectionExpanded = -1;
                  });
                } else {
                  logFirebaseEvent('accordion_update_component_state');
                  setState(() {
                    _model.accordionSectionExpanded = columnIndex;
                  });
                }
              },
            );
          }),
        );
      },
    );
  }
}
