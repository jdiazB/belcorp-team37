class Pais {
  final int id;
  final String countryCode;
  final String name;
  final String currencySymbol;
  final String languageCode;
  final String contact;
  final String closingTime;
  final String labelCode;
  final String phoneCode;

  Pais({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.currencySymbol,
    required this.languageCode,
    required this.contact,
    required this.closingTime,
    required this.labelCode,
    required this.phoneCode,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      id: json['id'],
      countryCode: json['country_code'],
      name: json['name'],
      currencySymbol: json['currency_symbol'],
      languageCode: json['language_code'],
      contact: json['contact'],
      closingTime: json['closing_time'],
      labelCode: json['label_code'],
      phoneCode: json['phone_code'],
    );
  }
}
