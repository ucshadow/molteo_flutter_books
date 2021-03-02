import 'package:flutter/material.dart';

import 'a_icon.dart';

class ADayTimePicker extends StatefulWidget {
  final callBack;
  final String buttonMessage;
  final String initialTime;
  final AIcon icon;

  const ADayTimePicker(
      {Key key, this.callBack, this.buttonMessage, this.initialTime, this.icon})
      : super(key: key);

  @override
  _ADayTimePickerState createState() => _ADayTimePickerState();
}

class _ADayTimePickerState extends State<ADayTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void initState() {
    if(widget.initialTime != null) {
      selectedTime = TimeOfDay.fromDateTime(DateTime.parse(widget.initialTime));
    }
    super.initState();
  }

  Future<void> _selectedTimeRTL(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      widget.callBack(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("${selectedTime.hour}:${selectedTime.minute}"),
          SizedBox(
            height: 20.0,
          ),
          _addButton(),
        ],
      ),
    );
  }

  _addButton() {
    if(widget.icon == null) {
      return RaisedButton(
        onPressed: () => _selectedTimeRTL(context),
        child: Text(this.widget.buttonMessage),
      );
    }
    return IconButton(
      onPressed: () => _selectedTimeRTL(context),
      icon: widget.icon,
    );
  }
}
