import 'dart:io';

class Group{
final String id;
final String title;
final File? image;
final String body;
//final List<Users> mambers;
Group({required this.id, required this.title, this.image, required this.body});

}