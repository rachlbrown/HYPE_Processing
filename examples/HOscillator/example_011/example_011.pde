HCanvas canvas;
HColorPool colors;

void setup() {
  size(640, 640);
  H.init(this).background(#202020);
  
  colors = new HColorPool(
    #FFFFFF, #F7F7F7, #ECECEC, #333333,
    #0095A8, #00616F, #FF3300, #FF6600);
  
  canvas = H.add(new HCanvas()).autoClear(true);

  int starScale = 200;
  int starOffest = 20;
  for(int i = 0; i<9; ++i) {
    int ranEdges = round(random(5, 10));
    float ranDepth = random(0.2, 0.6);
    
    for (int j = 0; j<9; ++j) {
      int row = (int) Math.floor(i / 3);
      int col = i % 3;

      HPath poly = new HPath();
      poly.star(ranEdges, ranDepth)
        .size(starScale)
        .noStroke().fill( colors.getColor() )
        .anchorAt(H.CENTER)
        .loc(col*200+120, row*200+120);
      canvas.add(poly);

      new HOscillator()
        .target(poly)
        .property(H.ROTATION)
        .freq(8).speed(0.4)
        .range(-20, 20)
        .waveform(H.SINE)
        .currentStep( j );

      starScale -= starOffest;
    }
    starScale = 200;
  }
}

void draw() {
  H.drawStage();
}

