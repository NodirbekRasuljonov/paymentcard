// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardModelAdapter extends TypeAdapter<CreditCardModel> {
  @override
  final int typeId = 0;

  @override
  CreditCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardModel(
      bgImage: fields[0] as String,
      cardHolderName: fields[1] as String,
      cardNumber: fields[2] as String,
      expiryDate: fields[3] as String,
      cvv: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bgImage)
      ..writeByte(1)
      ..write(obj.cardHolderName)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.expiryDate)
      ..writeByte(4)
      ..write(obj.cvv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
