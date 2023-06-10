import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final int hexColor;

  const Category(this.id, this.name, this.hexColor);

  @override
  List<Object> get props => [id];
}
