import 'package:flutter/material.dart';

/// Type of Bezier line Chart
enum BezierChartScale {
  HOURLY,
  WEEKLY,
  MONTHLY,
  YEARLY,

  ///numbers sorted in an increasing way.
  CUSTOM,
}

///`BezierChartConfig` allows the customization of the `BezierChart` widget
class BezierChartConfig {
  ///`true` if you want to display the vertical indicator
  final bool showVerticalIndicator;
  final Color verticalIndicatorColor;

  ///`width` of the line used for the vertical indicator
  final double verticalIndicatorStrokeWidth;

  ///`true` if you want to keep the info indicator in a fixed position
  final bool verticalIndicatorFixedPosition;

  ///Color of the bubble indicator, it's white by default
  final Color bubbleIndicatorColor;

  ///TextStyle for the title displayed inside the bubble indicator
  final TextStyle bubbleIndicatorTitleStyle;

  ///TextStyle for the value displayed inside the bubble indicator
  final TextStyle bubbleIndicatorValueStyle;

  ///TextStyle for the label displayed inside the bubble indicator
  final TextStyle bubbleIndicatorLabelStyle;

  ///Color of the background of the chart
  final Color backgroundColor;

  ///Gradient of the background of the chart
  final LinearGradient backgroundGradient;

  ///`true` if you want to display the value of the Y axis, [false] by default
  final bool displayYAxis;

  ///If [displayYAxis] is true, then you can set a positive value to display the steps of Y axis values
  ///e.g 1: stepsYAxis : 5 ,  if your maxValue is 100, then the Y values should be: [0,5,10,15 .... 100]
  ///e.g 2: stepsYAxis : 10 , if your maxValue is 100, then the Y values should be: [10,20,30,40 .... 100]
  final int stepsYAxis;

  ///`true` if you want to start the values of Y axis from the minimum value of your Y values.
  final bool startYAxisFromNonZeroValue;

  ///TextStyle of the text of the Y Axis values
  final TextStyle yAxisTextStyle;

  ///TextStyle of the text of the X Axis values
  final TextStyle xAxisTextStyle;

  ///Height of the footer
  final double footerHeight;

  ///`true` if you want to display the data points
  final bool showDataPoints;

  ///`true` if you want to snap between each data point
  final bool snap;

  ///`true` if you want to enable pinch Zoom for `bezierChartScale` of date types
  /// Pinch and zoom is used to switch beetwen charts of date types
  final bool pinchZoom;

  ///If the `contentWidth` is upper than the current width then the content will be scrollable (only valid for `bezierChartScale` = `CUSTOM`)
  final double contentWidth;

  ///`true` if you want to display a vertical line on each X data point, it only works when there is one `BezierLine`.
  final bool displayLinesXAxis;

  ///Color for the vertical line in each X point, only works when `displayLinesXAxis` is true
  final Color xLinesColor;

  ///`true` if you want do display the dot when there is no value specified (The values inside `onMissingValue`)
  final bool displayDataPointWhenNoValue;

  ///The physics for horizontal ScrollView
  final ScrollPhysics physics;

  /// to fill space below the bar line,
  final BelowBarData belowBarData;


  BezierChartConfig({
    this.verticalIndicatorStrokeWidth = 2.0,
    this.verticalIndicatorColor = Colors.black,
    this.showVerticalIndicator = true,
    this.showDataPoints = true,
    this.displayYAxis = false,
    this.snap = true,
    this.backgroundColor = Colors.transparent,
    this.xAxisTextStyle,
    this.yAxisTextStyle,
    this.footerHeight = 35.0,
    this.contentWidth,
    this.pinchZoom = true,
    this.bubbleIndicatorColor = Colors.white,
    this.backgroundGradient,
    this.verticalIndicatorFixedPosition = false,
    this.startYAxisFromNonZeroValue = true,
    this.displayLinesXAxis = false,
    this.stepsYAxis,
    this.xLinesColor = Colors.grey,
    this.displayDataPointWhenNoValue = true,
    this.bubbleIndicatorLabelStyle = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 9,
    ),
    this.bubbleIndicatorTitleStyle = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 9.5,
    ),
    this.bubbleIndicatorValueStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    ),
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.belowBarData = const BelowBarData(),
  });
}
/***** BelowBarData *****/
/// This class holds data about draw on below space of the bar line,
class BelowBarData {
  final bool show;

  /// if you pass just one color, the solid color will be used,
  /// or if you pass more than one color, we use gradient mode to draw.
  /// then the [gradientFrom], [gradientTo] and [gradientColorStops] is important,
  final List<Color> colors;

  /// if the gradient mode is enabled (if you have more than one color)
  /// [gradientFrom] and [gradientTo] is important otherwise they will be skipped.
  /// you can determine where the gradient should start and end,
  /// values are available between 0 to 1,
  /// Offset(0, 0) represent the top / left
  /// Offset(1, 1) represent the bottom / right
  final Offset gradientFrom;
  final Offset gradientTo;

  /// if more than one color provided gradientColorStops will hold
  /// stop points of the gradient.
  final List<double> gradientColorStops;


  /// holds data for drawing a line from each spot the the bottom of the chart
  final BelowSpotsLine belowSpotsLine;

  const BelowBarData({
    this.show = true,
    this.colors = const [Colors.blueGrey],
    this.gradientFrom = const Offset(0, 0),
    this.gradientTo = const Offset(1, 0),
    this.gradientColorStops,
    this.belowSpotsLine = const BelowSpotsLine(),
  });
}

class BelowSpotsLine {
  final bool show;

  /// determines style of the line
  final FlLine flLineStyle;

  /// a function to determine whether to show or hide the below line on the given spot

  const BelowSpotsLine({
    this.show = false,
    this.flLineStyle = const FlLine(),
  });
}

/// This class can be used wherever we want draw a straight line,
/// and contains visual properties
class FlLine {
  final Color color;
  final double strokeWidth;

  const FlLine({
    this.color = Colors.black,
    this.strokeWidth = 2,
  });
}