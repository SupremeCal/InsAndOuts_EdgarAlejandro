//Edgar Alejando "SS5_HeartsArray" 
//you can move your cursor around to show effect 
// you can also click to change star colors

PImage dog;
float q =0;
float v = 0; 

int [] z = new int[5];
int zpos = 0;
float r = 0;
float opacity = 0;
float fade = 1;

void setup() {
  size (1080, 720);
  frameRate(10);
  textSize(40);

  z[0] = 0;
  z[1] = 27;
  z[2] = 91;
  z[3] = 183;
  z[4] = 255;

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
      Heart(x, y);
      Text(x, y, "love");
    }
  }


  //star spawner
  for (int i = 0; i < 2000; i++) {
    float r = random(10);
    fill(v, z[zpos], v);
    stroke(v,z[zpos], v);
    circle(i, r*200, r);
  }
}

void mousePressed() {
  //mousepress code
  if (zpos == z.length-1) { //if last array position
    zpos=0;  //return to first array position
  } else {
    zpos++;  //otherwise move forward a single position
  }
  
  for (int a = 10; a< height; a+=200) {
    for (int b = 10; b< width; b+=300) {
      if (mouseX < width/4 && mouseY < height/4 ) {
        image (dog, b, a);
      }
    }
  }
}

void Heart(int x, int y) {
  fill (z[zpos], 133, 237);
  stroke (z[zpos], 133, 237);
  //shapes to make heart
  circle (x, y, 110);
  circle (x+100, y, 110);
  triangle (x-52, y+20, x+152, y+20, x+50, y+155);
}

void Text(int x, int y, String word) {
  fill(opacity);
  text (word, x, y + 180);  //displays text
  opacity= opacity+fade;
  if (opacity> 255 || opacity< 0) {
    fade= -fade;
  }
}
