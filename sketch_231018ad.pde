PImage img;
int maxBri=240;

void setup() {
  size(800, 800);
  rectMode(CENTER);

  img=loadImage("a.jpg");
  img.resize(width, height);
}

void draw() {
  background(255);
  image(img,0, 0);
  drawWithStep(80);
  drawWithStep(40);
  drawWithStep(20);
  image(img, 800, 0);
}
void drawWithStep(int step) {
  for (int x=step/2; x<img.width+step/2; x+=step) {
    for (int y=step/2; y<img.height+step/2; y+=step) {
      color col=img.get(x, y);
      float bri=brightness(col);
      if (bri<maxBri/4) {
        noStroke();
        fill(col);
        rect(x, y, step, step);
      } else if (bri<maxBri) {
        float rad;
        if (bri<maxBri/8)
          noStroke();
        fill(col);
        rect(x, y, step/2, step/2);
        if (bri<maxBri/12) {
          noStroke();
          fill(col);
          rect(x, y, step/3, step/3);
          if (bri<maxBri/16) {
            noStroke();
            fill(col);
            rect(x+100, y, step/4, step/4);
          }
        }
      }
    }
  }
}
