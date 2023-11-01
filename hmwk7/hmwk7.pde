import geomerative.*;

RFont f;
RShape grp;
RPoint[] points;

void setup() {
  size(800, 400);
  frameRate(30);

  background(0);
  fill(0, 0, 0);
  stroke(0);

  RG.init(this);
  grp = RG.getText("Cats are the best", "FreeSans.ttf", 90, CENTER);

  smooth();
}

void draw() {
  //background(0,0,0,90);

  translate(width/2, 3*height/5);


  noFill();
  stroke(0, 0, 200, 150);
  RG.setPolygonizer(RG.ADAPTATIVE);

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(35);
  drawCurve();
  for (int k=0; k<grp.countChildren(); k++) {
    grp.children[k].rotate(PI/200, grp.children[k].getCenter());
  }
}
  void drawCurve() {
    for (int i=0; i<grp.countChildren(); i++) {
      points = grp.children[i].getPoints();
      if (points != null) {
        //noFill();
        stroke(200, 20, 2000);
        fill(20, 200, 200);
        strokeWeight(2);
        beginShape();
        for (int j=0; j<points.length; j++) {
          curveVertex(points[j].x, points[j].y);
        }
        endShape();
      }
    }
  }
