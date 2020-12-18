//Shield Class
class Shield {

  Shield(int x1, int y1) {
    x = x1;
    y = y1;
  }
  void display () {
    stroke(255);
    fill(0);
    ellipse(x/2, y/2, 50, 50);
  }
  

}
