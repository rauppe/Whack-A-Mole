//VARIABLES
boolean appear=false;
boolean start=false;
float score=0;

int rectX1;
int rectX2;
int rectY;
int rectW;
int rectH;

//making the moles here
Mole m1=new Mole();
Mole m2=new Mole();
Mole m3=new Mole();
Mole m4=new Mole();
Mole m5=new Mole();

void setup() {
  //randomize initial start position
  size(750, 750);
  m1.randomize();
  m2.randomize();
  m3.randomize();
  m4.randomize();
  m5.randomize();
  //set up for buttons
  rectX1=width/4;
  rectX2=width*3/4;
  rectY=height*4/5;
  rectW=width/4;
  rectH=height/10;
}

void draw() {
  if (!start) {
    background(200, 255, 210);
    //instructions
    fill(0);
    textAlign(CENTER);
    textSize(width/20);
    text("Welcome to Whack-A-Mole!\n \nClick on the shrinking moles before \nthey "+
      "disappear, or you will lose \npoints :(  The better you do, the \nfaster they will shrink. "+
      "Have fun!!", width/2, height/5);
    //buttons
    rectMode(CENTER);
    stroke(0);
    fill(255);
    strokeWeight(5);
    //quit game
    rect(rectX1, rectY, rectW, rectH);
    //play
    rect(rectX2, rectY, rectW, rectH);
    fill(0);
    textSize(width/25);
    text("Leave", rectX1, rectY);
    text("Whack Moles!", rectX2, rectY);
    //click on boxes
    if (mousePressed) {
      if (mouseY>rectY-(rectH/2) && mouseY<rectY+(rectH/2)) {
        //box exit
        if (mouseX>rectX1-(rectW/2) && mouseX<rectX1+(rectW/2)) {
          exit();
        }
        //box start
        if (mouseX>rectX2-(rectW/2) && mouseX<rectX2+(rectW/2)) {
          start=true;
        }
      }
    }
  }
  if (start) {
    background(100, 255, 150);
    //grass loop
    for (int iy=20; iy<height; iy+=20) {
      for (int ix=25; ix<width; ix+=50) {
        strokeWeight(3);
        stroke(0, 100, 10);
        line(ix, iy, ix+5, iy+10);
      }
      for(int ix2=0; ix2<height; ix2+=50){
        line(ix2, iy, ix2-5, iy+10);
      }
    }
    m1.hit();
    m2.hit();
    m3.hit();
    m4.hit();
    m5.hit();
    // everytime it displays it must reappear and get smaller again
    if (appear) {
      //mole 1
      m1.display();
      m1.makeSmaller();
      //mole 2
      m2.display();
      m2.makeSmaller();
      //mole 3
      m3.display();
      m3.makeSmaller();
      //mole 4
      m4.display();
      m4.makeSmaller();
      //mole 5
      m5.display();
      m5.makeSmaller();
    }
    //displays the score
    m1.score();
  }
}
