class RefillModelClass {
  double? total;
  double? withdrawn;
  double? refillUSD;
  double? refillRUB;
  String? about;

  RefillModelClass({
    this.total,
    this.withdrawn,
    this.refillUSD,
    this.refillRUB,
    this.about,
  });

  factory RefillModelClass.fromJson(Map<String, dynamic> responseData) {
    return RefillModelClass(
      total: responseData['total'],
      withdrawn: responseData['withdrawn'],
      refillUSD: responseData['refillUSD'],
      refillRUB: responseData['refillRUB'],
      about: responseData['about'],
    );
  }
}
