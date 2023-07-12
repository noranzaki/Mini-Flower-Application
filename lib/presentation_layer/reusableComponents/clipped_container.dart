import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final double _height;
  const HeaderWidget(this._height, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, 0),
            Offset(width / 10.5 * 5, _height - 40),
            Offset(width / 5 * 4, _height + 10),
            Offset(width, _height - 35)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.4),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                ],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, _height + 8),
            Offset(width / 10 * 7.9, _height - 53),
            Offset(width / 5 * 4.9, _height - 60),
            Offset(width, _height - 40)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.4),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                ],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 4.5, _height + 10),
            Offset(width / 2, _height - 30),
            Offset(width / 5 * 4, _height - 80),
            Offset(width, _height - 35)
          ]),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ],
            )),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  // ignore: prefer_final_fields
  late List<Offset> _offsets = [];

  ShapeClipper(this._offsets);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 5);
    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
