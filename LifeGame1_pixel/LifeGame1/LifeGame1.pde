boolean[][] now, next;
void setup() {
  size(500, 500);
  now = new boolean[width][height];
  next = new boolean[width][height];
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      //if (random(0,1) < 0.5) {
      //  now[i][j] = true;
      //}
      now[i][j]=random(0,1)<0.5;
    }
  }
}

void update() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      boolean Up = now[i][(j - 1 + height) % height];
      boolean Under=now[i][(j+1)%height];
      boolean Right=now[(i+1)%width][j];
      boolean Left=now[(i-1+width)%width][j];
      boolean UpperRight = now[(i + 1) % width][(j - 1 + height) % height];
      boolean UpperLeft=now[(i-1+width)%width][(j - 1 + height) % height];
      boolean UnderRight=now[(i+1)%width][(j+1)%height];
      boolean UnderLeft=now[(i-1+width)%width][(j+1)%height];
      int count = 0;

      if (Up)count++;
      if (Under)count++;
      if (Right)count++;
      if (Left)count++;
      if (UpperRight)count++;
      if (UpperLeft)count++;
      if (UnderRight)count++;
      if (UnderLeft)count++;

      if (now[i][j]) {
        if((count==2)||(count==3)){
        next[i][j]=true;//nowLive=count 2or3==nextLive
        }else{
         next[i][j]=false; //nowLive!=count 2or3==nextDeath
        }
      } else {
        next[i][j]=count==3;///nowDeath=count 3==nextLive
      }
    }
  }
}

void draw() {
  loadPixels();
  update();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      color c;
      now[i][j] = next[i][j];
      if (now[i][j]) {
        c = color(0);
      } else {
        c = color(255);
      }
      pixels[j*width + i] = c;
    }
  }
  updatePixels();
}