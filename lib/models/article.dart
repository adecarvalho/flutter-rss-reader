class Article {
  String title;
  String link;
  String description;
  String date;
  String imageurl;

  Article({this.title, this.link, this.description, this.date, this.imageurl});

  String getDate() {
    dynamic tmp = this.date.split(" ");
    return 'le, ${tmp[1]} ${tmp[2]} ${tmp[3]}';
  }
}
