// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..id = fields[0] as int
      ..firstName = fields[1] as String
      ..lastName = fields[2] as String
      ..email = fields[3] as String
      ..password = fields[4] as String
      ..active = fields[5] as bool
      ..country = fields[6] as String
      ..phone = fields[7] as String
      ..userType = fields[8] as int
      ..userTypeInfo = fields[9] as UserTypeInformation
      ..lastLogin = fields[10] as DateTime
      ..createdAt = fields[11] as DateTime
      ..updatedAt = fields[12] as DateTime;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.active)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.userType)
      ..writeByte(9)
      ..write(obj.userTypeInfo)
      ..writeByte(10)
      ..write(obj.lastLogin)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTypeInformationAdapter extends TypeAdapter<UserTypeInformation> {
  @override
  final int typeId = 1;

  @override
  UserTypeInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTypeInformation()
      ..id = fields[0] as int
      ..userType = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, UserTypeInformation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTypeInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
