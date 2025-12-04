import '../model/subscription_model.dart';

List<SubscriptionModel> getDummySubscriptions() {
  return [
    SubscriptionModel(
      subscriptionId: 1,
      subscriptionName: "Monthly",
      subscriptionPrice: 2.99,
      pricePerMonth: 2.99,
      subscriptionDuration: "month",
      isPopular: true,
    ),
    SubscriptionModel(
      subscriptionId: 2,
      subscriptionName: "Monthly",
      subscriptionPrice: 24.99,
      pricePerMonth: 2.99,
      subscriptionDuration: "year",
      isPopular: false,
    ),
  ];
}
