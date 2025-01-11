import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetSelectionPage extends StatefulWidget {
  final bool showText;
  final bool showImage;
  final bool showButton;

  const WidgetSelectionPage({
    Key? key,
    required this.showText,
    required this.showImage,
    required this.showButton,
  }) : super(key: key);

  @override
  State<WidgetSelectionPage> createState() => _WidgetSelectionPageState();
}

class _WidgetSelectionPageState extends State<WidgetSelectionPage> {
  late bool isTextSelected;
  late bool isImageSelected;
  late bool isButtonSelected;

  @override
  void initState() {
    super.initState();
    isTextSelected = widget.showText;
    isImageSelected = widget.showImage;
    isButtonSelected = widget.showButton;
  }

  void navigateBack() {
    Navigator.pop(context, {
      'showText': isTextSelected,
      'showImage': isImageSelected,
      'showButton': isButtonSelected,
    });
  }

  Widget customCheckbox({
    required bool value,
    required String label,
    required Function(bool?) onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          color: Colors.grey[200],
          width: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.green[400]!,
                  //   width: 2.0,
                  // ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value ? Colors.green[400] : Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 255, 232, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            customCheckbox(
              value: isTextSelected,
              label: 'Text Widget',
              onChanged: (value) {
                setState(() {
                  isTextSelected = value!;
                });
              },
            ),
            const SizedBox(height: 50),
            customCheckbox(
              value: isImageSelected,
              label: 'Image Widget',
              onChanged: (value) {
                setState(() {
                  isImageSelected = value!;
                });
              },
            ),
            const SizedBox(height: 50),
            customCheckbox(
              value: isButtonSelected,
              label: 'Button Widget',
              onChanged: (value) {
                setState(() {
                  isButtonSelected = value!;
                });
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: navigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Import Widgets',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
