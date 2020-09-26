import 'package:flutter/material.dart';

import '../general_utilities.dart';

/// Types of available borders of OTP field
/// [RECT] or [UNDERLINE]
enum OtpBorder { RECT, UNDERLINE }

/// An otp widget helps to enter auth code
/// You need to pass [count]
/// And [MediaQuery.of(context).size.width] as [screenWidth]
/// Widget will define field width and height upon screen width.
class OtpWidget extends StatefulWidget {
  const OtpWidget(
      {Key key,
      @required this.count,
      this.inputType = TextInputType.phone,
      this.textStyle =
          const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      this.fieldsAlignment = MainAxisAlignment.spaceEvenly,
      this.border = OtpBorder.RECT,
      @required this.screenWidth,
      this.onChanged,
      this.onComplete})
      : assert(count > 1),
        super(key: key);

  /// Fields count
  final int count;

  /// Keyboard input type
  final TextInputType inputType;

  /// Text field text style
  final TextStyle textStyle;

  /// Axis alignment
  final MainAxisAlignment fieldsAlignment;

  /// onChanged call back
  final ValueChanged<String> onChanged;

  /// onComplete call back
  final ValueChanged<String> onComplete;

  /// [OtpBorder] by default it's [OtpBorder.RECT]
  final OtpBorder border;

  /// Screen width for responsive width
  final double screenWidth;

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  /// List of text fields focus nodes
  List<FocusNode> _focusNodes;

  /// List of text fields controllers
  List<TextEditingController> _controllers;

  /// List of text fields
  List<Widget> _fields;

  /// List of pins
  List<String> _pins;

  @override
  void initState() {
    super.initState();

    _focusNodes = List<FocusNode>(widget.count);
    _controllers = List<TextEditingController>(widget.count);

    _pins = List.generate(widget.count, (int v) => '');

    _fields = List.generate(widget.count, (index) => _buildField(index));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDimenMedium),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: widget.fieldsAlignment,
        children: _fields,
      ),
    );
  }

  Widget _buildField(int index) {
    double width = (widget.screenWidth / widget.count) - (kDimenNano * 2);

    if (_focusNodes[index] == null) _focusNodes[index] = FocusNode();

    if (_controllers[index] == null)
      _controllers[index] = TextEditingController();

    return Container(
      width: width,
      height: width * (width * 0.6),
      padding: const EdgeInsets.symmetric(horizontal: kDimenNano),
      child: TextField(
        controller: _controllers[index],
        keyboardType: widget.inputType,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: widget.textStyle,
        focusNode: _focusNodes[index],
        decoration: InputDecoration(
            counterText: "",
            border: widget.border == OtpBorder.RECT
                ? OutlineInputBorder()
                : UnderlineInputBorder()),
        onChanged: (String s) {
          if (s.isEmpty) {
            if (index == 0) return;
            _focusNodes[index].unfocus();
            _focusNodes[index - 1].requestFocus();
          }

          setState(() {
            _pins[index] = s;
          });

          if (s.isNotEmpty) _focusNodes[index].unfocus();

          if (index + 1 != widget.count && s.isNotEmpty)
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);

          String currentPin = '';
          _pins.forEach((String value) {
            currentPin += value;
          });

          if (!_pins.contains(null) &&
              !_pins.contains('') &&
              currentPin.length == widget.count) {
            widget.onComplete(currentPin);
          }

          widget.onChanged(currentPin);
        },
      ),
    );
  }
}
