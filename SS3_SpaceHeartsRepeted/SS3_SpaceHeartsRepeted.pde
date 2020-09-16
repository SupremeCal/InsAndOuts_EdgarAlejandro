//Edgar Alejando "SS3_SpaceHearts Repeated" 
//you can move your cursor around to show effect 
// you can also click to change star colors 
float v = 0; 
float r = 0;

void setup() {
  size (1080  , 720);
  frameRate(10);
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

  // heart spawner
  //old code to spawn 3 hearts 
  /*
  if (mouseX < width/2) {
   fill (147, 133, 237);
   stroke (147, 133, 237);
   //shapes to make heart
   circle (100, 120, 110);
   circle (200, 120, 110);
   triangle (48, 140, 252, 140, 150, 275);
   } else if (mouseX > width/4 && mouseX < width/1.5) {
   fill (224, 137, 188);
   stroke (224, 137, 188);
   //shapes to make heart
   circle (400, 120, 110);
   circle (500, 120, 110);
   triangle (348, 140, 552, 140, 450, 275);
   }
   if (mouseX > width/1.5) {
   fill (147, 133, 237);
   stroke (147, 133, 237);
   //shapes to make heart
   circle (700, 120, 110);
   circle (800, 120, 110);
   triangle (648, 140, 852, 140, 750, 275);
   }
   */
  //Nested Loop to make multiple hearts spawn
  
  for (int y = 120; y< height; y+=300) {
    for (int x = 200; x< width; x+=300) {
        fill (v, 133, 237);
        stroke (v, 133, 237);
        //shapes to make heart
        circle (x, y, 110);
        circle (x+100, y, 110);
        triangle (x-52, y+20, x+152, y+20, x+50, y+155);
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
