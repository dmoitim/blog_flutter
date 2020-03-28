class Post {
  String sId;
  String title;
  String summary;
  String author;
  String category;
  String createDate;

  Post(
      {this.sId,
      this.title,
      this.summary,
      this.author,
      this.category,
      this.createDate});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['sId'];
    title = json['title'];
    summary = json['summary'];
    author = json['author'];
    category = json['category'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sId'] = this.sId;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['author'] = this.author;
    data['category'] = this.category;
    data['createDate'] = this.createDate;
    return data;
  }
}
