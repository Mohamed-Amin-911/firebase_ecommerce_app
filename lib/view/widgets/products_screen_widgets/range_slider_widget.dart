import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  double _lowerValue = 0.0;
  double _upperValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            rangeThumbShape: const RoundRangeSliderThumbShape(),
            rangeTickMarkShape: const RoundRangeSliderTickMarkShape(),
            rangeTrackShape: const RectangularRangeSliderTrackShape(),
            rangeValueIndicatorShape:
                const PaddleRangeSliderValueIndicatorShape(),
          ),
          child: RangeSlider(
            values: RangeValues(_lowerValue, _upperValue),
            min: 0.0,
            max: 100.0,
            divisions: 10,
            labels: RangeLabels(
              _lowerValue.round().toString(),
              _upperValue.round().toString(),
            ),
            onChanged: (values) {
              setState(() {
                _lowerValue = values.start;
                _upperValue = values.end;
              });
            },
          ),
        ),
        Text(
          'Lower Value: ${_lowerValue.round()}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Upper Value: ${_upperValue.round()}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
