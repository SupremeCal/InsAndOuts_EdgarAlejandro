//Player class 

class player {

  player(int x1, int y1) {
    x = x1;
    y = y1;
  }
  void display () {
    ellipse(x/2, y/2, 25, 25);
  }
}
