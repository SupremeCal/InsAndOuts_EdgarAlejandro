class Enemy {
  float x;
  float y; 
  float diameter;
  float xspeed;

  Enemy(float pHolder) {
    x = width;
    y = random(height);
    diameter = pHolder;
    xspeed = random(0.5, 2.5);
  }

  void move() {
    y = y + random(-2, 2);
    x = x - xspeed;
  }

  void display() {
    stroke(255);

    ellipse(x, y, diameter, diameter);
  }

  void left() {
    if (x<-diameter/2) {
      y= height+diameter/2;
    }
  }
}
