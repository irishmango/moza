import 'package:flutter/material.dart';

enum Mode {lesson, quiz}

class ToggleSwitch extends StatefulWidget {
  final Function(Mode) onChanged;

  const ToggleSwitch({super.key, required this.onChanged});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  Mode selectedMode = Mode.lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color.fromRGBO(117, 117, 117, .25), width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // green slider
          AnimatedAlign(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedMode == Mode.lesson
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: (400 - 4) / 2, 
              height: double.infinity,
              decoration: ShapeDecoration(
              color: Color.fromRGBO(88, 178, 112, 1),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              ),
              shadows: [
              BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
                ),
              ]))
                ),

          // foreground buttons
          Row(
            children: [
              _buildOption("Lesson", Mode.lesson),
              _buildOption("Quiz", Mode.quiz),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _buildOption(String label, Mode mode) {
    final isSelected = selectedMode == mode;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMode = mode;
            widget.onChanged(mode);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, 
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Color.fromRGBO(146, 146, 146, 1),
              fontSize: 22,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
              ),
            ));
  }
}