import 'package:flutter/cupertino.dart';
import 'package:swipe_film/repo/films_list.dart';
import 'package:swipe_film/repo/models/FilmInfo.dart';

enum CardStatus {like, dislike}

class CardProvider extends ChangeNotifier {
  late int theme = 0;
  late int roomId = 0;

  List<FilmInfo> _films = [];

  bool _isDrag = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  List<FilmInfo> get films => _films;
  bool get isDragging => _isDrag;
  Offset get position => _position;
  double get angle => _angle;

  int i = -1;
  bool next = false;
  int count = 1;

  CardProvider() {
    Future.delayed(Duration.zero, (){
      test(roomId, theme);
    });
  }

  void setScreenSize(Size size) => _screenSize = size;

  void startPosition(DragStartDetails details) {
    _isDrag = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDrag = false;
    notifyListeners();

    final status = getStatus();

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      default:
        resetPosition();
    }
  }

  void resetPosition() {
    _isDrag = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    const delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async {
    if (_films.isEmpty) {
      return;
    }

    await Future.delayed(Duration(milliseconds: 200));
    _films.removeLast();
    i--;
    resetPosition();
  }

  Future<bool> test(int roomID, int theme) async {
    List<FilmInfo> tmp = await FilmsList().getFilmsList(roomID, theme);
    for (var ii in tmp) {
      _films.add(ii);
    }
    i = _films.length - 1;

    notifyListeners();

    return true;
  }

}