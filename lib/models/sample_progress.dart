class SampleProgress {
  String name;
  String section;
  String stage;
  String date;
  String image;
  SampleProgress({
    required this.name,
    required this.section,
    required this.stage,
    required this.date,
    required this.image,
  });
}

List<SampleProgress> sampleProgressList = [
  SampleProgress(
    name: 'Boundry Wall',
    section: 'Masonry',
    stage: 'Undergoing',
    date: '1/9/2023',
    image: 'assets/sample_progress/1.png',
  ),
  SampleProgress(
    name: 'Ceiling Wiring',
    section: 'Electrical',
    stage: 'Undergoing',
    date: '2/9/2023',
    image: 'assets/sample_progress/2.png',
  ),
  SampleProgress(
    name: 'Conduit Wiring',
    section: 'Plumbing',
    stage: 'Started',
    date: '3/9/2023',
    image: 'assets/sample_progress/3.jpg',
  ),
  SampleProgress(
    name: 'Lenter',
    section: 'Masonry',
    stage: 'Started',
    date: '4/9/2023',
    image: 'assets/sample_progress/4.png',
  ),
  SampleProgress(
    name: 'Mechanical In-Wall Tank',
    section: 'Plumbing',
    stage: 'Undergoing',
    date: '5/9/2023',
    image: 'assets/sample_progress/5.png',
  ),
  SampleProgress(
    name: 'Paint Mixing',
    section: 'Painting',
    stage: 'Finished',
    date: '6/9/2023',
    image: 'assets/sample_progress/6.jpg',
  ),
  SampleProgress(
    name: 'Plaster',
    section: 'Masonry',
    stage: 'Finished',
    date: '7/9/2023',
    image: 'assets/sample_progress/7.png',
  ),
  SampleProgress(
    name: 'TV Panelling',
    section: 'Carpentry',
    stage: 'Finished',
    date: '8/9/2023',
    image: 'assets/sample_progress/8.jpg',
  ),
];
