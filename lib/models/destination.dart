class Destination
{
  String city;
  String country;
  double temperature;
  double exchangeRate;
  String currency;
  bool favourite;
  String imageURL;
  bool bucketAdventure = false;
  bool bucketCalmAtmosphere = false;
  bool bucketCoastalLandscape = false;
  bool bucketEntertainment = false;
  bool bucketLandmark = false;
  bool bucketVibrantAtmosphere = false;
  bool bucketUrbanLandscape = false;
  bool bucketMountainousLandscape = false;
  bool bucketHistoricalArchitecture = false;
  String tag1;
  String tag2;
  String tag3;

  Destination({
    this.city,
    this.country,
    this.temperature,
    this.exchangeRate,
    this.currency,
    this.favourite,
    this.imageURL,
    this.bucketAdventure,
    this.bucketCalmAtmosphere,
    this.bucketCoastalLandscape,
    this.bucketEntertainment,
    this.bucketLandmark,
    this.bucketVibrantAtmosphere,
    this.bucketUrbanLandscape,
    this.bucketMountainousLandscape,
    this.bucketHistoricalArchitecture,
    this.tag1,
    this.tag2,
    this.tag3});
}