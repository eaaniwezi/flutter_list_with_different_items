class BonusModelClass {
  double? totalRUB;
  double? totalUSD;
  double? refillUSD;
  double? refillRUB;
  int? team;
  String? about;

  BonusModelClass({
    this.totalRUB,
    this.totalUSD,
    this.refillUSD,
    this.refillRUB,
    this.team,
    this.about,
  });

  factory BonusModelClass.fromJson(Map<String, dynamic> responseData) {
    return BonusModelClass(
      totalRUB: responseData['totalRUB'],
      totalUSD: responseData['totalUSD'],
      refillUSD: responseData['refillUSD'],
      refillRUB: responseData['refillRUB'],
      team: responseData['team'],
      about: responseData['about'],
    );
  }
}
