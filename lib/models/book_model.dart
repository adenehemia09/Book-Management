class Book {
   int id;
   int userId;
   String isbn;
   String title;
   String subtitle;
   String author;
   String published;
   String publisher;
   int pages;
   String description;
   String website;
   String createdAt;
   String updatedAt;

  Book({
    required this.id,
    required this.userId,
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      userId: json['user_id'],
      isbn: json['isbn'],
      title: json['title'],
      subtitle: json['subtitle'],
      author: json['author'],
      published: json['published'],
      publisher: json['publisher'],
      pages: json['pages'],
      description: json['description'],
      website: json['website'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'published': published,
      'publisher': publisher,
      'pages': pages,
      'description': description,
      'website': website,
    };
  }

}
