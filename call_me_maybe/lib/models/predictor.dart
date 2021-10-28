import 'dart:math';

class Magic {
  final List predictions = [
    'Yes Definetly',
    'Better Not Tell You Now',
    'Don\'t Count On It',
    'Outlook Good',
    'Most Likely',
    'It is Certain',
    'Very Doubtful',
    'Reply Hazy, Try Again'
  ];

  final Random random = Random();
  String _response = 'Magic Response';

  String get response => _response;

  void predict() {
    final options = predictions.length;
    _response = (predictions[random.nextInt(options)]);
  }
}
