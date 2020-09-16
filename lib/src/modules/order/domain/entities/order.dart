import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  String orderId;
  String userId;
  String feeling;
  double hungrinessLevel;
  int mealBudget;
  String experienceType;

  Order({
    this.orderId,
    this.userId,
    this.feeling,
    this.hungrinessLevel,
    this.mealBudget,
    this.experienceType,
  });

  Order.empty() {
    orderId = '';
    userId = '';
    feeling = '';
    hungrinessLevel = 0;
    mealBudget = 0;
    experienceType = '';
  }

  factory Order.createNewOrder(
    String orderId,
    String userId,
    String feeling,
    double hungrinessLevel,
    int mealBudget,
    String experienceType,
  ) =>
      Order(
        orderId: orderId,
        userId: userId,
        feeling: feeling,
        hungrinessLevel: hungrinessLevel,
        mealBudget: mealBudget,
        experienceType: experienceType,
      );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    return '''
      orderId: $orderId,
      userId: $userId,
      feeling: $feeling,
      hungrinessLevel: $hungrinessLevel,
      mealBudget: $mealBudget,
      experienceType: $experienceType,
    ''';
  }
}
