String romanianAudio = 'assets/audio/romanian.mp3';
String chineseAudio = 'assets/audio/chinese.mp3';
String englishAudio = 'assets/audio/english.mp3';
String greekAudio = 'assets/audio/greek.mp3';
String japaneseAudio = 'assets/audio/japanese.mp3';
String norwegianAudio = 'assets/audio/norwegian.mp3';
String spanishAudio = 'assets/audio/spanish.mp3';
String turkishAudio = 'assets/audio/turkish.mp3';

List<AudioTranslation> audioTranslationsList = <AudioTranslation>[
  AudioTranslation('bună', romanianAudio, chineseAudio, 'Chinese'),
  AudioTranslation('bună', romanianAudio, englishAudio, 'English'),
  AudioTranslation('bună', romanianAudio, greekAudio, 'Greek'),
  AudioTranslation('bună', romanianAudio, japaneseAudio, 'Japanese'),
  AudioTranslation('bună', romanianAudio, norwegianAudio, 'Norwegian'),
  AudioTranslation('bună', romanianAudio, spanishAudio, 'Spanish'),
  AudioTranslation('bună', romanianAudio, turkishAudio, 'Turkish'),
];

class AudioTranslation {
  AudioTranslation(this.text, this.romanianAudio, this.translationAudio, this.language);

  final String text;
  final String romanianAudio;
  final String translationAudio;
  final String language;
}
