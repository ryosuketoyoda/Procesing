boolean[][] now, next;
int a=100;
int[] x, y;
void setup() {
  x=new int[width];
  y=new int[height];
  size(500, 500);
  now = new boolean[width][height];
  next = new boolean[width][height];
  for (int i = 0; i < width; i+=width/a) {
    for (int j = 0; j < height; j+=height/a) {
      if (random(0, 1) < 0.5) {
        now[i][j] = true;
      }
    }
  }
}

void update() {
  for (int i = 0; i < width; i+=width/a) {
    for (int j = 0; j < height; j+=height/a) {
      boolean Up = now[i][(j - (height/a) + height) % height];
      boolean Under=now[i][(j+(height/a))%height];
      boolean Right=now[(i+(width/a))%width][j];
      boolean Left=now[(i-(width/a)+width)%width][j];
      boolean UpperRight = now[(i + (width/a)) % width][(j-(height/a)+ height) % height];
      boolean UpperLeft=now[(i-(width/a)+width)%width][(j - (height/a) + height) % height];
      boolean UnderRight=now[(i+(width/a))%width][(j+(height/a))%height];
      boolean UnderLeft=now[(i-(width/a)+width)%width][(j+(height/a))%height];
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
        next[i][j]=count==2||count==3;
      } else {
        next[i][j]=count==3;///nowDeath=count 3==nextLive
      }
    }
  }
}




void draw() {
  //rect((width/a)*int(random(10)),(height/a)*int(random(10)),(width/a),(height/a));
  frameRate(15);
  update();
  for (int i = 0; i < width; i+=width/a) {

    for (int j = 0; j < height; j+=height/a) {

      rect(i, j, (width/a), (height/a));
      now[i][j] = next[i][j];
      if (now[i][j]) {
        fill(0);
      } else {
        fill(255);
      }
    }
  }
}