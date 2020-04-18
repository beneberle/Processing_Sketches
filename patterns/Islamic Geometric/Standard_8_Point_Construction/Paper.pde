class Paper {
  int noise;
  Paper(int noise_val) {
    noise = noise_val;
  }
  void draw() {
    noStroke();
    for (int i = 0; i < width - 1; i += 2) {
      for (int j = 0; j < height - 1; j += 2) {
        fill(random(85 - 10, 85 + 10), noise);
        rect(i, j, 2, 2);
      }
    }

    for (int i = 0; i < 30; i++) {
      fill(random(40, 60), random(noise * 2.5, noise * 3));
      rect(random(0, width - 2), random(0, height - 2), random(1, 3), random(1, 3));
    } 
  }
}
