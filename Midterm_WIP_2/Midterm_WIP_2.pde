//Edgar Alejando "MidTerm2_Pattern" 
//you can move your cursor around to show effect 
// you can also click to change star colors

String state = "Opener"; 

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
}
void draw() {
  if (state=="Opener") {
    background(0);
    textAlign(CENTER);
    textSize(32);
    text("Press Enter To Start", width/2, height/2);
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

    for (int y = 120; y< height; y+=300) {
      for (int x = 200; x< width; x+=300) {
        star(x, y);
        Text(x, y, "space");
      }
    }

    //Button Section 

    for (int x = 120; x< width; x+=300) {
      Button(x, 600);
    }


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

    for (int y = 120; y< height; y+=300) {
      for (int x = 200; x< width; x+=300) {
        Heart(x, y);
        Text(x, y, "Water");
      }
    }
  } else if (state =="Nature") {
        if (mouseX < width/4) {
      background(107, 155, 143);
    } else if (mouseX > width/1.5) {
      background(220, 230, 211);
    } else if (mouseX > width/4 && mouseY < width/2) {
      background(200, 209, 146);
    } else if (mouseX > width/2 && mouseY <width/1.5) {
      background(1, 151, 133);
    }
    textAlign(CENTER);
    text("y", width/2, height/2);
  } else if (state =="End") {
    background(0);
    textAlign(CENTER);
    text("The End", width/2, height/2);
  }
}
void mousePressed() {
  //mousepress code
  if (zpos == z.length-1) { //if last array position
    zpos=0;  //return to first array position
  } else {
    zpos++;  //otherwise move forward a single position
  }
}
void keyPressed() {
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

  if (key == 'r') {
    state = "Opener";
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
  /*
 original
   square(100, 100, 100);
   triangle(100, 100, 100, 150, 0, 100);
   triangle(200, 100, 200, 150, 300, 100);
   triangle(100,150,150,200,50,250);
   triangle(200,150,150,200,250,250);
   triangle(110,100,190,100,150,0);
   */
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
void Button(int x, int y) {
  fill (15, 15, 15);
  stroke (15, 15, 15);
  square(x, y, 40);
  fill (240, 240, 240);
  stroke (240, 240, 240);
  square(x+10, y+10, 40);
  textSize(10);
  fill (15, 15, 15);
  text("button", x+30, y+30);
}
