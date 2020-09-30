//Edgar Alejando "SS4_SpaceHeartText Repeated" 
//you can move your cursor around to show effect 
// you can also click to change star colors

PImage dog;
float q =0;
float v = 0; 
float r = 0;
float o = 0;
float f = 1;

void setup() {
  size (1080, 720);
  frameRate(10);
  textSize(40);

  dog = loadImage("dog.png");
}
void draw() {
  //background color changer 
  if (mouseX < width/4) {
    background(17, 17, 17);
  } else if (mouseX > width/1.5) {
    background(119, 119, 119);
  } else if (mouseX > width/4 && mouseX < width/2) {
    background(51, 51, 51);
  } else if (mouseX > width/2 && mouseX <width/1.5) {
    background(85, 85, 85);
  }

  //Nested Loop to make multiple hearts spawn

  for (int y = 120; y< height; y+=300) {
    for (int x = 200; x< width; x+=300) {
      fill (v, 133, 237);
      stroke (v, 133, 237);
      //shapes to make heart
      circle (x, y, 110);
      circle (x+100, y, 110);
      triangle (x-52, y+20, x+152, y+20, x+50, y+155);
      //looping text and making it fade in and out
      fill(o,v,0);
      text ("Heart", x, y + 180);  
      o= o+f;
      if (o> 255 || o< 0) {
        f= -f;
      }
    }
  }


  //star spawner
  for (int i = 0; i < 2000; i++) {
    float r = random(10);
    fill(v, v, v);
    stroke(v, v, v);
    circle(i, r*200, r);
  }
}

void mousePressed() {
  //mousepress code
  if (v == 0) {
    v = 255;
  } else {
    v = 0;
  }
}

void keyPressed() {

  //image loop
  if (key == CODED) {
    if (keyCode == UP) {
      for (int a = 10; a< height; a+=200) {
        for (int b = 10; b< width; b+=300) {
          if (mouseX < width/4 && mouseY < height/4 ) {
            tint(255);
            image (dog, b, a);
          } else {
            tint(0);
            image (dog, b, a);
          }
        }
      }
    }
  }
}
