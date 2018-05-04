//https://newsapi.org/register/success
//Api key:adbd01f70df242a3a8b22cfcbdbedf4c

/**
    {
    -"source": {
    "id": "reuters",
    "name": "Reuters"
    },
    "author": "Reuters Editorial",
    "title": "Saudi man killed in missile salvo from Yemen",
    "description": "Yemen's Houthi movement fired ballistic missiles at what it called \"economic and vital targets\" in the southern Saudi province of Jizan on Saturday, and Saudi authorities said a man was killed by debris from the projectiles.",
    "url": "https://uk.reuters.com/article/uk-yemen-security-saudi/saudi-man-killed-in-missile-salvo-from-yemen-idUKKBN1HZ0DM?il=0",
    "urlToImage": "https://s4.reutersmedia.net/resources_v2/images/rcom-default.png",
    "publishedAt": "2018-04-28T10:33:17Z"
    },
 **/

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return new Source(id: json['id'], name: json['name']);
  }

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }
}

class News {
  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt});

  Source source;

  String author;
  String title;
  String description;

  String url;
  String urlToImage;
  String publishedAt;

  @override
  String toString() {
    return 'News{source: $source, author: $author, title: $title, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt}';
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return new News(
      source: new Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}
