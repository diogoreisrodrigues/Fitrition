class ExerciseData {
  final String title;
  final int minutes;
  final double progress;
  final List<String> imagePath;
  final List<String> name;
  final List<String> amount;
  final String video;
  final String description;
  final List<String> steps;

  ExerciseData({
    required this.title,
    required this.minutes,
    required this.progress,
    required this.imagePath,
    required this.name,
    required this.amount,
    required this.video,
    required this.description,
    required this.steps,
  });

  @override
  String toString() {
    return 'ExerciseData(title: $title, minutes: $minutes, progress: $progress, imagePath: $imagePath, name: $name, amount: $amount video: $video)';
  }
}
