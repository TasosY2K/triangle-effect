PVector start;
ArrayList<PVector> ps;

void setup() {
  size(600, 600);
  start = new PVector(width / 2, height / 2);
  ps = new ArrayList<PVector>();
  psadd(-10, -9);
  psadd(10, -9);
  psadd(0, 9);
  frameRate(10);
}

void draw() {
  background(251);
  translate(start.x, start.y);
  if (ps.size() >= 2) {
    for (int i = 0; i < ps.size() - 1; i++) {
      pline(ps.get(i), ps.get(i + 1));
    }
  }
  ps.add(calcNew());
}

PVector calcNew() {
  PVector x = ps.get(ps.size() - 3).copy();
  PVector diff = ps.get(ps.size() - 1).copy();
  PVector newTip = x.sub(diff.sub(x).mult(0.1));
  return newTip;
}

void pline(PVector p1, PVector p2) {
  line(p1.x, p1.y, p2.x, p2.y);
}

void psadd(float x, float y) {
  ps.add(new PVector(x, y));
}
