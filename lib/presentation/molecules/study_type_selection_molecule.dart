import 'package:flutter/material.dart';
import 'package:infinite_horizons/domain/study_type_abstract.dart';
import 'package:infinite_horizons/domain/study_type_analytical.dart';
import 'package:infinite_horizons/domain/study_type_creatively.dart';
import 'package:infinite_horizons/domain/tip.dart';
import 'package:infinite_horizons/presentation/atoms/atoms.dart';
import 'package:infinite_horizons/presentation/molecules/molecules.dart';

class StudyTypeSelectionMolecule extends StatefulWidget {
  const StudyTypeSelectionMolecule(this.onSelected);

  final VoidCallback onSelected;

  @override
  State<StudyTypeSelectionMolecule> createState() =>
      _StudyTypeSelectionMoleculeState();
}

class _StudyTypeSelectionMoleculeState
    extends State<StudyTypeSelectionMolecule> {
  late TipType selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = StudyTypeAbstract.instance?.studyType ?? TipType.undefined;
  }

  void onChanged(TipType? type) {
    setState(() {
      selectedType = type ?? TipType.undefined;
    });
    if (selectedType == TipType.analytical) {
      StudyTypeAbstract.instance = StudyTypeAnalytical();
    } else {
      StudyTypeAbstract.instance = StudyTypeCreatively();
    }
    widget.onSelected();
  }

  @override
  Widget build(BuildContext context) {
    return MarginedExpandedAtom(
      child: Column(
        children: [
          const TopBarMolecule(
            title: 'study_type',
            topBarType: TopBarType.none,
            margin: false,
          ),
          const SeparatorAtom(variant: SeparatorVariant.farApart),
          ListTileAtom(
            TipType.analytical.name,
            leading: Radio<TipType>(
              value: TipType.analytical,
              groupValue: selectedType,
              onChanged: onChanged,
            ),
            subtitle: 'recommended_morning',
          ),
          ListTileAtom(
            TipType.creative.name,
            leading: Radio<TipType>(
              value: TipType.creative,
              groupValue: selectedType,
              onChanged: onChanged,
            ),
            subtitle: 'recommended_evening',
          ),
        ],
      ),
    );
  }
}
