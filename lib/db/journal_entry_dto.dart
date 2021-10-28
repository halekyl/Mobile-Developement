class JournalEntryDTO {
  late int rating;
  late String title;
  late String body;
  late String date;

  void setTitle(title) { title = title; }
  void setBody(body) { body = body; }
  void setdateTime(date) { date = date; }
  void setRating(rating) { rating = rating; }

  String toString() => 
    "Title: $title, Body: $body, Date: $date, Rating: $rating";

}