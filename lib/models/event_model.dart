class Event {
  int id;
  String name;
  String slug;
  String content;
  String start;
  String end;
  bool isFree;
  String poster;
  String ticketUrl;
  Format format;
  Category category;
  Venue venue;

  Event(
      {this.id,
      this.name,
      this.slug,
      this.content,
      this.start,
      this.end,
      this.isFree,
      this.poster,
      this.ticketUrl,
      this.format,
      this.category,
      this.venue});

  factory Event.fromMap(Map<String, dynamic> jsonData) {
    return Event(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
      content: jsonData["content"],
      start: jsonData["start"],
      end: jsonData["end"],
      isFree: jsonData["is_free"],
      poster: jsonData["poster_url"],
      ticketUrl: jsonData["ticket_url"],
      format: Format.fromMap(jsonData["format"]),
      category: Category.fromMap(jsonData["category"]),
      venue: Venue.fromMap(jsonData["venue"]),
    );
  }
}

class Format {
  int id;
  String name;
  String slug;

  Format({this.id, this.name, this.slug});

  factory Format.fromMap(Map<String, dynamic> jsonData) {
    return Format(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
    );
  }
}

class Category {
  int id;
  String name;
  String slug;

  Category({this.id, this.name, this.slug});

  factory Category.fromMap(Map<String, dynamic> jsonData) {
    return Category(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
    );
  }
}

class Venue {
  int id;
  String name;
  String slug;
  String about;
  String lat;
  String lng;
  int status;
  String phone;
  City city;
  District district;
  // Neighborhood neighborhood;
  String address;

  Venue({
    this.id,
    this.name,
    this.slug,
    this.about,
    this.lat,
    this.lng,
    this.status,
    this.phone,
    this.city,
    this.district,
    // this.neighborhood,
    this.address,
  });

  factory Venue.fromMap(Map<String, dynamic> jsonData) {
    return Venue(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
      about: jsonData["about"],
      lat: jsonData["lat"],
      lng: jsonData["lng"],
      status: jsonData["status"],
      phone: jsonData["phone"],
      city: City.fromMap(jsonData["city"]),
      district: District.fromMap(jsonData["district"]),
      // neighborhood: Neighborhood.fromMap(jsonData["neighborhood"]),
      address: jsonData["address"],
      // tags: Tag.fromMap(jsonData["tags"]),
    );
  }
}

class City {
  int id;
  String name;
  String slug;

  City({this.id, this.name, this.slug});

  factory City.fromMap(Map<String, dynamic> jsonData) {
    return City(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
    );
  }
}

class District {
  int id;
  String name;
  String slug;

  District({this.id, this.name, this.slug});

  factory District.fromMap(Map<String, dynamic> jsonData) {
    return District(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
    );
  }
}

// class Neighborhood {
//   int id;
//   String name;
//   String slug;

//   Neighborhood({this.id, this.name, this.slug});

//   factory Neighborhood.fromMap(Map<String, dynamic> jsonData) {
//     return Neighborhood(
//       id: jsonData["id"],
//       name: jsonData["name"],
//       slug: jsonData["slug"],
//     );
//   }
// }

class Tag {
  int id;
  String name;
  String slug;

  Tag({this.id, this.name, this.slug});

  factory Tag.fromMap(Map<String, dynamic> jsonData) {
    return Tag(
      id: jsonData["id"],
      name: jsonData["name"],
      slug: jsonData["slug"],
    );
  }
}

final List<City> cities = [
  City(id: 1, name: "Adana", slug: "adana"),
  City(id: 2, name: "Adıyaman", slug: "adiyaman"),
  City(id: 3, name: "Afyon", slug: "afyon"),
  City(id: 85, name: "Afyonkarahisar", slug: "afyonkarahisar"),
  City(id: 4, name: "Ağrı", slug: "agri"),
  City(id: 5, name: "Aksaray", slug: "aksaray"),
  City(id: 6, name: "Amasya", slug: "amasya"),
  City(id: 7, name: "Ankara", slug: "ankara"),
  City(id: 8, name: "Antalya", slug: "antalya"),
  City(id: 9, name: "Ardahan", slug: "ardahan"),
  City(id: 10, name: "Artvin", slug: "artvin"),
  City(id: 11, name: "Aydın", slug: "aydin"),
  City(id: 12, name: "Balıkesir", slug: "balikesir"),
  City(id: 13, name: "Bartın", slug: "bartin"),
  City(id: 14, name: "Batman", slug: "batman"),
  City(id: 15, name: "Bayburt", slug: "bayburt"),
  City(id: 16, name: "Bilecik", slug: "bilecik"),
  City(id: 17, name: "Bingöl", slug: "bingol"),
  City(id: 18, name: "Bitlis", slug: "bitlis"),
  City(id: 19, name: "Bolu", slug: "bolu"),
  City(id: 20, name: "Burdur", slug: "burdur"),
  City(id: 21, name: "Bursa", slug: "bursa"),
  City(id: 22, name: "Çanakkale", slug: "canakkale"),
  City(id: 23, name: "Çankırı", slug: "cankiri"),
  City(id: 24, name: "Çorum", slug: "corum"),
  City(id: 25, name: "Denizli", slug: "denizli"),
  City(id: 26, name: "Diyarbakır", slug: "diyarbakir"),
  City(id: 27, name: "Düzce", slug: "duzce"),
  City(id: 28, name: "Edirne", slug: "edirne"),
  City(id: 29, name: "Elazığ", slug: "elazig"),
  City(id: 30, name: "Erzincan", slug: "erzincan"),
  City(id: 31, name: "Erzurum", slug: "erzurum"),
  City(id: 32, name: "Eskişehir", slug: "eskisehir"),
  City(id: 33, name: "Gaziantep", slug: "gaziantep"),
  City(id: 34, name: "Giresun", slug: "giresun"),
  City(id: 35, name: "Gümüşhane", slug: "gumushane"),
  City(id: 36, name: "Hakkari", slug: "hakkari"),
  City(id: 37, name: "Hatay", slug: "hatay"),
  City(id: 38, name: "Iğdır", slug: "igdir"),
  City(id: 39, name: "Isparta", slug: "isparta"),
  City(id: 40, name: "İstanbul", slug: "istanbul"),
  City(id: 41, name: "İzmir", slug: "izmir"),
  City(id: 42, name: "Kahramanmaraş", slug: "kahramanmaras"),
  City(id: 43, name: "Karabük", slug: "karabuk"),
  City(id: 44, name: "Karaman", slug: "karaman"),
  City(id: 45, name: "Kars", slug: "kars"),
  City(id: 46, name: "Kastamonu", slug: "kastamonu"),
  City(id: 47, name: "Kayseri", slug: "kayseri"),
  City(id: 51, name: "Kilis", slug: "kilis"),
  City(id: 48, name: "Kırıkkale", slug: "kirikkale"),
  City(id: 49, name: "Kırklareli", slug: "kirklareli"),
  City(id: 50, name: "Kırşehir", slug: "kirsehir"),
  City(id: 84, name: "KKTC", slug: "kktc"),
  City(id: 52, name: "Kocaeli", slug: "kocaeli"),
  City(id: 53, name: "Konya", slug: "konya"),
  City(id: 54, name: "Kütahya", slug: "kutahya"),
  City(id: 83, name: "Lefkoşa", slug: "lefkosa"),
  City(id: 55, name: "Malatya", slug: "malatya"),
  City(id: 56, name: "Manisa", slug: "manisa"),
  City(id: 57, name: "Mardin", slug: "mardin"),
  City(id: 58, name: "Mersin", slug: "mersin"),
  City(id: 59, name: "Muğla", slug: "mugla"),
  City(id: 60, name: "Muş", slug: "mus"),
  City(id: 61, name: "Nevşehir", slug: "nevsehir"),
  City(id: 62, name: "Niğde", slug: "nigde"),
  City(id: 63, name: "Ordu", slug: "ordu"),
  City(id: 64, name: "Osmaniye", slug: "osmaniye"),
  City(id: 65, name: "Rize", slug: "rize"),
  City(id: 66, name: "Sakarya", slug: "sakarya"),
  City(id: 67, name: "Samsun", slug: "samsun"),
  City(id: 71, name: "Şanlıurfa", slug: "sanliurfa"),
  City(id: 68, name: "Siirt", slug: "siirt"),
  City(id: 69, name: "Sinop", slug: "sinop"),
  City(id: 72, name: "Şırnak", slug: "sirnak"),
  City(id: 70, name: "Sivas", slug: "sivas"),
  City(id: 73, name: "Tekirdağ", slug: "tekirdag"),
  City(id: 74, name: "Tokat", slug: "tokat"),
  City(id: 75, name: "Trabzon", slug: "trabzon"),
  City(id: 76, name: "Tunceli", slug: "tunceli"),
  City(id: 77, name: "Uşak", slug: "usak"),
  City(id: 78, name: "Van", slug: "van"),
  City(id: 79, name: "Yalova", slug: "yalova"),
  City(id: 80, name: "Yozgat", slug: "yozgat"),
  City(id: 81, name: "Zonguldak", slug: "zonguldak")
];

final List<Format> formats = [
  Format(id: 28, name: "Atölye", slug: "atolye"),
  Format(id: 15, name: "Çalıştay", slug: "calistay"),
  Format(id: 24, name: "Diğer", slug: "diger"),
  Format(id: 5, name: "Eğitim", slug: "egitim"),
  Format(id: 21, name: "Festival", slug: "festival"),
  Format(id: 4, name: "Fuar", slug: "fuar"),
  Format(id: 10, name: "Gezi", slug: "gezi"),
  Format(id: 22, name: "İmza Günü", slug: "imza-gunu"),
  Format(id: 11, name: "Kamp", slug: "kamp"),
  Format(id: 2, name: "Konferans", slug: "konferans"),
  Format(id: 8, name: "Kongre", slug: "kongre"),
  Format(id: 19, name: "Konser", slug: "konser"),
  Format(id: 9, name: "Panel", slug: "panel"),
  Format(id: 7, name: "Sahne Sanatları", slug: "sahne-sanatlari"),
  Format(id: 3, name: "Seminer", slug: "seminer"),
  Format(id: 20, name: "Sempozyum", slug: "sempozyum"),
  Format(id: 1, name: "Sergi", slug: "sergi"),
  Format(id: 14, name: "Söyleşi", slug: "soylesi"),
  Format(id: 27, name: "Toplantı", slug: "toplanti"),
  Format(id: 13, name: "Webiner", slug: "webiner"),
  Format(id: 12, name: "Yarışma", slug: "yarisma"),
  Format(id: 16, name: "Zirve", slug: "zirve")
];

final List<Category> categories = [
  Category(id: 1423, name: "Alternatif Müzik", slug: "alternatif-muzik"),
  Category(id: 4015, name: "Aşçılık ve Mutfak", slug: "ascilik-ve-mutfak"),
  Category(id: 3797, name: "Bilim Teknoloji", slug: "bilim-teknoloji"),
  Category(id: 456, name: "Bilişim", slug: "bilisim"),
  Category(id: 291, name: "Caz Müzik", slug: "caz-muzik"),
  Category(id: 59, name: "Çocuk Gelişimi", slug: "cocuk-gelisimi"),
  Category(id: 88, name: "Çocuk Tiyatrosu", slug: "cocuk-tiyatrosu"),
  Category(
      id: 3974,
      name: "Dans ve Müzikal Gösteriler",
      slug: "dans-ve-muzikal-gosteriler"),
  Category(id: 3820, name: "Diğer", slug: "diger"),
  Category(id: 3805, name: "Dil ve Edebiyat", slug: "dil-ve-edebiyat"),
  Category(id: 3984, name: "Dünya Müzik", slug: "dunya-muzik"),
  Category(id: 3968, name: "Eğitim - Öğretim", slug: "egitim-ogretim"),
  Category(id: 3799, name: "Enerji ve Çevre", slug: "enerji-ve-cevre"),
  Category(id: 3798, name: "Finans-Ekonomi", slug: "finans-ekonomi"),
  Category(id: 171, name: "Fotoğrafçılık", slug: "fotografcilik"),
  Category(id: 3971, name: "Gayrimenkul & İnşaat", slug: "gayrimenkul-insaat"),
  Category(id: 182, name: "Gıda", slug: "gida"),
  Category(id: 54, name: "Girişimcilik", slug: "girisimcilik"),
  Category(id: 206, name: "Hayvancılık", slug: "hayvancilik"),
  Category(id: 3218, name: "Hobi & Yaşam Tarzı", slug: "hobi-yasam-tarzi"),
  Category(id: 56, name: "Hukuk", slug: "hukuk"),
  Category(id: 187, name: "İnsan Kaynakları", slug: "insan-kaynaklari"),
  Category(id: 354, name: "İş Dünyası", slug: "is-dunyasi"),
  Category(id: 509, name: "Kariyer", slug: "kariyer"),
  Category(id: 24, name: "Kişisel Gelişim", slug: "kisisel-gelisim"),
  Category(id: 170, name: "Klasik Müzik", slug: "klasik-muzik"),
  Category(id: 3970, name: "Kültür & Din", slug: "kultur-din"),
  Category(id: 3800, name: "Medya ve İletişim", slug: "medya-ve-iletisim"),
  Category(id: 5286, name: "Özgün Müzik", slug: "ozgun-muzik"),
  Category(id: 3975, name: "Parti & Canlı Müzik", slug: "parti-canli-muzik"),
  Category(id: 364, name: "Pazarlama", slug: "pazarlama"),
  Category(id: 63, name: "Pop Müzik", slug: "pop-muzik"),
  Category(id: 300, name: "Rock Müzik", slug: "rock-muzik"),
  Category(id: 3803, name: "Sağlık-Tıp", slug: "saglik-tip"),
  Category(id: 75, name: "Sanat", slug: "sanat"),
  Category(id: 3829, name: "Seyahat", slug: "seyahat"),
  Category(id: 3796, name: "Sinema-Film", slug: "sinema-film"),
  Category(id: 3801, name: "Siyaset-Politika", slug: "siyaset-politika"),
  Category(id: 2794, name: "Sosyal Bilimler", slug: "sosyal-bilimler"),
  Category(id: 5471, name: "Soul Müzik", slug: "soul-muzik"),
  Category(id: 1600, name: "Spor", slug: "spor"),
  Category(id: 466, name: "Tarih", slug: "tarih"),
  Category(id: 257, name: "Tarım", slug: "tarim"),
  Category(
      id: 3972,
      name: "Tedarik Zinciri ve Lojistik",
      slug: "tedarik-zinciri-ve-lojistik"),
  Category(id: 3969, name: "Tekstil & Moda", slug: "tekstil-moda"),
  Category(
      id: 3964, name: "Tiyatro ve Gösteriler", slug: "tiyatro-ve-gosteriler"),
  Category(id: 412, name: "Turizm", slug: "turizm"),
  Category(
      id: 3985,
      name: "Türk Sanat - Halk Müziği",
      slug: "turk-sanat-halk-muzigi"),
  Category(
      id: 3966, name: "Üretim ve Mühendislik", slug: "uretim-ve-muhendislik"),
  Category(id: 185, name: "Yabancı Dil", slug: "yabanci-dil"),
  Category(id: 3967, name: "Yönetim ve Liderlik", slug: "yonetim-ve-liderlik")
];
