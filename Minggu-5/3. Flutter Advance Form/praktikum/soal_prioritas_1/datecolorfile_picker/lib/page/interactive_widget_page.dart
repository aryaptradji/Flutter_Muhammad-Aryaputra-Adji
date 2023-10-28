import 'package:datecolorfile_picker/widget/color_picker_widget.dart';
import 'package:datecolorfile_picker/widget/date_picker_widget.dart';
import 'package:datecolorfile_picker/widget/file_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class InteractiveWidgetPage extends StatefulWidget {
  const InteractiveWidgetPage({super.key});

  @override
  State<InteractiveWidgetPage> createState() => _InteractiveWidgetPageState();
}

class _InteractiveWidgetPageState extends State<InteractiveWidgetPage> {
  Color _myColor = Colors.blue;
  DateTime _dueDate = DateTime.now();

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Interactive Widgets"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Builder(builder: (context) {
            return ListView(
              children: [
                DatePickerWidget(
                    chooseDate: _dueDate,
                    onPressed: () async {
                      final chosenDate = await showDatePicker(
                        context: context,
                        initialDate: _dueDate,
                        firstDate: DateTime(1969),
                        lastDate: DateTime(2069),
                      );

                      if (chosenDate != null) {
                        _dueDate = chosenDate;
                        setState(() {});
                      }
                    }),
                const SizedBox(height: 40),
                ColorPickerWidget(
                    myColor: _myColor,
                    onColorChanged: (color) {
                      setState(() {
                        _myColor = color;
                      });
                    }),
                const SizedBox(height: 40),
                const Text("Photo :"),
                const SizedBox(height: 20),
                const FilePickerWidget(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
