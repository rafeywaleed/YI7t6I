import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget_selection_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool showText = false;
  bool showImage = false;
  bool showButton = false;
  bool isEmptyPress = false;

  void navigateToWidgetSelection() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WidgetSelectionPage(
          showText: showText,
          showImage: showImage,
          showButton: showButton,
        ),
      ),
    );

    if (result != null && result is Map<String, bool>) {
      setState(() {
        showText = result['showText'] ?? false;
        showImage = result['showImage'] ?? false;
        showButton = result['showButton'] ?? false;

        if (!showText && !showImage && !showButton) {
          isEmptyPress = false;
        }
        if (showImage || showText) {
          isEmptyPress = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Text(
              "Assignment App",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showText)
                      Container(
                        height: height * 0.08,
                        width: width * 0.7,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            "Text Widget",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    else
                      SizedBox(height: height * 0.1),
                    SizedBox(height: height * 0.1),
                    if (showImage)
                      Container(
                        height: width * 0.4,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Upload Image",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    else if (isEmptyPress)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Add at-least a widget to save",
                          style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )
                    else
                      SizedBox(height: width * 0.2),
                    SizedBox(height: height * 0.1),
                    if (showButton)
                      ElevatedButton(
                        onPressed: () {
                          if (showText || showImage) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Saved Successfully!',
                                  style: GoogleFonts.poppins(
                                    color: Colors.green[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: Colors.green[100],
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              isEmptyPress = true;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[300],
                            textStyle: GoogleFonts.poppins(fontSize: 16),
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            shape: const BeveledRectangleBorder()),
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
                    else
                      SizedBox(height: height * 0.1),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: navigateToWidgetSelection,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
                textStyle: GoogleFonts.poppins(fontSize: 16),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  'Add Widgets',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }
}
