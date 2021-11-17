class GradeModelClass {
 dynamic total;
 dynamic raise;
 dynamic stock;
  dynamic balanceUSD;
 dynamic balanceRUB;
 dynamic about;

  GradeModelClass({
    this.total,
    this.raise,
    this.stock,
    this.balanceUSD,
    this.balanceRUB,
    this.about,
  });

  factory GradeModelClass.fromJson(Map<String, dynamic> responseData) {
    return GradeModelClass(
      total: responseData['total'],
      raise: responseData['raise'],
      stock: responseData['stock'],
      balanceUSD: responseData['balanceUSD'],
      balanceRUB: responseData['balanceRUB'],
      about: responseData['about'],
    );
  }
}
