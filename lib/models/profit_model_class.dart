class ProfitModelClass {
 dynamic total;
  dynamic raise;
dynamic invest;
 dynamic price;
  dynamic about;

  ProfitModelClass({
    this.total,
    this.raise,
    this.invest,
    this.price,
    this.about,
  });

  factory ProfitModelClass.fromJson(Map<String, dynamic> responseData) {
    return ProfitModelClass(
      total: responseData['total'],
      raise: responseData['raise'],
      invest: responseData['invest'],
      price: responseData['price'],
      about: responseData['about'],
    );
  }
}
