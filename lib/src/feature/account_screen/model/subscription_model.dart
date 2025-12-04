class SubscriptionModel {
  final int subscriptionId;
  String subscriptionName;
  double subscriptionPrice;
  double? pricePerMonth;
  bool? isPopular;
  String subscriptionDuration;

  SubscriptionModel({
    required this.subscriptionId,
    required this.subscriptionName,
    required this.subscriptionPrice,
    this.pricePerMonth,
    required this.subscriptionDuration,
    required this.isPopular,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      subscriptionId: json['subscriptionId'],
      subscriptionName: json['subscriptionName'],
      subscriptionPrice: json['subscriptionPrice'].toDouble(),
      pricePerMonth: json['pricePerMonth']?.toDouble(),
      isPopular: json['isPopular']??false,
      subscriptionDuration: json['subscriptionDuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subscriptionId': subscriptionId,
      'subscriptionName': subscriptionName,
      'subscriptionPrice': subscriptionPrice,
      'pricePerMonth': pricePerMonth,
      'isPopular': isPopular,
      'subscriptionDuration': subscriptionDuration,
    };
  }
}
