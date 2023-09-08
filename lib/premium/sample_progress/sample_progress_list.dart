import 'package:facelift_constructions/models/sample_progress.dart';
import 'package:facelift_constructions/premium/sample_progress/view_progress.dart';
import 'package:flutter/material.dart';

class SampleProgressList extends StatelessWidget {
  const SampleProgressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Sample Daily Updates',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          width: size.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: sampleProgressList.length,
            itemBuilder: (context, index) =>
                SampleProgressCard(progress: sampleProgressList[index]),
          ),
        ),
      ],
    );
  }
}

class SampleProgressCard extends StatelessWidget {
  final SampleProgress progress;
  const SampleProgressCard({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewProgress(progress: progress)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 10,
              shadowColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  progress.image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
              child: Text(
                progress.name,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                progress.date,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
