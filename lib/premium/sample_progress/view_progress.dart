import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../dialogs.dart';
import '../../models/sample_progress.dart';

class ViewProgress extends StatelessWidget {
  final SampleProgress progress;
  const ViewProgress({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title:
            const Text("View Progress", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () =>
                      showImageDialogBox(context, progress.image, true),
                  child: SizedBox(
                    height: 250,
                    width: size.width * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(progress.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                textPlace(context, progress.name, "Name", true),
                const SizedBox(height: 20),
                textPlace(context, progress.section, "Section", false),
                const SizedBox(height: 20),
                textPlace(context, progress.stage, "Stage", false),
                const SizedBox(height: 20),
                textPlace(context, progress.date, "Date", false),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Note :- This section would start functioning once you start construction your home',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textPlace(
      BuildContext context, String text, String head, bool filled) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      height: 50,
      child: Container(
        decoration: filled
            ? BoxDecoration(
                color: pinkColor,
                borderRadius: BorderRadius.circular(32),
              )
            : BoxDecoration(
                border: Border.all(color: pinkColor),
                borderRadius: BorderRadius.circular(32),
              ),
        child: Center(
          child: SizedBox(
            width: size.width * 0.8,
            child: Row(
              children: [
                Text(
                  "$head - ",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                Text(
                  text,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
