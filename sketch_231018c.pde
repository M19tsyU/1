PImage img;
int xstep=10;
int ystep=10;
int maxSize=20;
float maxBri=255;


void setup() {
  size(1000, 1000);
  frameRate(60);
  noStroke();
  textAlign(CENTER, CENTER);
  img=loadImage("a.jpg");
  img.resize(width, height);
}
void draw() {
  background(255);
  xstep=int(map(mouseX,0,img.width,2,15));
  ystep=int(map(mouseY,0,img.height,2,15));
  for(int i=0;i<img.width;i+=xstep){
    for(int j=0;j<img.height;j+=ystep){
      color col=img.get(i,j);
      float bri=brightness(col);
      if(bri<maxBri){
        float size=map(bri,0,maxBri,maxSize,0);
        fill(col);
        circle(i,j,size);
      }
    }
  }
}
