//Edgar Alejando "MidTermFinal" 
//you can move your cursor around to show effect 
// you can also click to change star colors
//Instructrions let you Enter to move on and use R to reset 
//Q,W,E show different images for each slide

//position
String state = "Opener"; 

//images
PImage Space1;
PImage Space2;
PImage Space3;

PImage Ocean1;
PImage Ocean2;
PImage Ocean3;

PImage Nature1;
PImage Nature2;
PImage Nature3;

//variables 
float q =0;
float v = 0; 

//Array Var
int [] z = new int[5];
int zpos = 0;
float r = 0;
float opacity = 0;
float fade = 1;

void setup() {
  //Setup
  size (1080, 720);
  frameRate(10);
  textSize(40);

  //array 
  z[0] = 0;
  z[1] = 27;
  z[2] = 91;
  z[3] = 183;
  z[4] = 255;

  //Images 
  Space1 = loadImage("Constellation.png");
  Space2 = loadImage("Saturn-rings.png");
  Space3 = loadImage("Spiral.png");

  Ocean1 = loadImage("octo.png");
  Ocean2 = loadImage("clown.png");
  Ocean3 = loadImage("dots.png");


  Nature1 = loadImage("leaf1.png");
  Nature2 = loadImage("pattern.png");
  Nature3 = loadImage("treering.png");
}
void draw() {
  if (state=="Opener") {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(32);
    text("Patterns all around us", width/2, height/2);
    textSize(16);
    text("Press Enter to start          Press R to restart", width/2, height/2 + 50);
  }
  //Space Section
  else if (state=="space") {

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

    //Nested Loop to make multiple stars spawn

    for (int y = 150; y< height; y+=300) {
      for (int x = 200; x< width; x+=300) {
        star(x, y);
        Text(x, y, "space");
      }
    }

    //catagory text
    textAlign(CENTER);
    textSize(32);
    text("Space", width/2, height/2 -325);

    textSize(32);
    fill(0);
    text("Press Q,W,E to see patterns in Nature", width/2, height/2 +325);

    //Button Section 
    /*

     for (int x = 200; x< width; x+=300) {
     Button(x, 650);
     }
     */

    //Mini star spawner
    for (int i = 0; i < 2000; i++) {
      float r = random(10);
      fill(v, z[zpos], v);
      stroke(v, z[zpos], v);
      circle(i, r*200, r);
    }
  } else if (state=="Ocean") {

    //Ocean Background 
    if (mouseY < height/4) {
      background(91, 192, 190);
    } else if (mouseY > height/1.5) {
      background(11, 19, 43);
    } else if (mouseY > height/4 && mouseY < height/2) {
      background(58, 80, 107);
    } else if (mouseY > height/2 && mouseY <height/1.5) {
      background( 28, 37, 65);
    }

    //Heart Pattern for water section
    for (int y = 120; y< height; y+=300) {
      for (int x = 200; x< width; x+=300) {
        Heart(x, y);
        Text(x, y, "Water");
      }
    }

    //catagory text
    textAlign(CENTER);
    textSize(32);
    text("Ocean", width/2, height/2 -325);

    textSize(32);
    fill(0);
    text("Press Q,W,E to see patterns in Ocean", width/2, height/2 +325);


    //Nature State
  } else if (state =="Nature") {
    //BackGround For nature
    if (mouseX < width/4) {
      background(107, 155, 143);
    } else if (mouseX > width/1.5) {
      background(220, 230, 211);
    } else if (mouseX > width/4 && mouseY < width/2) {
      background(200, 209, 146);
    } else if (mouseX > width/2 && mouseY <width/1.5) {
      background(1, 151, 133);
    }

    for (int y = 150; y< height; y+=300) {
      for (int x = 200; x< width; x+=300) {
        leaf(x+40, y+20);
        Text(x, y, "Nature");
      }
    }    

    //Nature Section
    textAlign(CENTER);
    textSize(32);
    text("Nature", width/2, height/2 -325);

    textSize(32);
    fill(0);
    text("Press Q,W,E to see patterns in Nature", width/2, height/2 +325);
  } else if (state =="End") {
    fill(255);
    background(0);
    textAlign(CENTER);
    text("The End", width/2, height/2);
  }
}
void mousePressed() {
  //mousepress code for color change
  if (zpos == z.length-1) { 
    zpos=0;
  } else {
    zpos++;
  }
}


void keyPressed() {
  //progression
  if (key == ENTER) {
    if (state== "Opener") {
      state="space";
    } else if (state=="space") {
      state= "Ocean";
    } else if (state =="Ocean") {
      state = "Nature";
    } else if (state =="Nature") {
      state = "End";
    }
  }
  //restart 
  if (key == 'r') {
    state = "Opener";
  }

  //Image section 
  if (state == "space") {
    if (key == 'q') { 
      background(0);
      image (Space1, width/3, height/3, height/2, width/4);
      fill(255);
      text("Constellations ", width/2, height/2+200);
    }
    if (key == 'w') {   
      background(0);
      image (Space2, width/4, height/4);
      fill(255);
      text("Rings ", width/2, height/2+200);
    }
    if (key == 'e') {   
      background(0);
      image (Space3, width/4, height/4);
      fill(255);
      text("Spiral ", width/2, height/2+200);
    }
  }
  if (state == "Ocean") {
    if (key == 'q') {   
      background(35, 60, 240);
      image (Ocean1, width/4, height/4, width/2, height/2);
      fill(255);
      text("Rings ", width/2, height/2+220);
    }
    if (key == 'w') {   
      background(35, 60, 240);
      image (Ocean2, width/4, height/4, width/2, height/2);
      fill(255);
      text("Strips ", width/2, height/2+220);
    }
    if (key == 'e') {   
      background(35, 60, 240);
      image (Ocean3, width/4, height/4, width/2, height/2);
      fill(255);
      text("Dots ", width/2, height/2+220);
    }
  }
  if (state == "Nature") {
    if (key == 'q') {  
      background(0);
      image (Nature1, width/4, height/4, width/2, height/2);
      fill(255);
      text("Leafs ", width/2, height/2+220);
    }
    if (key == 'w') {   
      background(0);
      image (Nature2, width/4, height/4, width/2, height/2);
      fill(255);
      text("Spots ", width/2, height/2+220);
    }
    if (key == 'e') {   
      background(0);
      image (Nature3, width/4, height/4, width/2, height/2);
      fill(255);
      text("Rings ", width/2, height/2+220);
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


void star(int x, int y) {
  fill (z[zpos], 133, 237);
  stroke (z[zpos], 133, 237);
  square(x, y, 100);
  triangle(x, y, x, y+50, x-100, y);
  triangle(x+100, y, x+100, y+50, x+200, y);
  triangle(x, y+50, x+50, y+100, x-50, y+150);
  triangle(x+100, y+50, x+50, y+100, x+150, y+150);
  triangle(x+10, y, x+90, y, x+50, y-100);
}
void leaf(int x, int y) {

  fill (50, z[zpos], 30);
  stroke (50, z[zpos], 30);
  ellipse(x, y, 60, 100);
  rect(x-10, y, 20, 80);
  triangle(x-28, y-20, x, y-70, x+28, y-20);
}

void Text(int x, int y, String word) {
  fill(opacity);
  textSize(32);
  text (word, x + 35, y + 180);  //displays text
  opacity= opacity+fade;
  if (opacity> 255 || opacity< 0) {
    fade= -fade;
  }
}
