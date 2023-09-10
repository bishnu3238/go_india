
// ignore_for_file: constant_identifier_names

enum Lang{English, Hindi, Bengali , German, France}

 final List<Language> language = Lang.values.map((e) => Language(e.name)).toList();

class Language {
  final String lang;
  Language(this.lang);
}
