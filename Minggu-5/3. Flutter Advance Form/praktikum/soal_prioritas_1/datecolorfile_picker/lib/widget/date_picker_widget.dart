// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime chooseDate;
  final void Function() onPressed;

  const DatePickerWidget({
    Key? key,
    required this.chooseDate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date :"),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text("Select Date"),
            ),
          ],
        ),
        Text(DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(chooseDate)),
      ],
    );
  }
}
