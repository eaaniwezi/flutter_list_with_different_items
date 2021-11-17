class RefillModelClass {
  dynamic total;
  dynamic withdrawn;
  dynamic refillUSD;
  dynamic refillRUB;
  dynamic about;

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
