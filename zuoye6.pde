PImage img; //<>//
Agent[]as;
int num=200;
boolean playing=true;
boolean savePDF;
import processing.pdf.*;

void setup() {
  size(800, 800);


  colorMode(HSB);
  as=new Agent[num];
  for (int i=0; i<num; i++) {
    as[i]=new Agent();
  }
  img=loadImage("1.jpg");
  img.filter(THRESHOLD, 0.3);
  img.resize(width, height);
  background(255);
}

void draw() {
  if(savePDF) {
    beginRecord(PDF, "frame-1000.pdf"); 
  }
  
  for (int i=0; i<num; i++) {
    as[i].update();
    as[i].display();
  }

   
   if(savePDF) {
    endRecord();
    savePDF = false; 
  }
}

// Use a keypress so thousands of files aren't created
void keyPressed() {
  if(key=='s'){
    saveFrame(""+frameCount+".png");
  }
}
void mousePressed() {
   savePDF= true;
}

class Agent {
  PVector center;
  PVector spd;
  PVector loc;
  PVector prev;
  float angle=random(TWO_PI);
  float angleSpd=random(0.01, 0.02);
  float rad=random(10, 100);
  color c=color(random(20), random(20, 40), random(180, 280));
  int energy;

  Agent() {
    center=new PVector(random(width), random(height));
    spd=PVector.random2D();
    spd.mult(random(0.2, 1));

    loc=new PVector();
    loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);
    prev=loc.copy();
  }
  void update() {
    center.add(spd);

    angle+=angleSpd;
    loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);
    if (loc.x<0||loc.x>width||loc.y<0||loc.y>height) {
      center.set(random(width), random(height));
      loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);
      prev=loc.copy();
      energy=0;
    }
  }
  void display() {
    if (brightness(img.get(int(loc.x), int(loc.y)))==255) {
      energy-=3;
      energy=max(energy, 0);
    } else {
      energy++;
    }
    if (energy>0) {
      strokeWeight(3);
      stroke(c, 100);
      line(prev.x, prev.y, loc.x, loc.y);
    }
    prev=loc.copy();
  }
}
