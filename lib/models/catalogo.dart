class Catalogo {
  final String goTo;
  final String status;
  final int brandId;
  final String brandCode;
  final String countryIso;
  final int campaignCode;
  final String coverImage;
  final dynamic featuredImage;
  final dynamic headingImage;
  final String id;

  Catalogo({
    required this.goTo,
    required this.status,
    required this.brandId,
    required this.brandCode,
    required this.countryIso,
    required this.campaignCode,
    required this.coverImage,
    this.featuredImage,
    this.headingImage,
    required this.id,
  });

  factory Catalogo.fromJson(Map<String, dynamic> json) {
    return Catalogo(
      goTo: json['go_to'],
      status: json['status'],
      brandId: json['brand_id'],
      brandCode: json['brand_code'],
      countryIso: json['country_iso'],
      campaignCode: json['campaign_code'],
      coverImage: json['cover_image'],
      featuredImage: json['featured_image'],
      headingImage: json['heading_image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'go_to': goTo,
      'status': status,
      'brand_id': brandId,
      'brand_code': brandCode,
      'country_iso': countryIso,
      'campaign_code': campaignCode,
      'cover_image': coverImage,
      'featured_image': featuredImage,
      'heading_image': headingImage,
      'id': id,
    };
  }
}
