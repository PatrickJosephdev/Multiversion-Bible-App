class BibleVerse {
  final String bookName;
  final int chapterNumber;
  final int verseNumber;
  final String text;

  BibleVerse({
   required this.bookName,
    required this.chapterNumber,
    required this.verseNumber,
    required this.text
});

  factory BibleVerse.fromJson(Map<String, dynamic> json) => BibleVerse(
    bookName: json['book_name'],
    chapterNumber: json['chapter'],
    verseNumber: json['verse'],
    text: json['text'],
  );

}