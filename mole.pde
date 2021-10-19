class Mole {
  //VARIABLES
  float x;
  float y;
  float w;
  float h;
  float num=4;
  float spd=0.01;

//Randomizes the x and y position and causes mole to display
  void randomize() {
    x=random(width/16, width-(width/16));
    y=random(height/16, height-(height/16));
    appear = true;//then display will run
  }

  void display() {
    w=width/num;
    h=height/num;
    //head
    stroke(0);
    strokeWeight(1);
    fill(#89715B);
    ellipse(x, y, w/2, h/2);
    //eyes
    fill(0);
    ellipse(x-(w/15), y-(h/20), w/20, h/5);
    ellipse(x+(w/15), y-(h/20), w/20, h/5);
    stroke(255);
    strokeWeight(5);
    point(x-(w/15), y-(h/9));
    point(x+(w/15), y-(h/9));
    //nose
    stroke(0);
    strokeWeight(1);
    fill(255, 210, 210);
    ellipse(x, y+(h/10), w/4, h/10);
  }
  void hit() {
    if (mousePressed) {
      if (dist(mouseX, mouseY, x, y)<=w/2) {
        appear=false;
        num=4;
        randomize();
        score+=1;
      }
    }
  }
  void makeSmaller() {
    if (score<=1) {
      num+=spd;
    } else {
      num+=spd*(score/3);
    }
    if (w<=(width/12)) {
      num=4;
      randomize();
      score-=1;
    }
  }
  void score() {
    fill(255);
    rectMode(CENTER);
    rect(width/7, height/15, width/4, height/16);
    fill(0);
    textAlign(CENTER);
    textSize(width/20);
    text("SCORE: "+(int) score, width/8, height/12);
  }
}
