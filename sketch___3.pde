void setup( )
{
  size(460,600);
  background(255);
  float s = random(1,20);
  //color c = color(random(0, 255), random(255), random(255)); //<>//
//}
//void draw()
//{
  for (int l = 0;l<5;l++){
    int a =int(random(255));
    int b =int(random(255));
    for (int k = 0;k<10;k++){
      float i = random(0,20);
      float j = random(0,50);
      float i2= random(0,20);
      float j2= random(0,50);
      fill(a,a,b);
      stroke(0,0,0,0);
      //stroke(255);
      rect(22*i,13*j,20,20);
      rect(22*i2,13*j2,40,40);
    }
     //fill(s);
  }
}
