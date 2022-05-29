import 'package:hive/hive.dart';


part 'card_model.g.dart';


@HiveType(typeId: 0)
class CreditCardModel {
  @HiveField(0)
  String bgImage;
  @HiveField(1)
  String cardHolderName;
  @HiveField(2)
  String cardNumber;
  @HiveField(3)
  String expiryDate;
  @HiveField(4)
  String cvv;
  @HiveField(5)
  CreditCardModel({
    required this.bgImage,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
