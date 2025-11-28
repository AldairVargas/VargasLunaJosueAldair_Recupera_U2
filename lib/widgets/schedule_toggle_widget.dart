import 'package:flutter/material.dart';

class ScheduleToggleWidget extends StatefulWidget {
  final String schedule;

  const ScheduleToggleWidget({super.key, required this.schedule});

  @override
  State<ScheduleToggleWidget> createState() => _ScheduleToggleWidgetState();
}

class _ScheduleToggleWidgetState extends State<ScheduleToggleWidget> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _toggleVisibility,
          child: Text(_isVisible ? 'Ocultar Horario' : 'Ver Horario'),
        ),
        if (_isVisible)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Horario: ${widget.schedule}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}
