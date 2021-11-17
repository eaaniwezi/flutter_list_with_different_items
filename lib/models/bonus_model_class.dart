class BonusModelClass {
dynamic totalRUB;
dynamic totalUSD;
dynamic refillUSD;
dynamic refillRUB;
dynamic team;
dynamic about;

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
