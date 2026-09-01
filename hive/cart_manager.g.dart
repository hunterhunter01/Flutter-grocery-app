// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_manager.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartManagerAdapter extends TypeAdapter<CartManager> {
  @override
  final typeId = 0;

  @override
  CartManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartManager(
      name: fields[0] as String,
      image: fields[3] as String,
      price: fields[2] as double,
      qty: fields[1] as String,
      iqty: fields[4] == null ? 1 : (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CartManager obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.iqty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
