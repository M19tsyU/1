void setup(){
  size(1000,600);
  stroke(255);
  background(mouseX/5,mouseY/4,mouseY/3);
}

void draw(){
  ellipse(mouseX*2,mouseY*2,120,120);
  fill(mouseX,mouseY,255);
  ellipse(100+mouseX/15,mouseY/20,150,150);
  ellipse(300,250,250,250);
  fill(255);
  rect(100+mouseX/15+mouseY/20,120,250,150);
  ellipse(100,550,150,150);
  fill(mouseX-200,mouseY-200,255);
  rect(400,180,70+mouseX/2,300);
    line(800,500,mouseX,mouseY);
  line(800,500,mouseX+100,mouseY+100);
  line(800,500,mouseX-100,mouseY+100);
  if (mousePressed) {
    fill(255);
    background(mouseX/2,mouseY/2,mouseY/3);
  } else {
    fill(mouseX/2,mouseY/3,255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
