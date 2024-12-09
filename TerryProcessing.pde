Player[] players = new Player[2];
int startTime;
boolean gameOver = false;

void setup() {
  size(640, 360);
  players[0] = new Player(50, height - 50, 50, 50, 255); // Player 1 - White square
  players[1] = new Player(300, height - 50, 50, 50, color(255, 0, 0)); // Player 2 - Red square
  startTime = millis();
}

void draw() {
  if (gameOver) {
    return;
  }

  background(0);

  for (Player p : players) {
    p.display();
  }

  if (millis() - startTime > 30000 && !gameOver) {
    fill(255);
    textSize(32);
    text("Player 1 Wins!", width / 2 - 100, height / 2);
    gameOver = true;
  }

  if (players[0].collidesWith(players[1]) && !gameOver) {
    fill(255);
    textSize(32);
    text("Player 2 Wins!", width / 2 - 100, height / 2);
    gameOver = true;
  }
}

void keyPressed() {
  // Player 1 movement (WASD keys)
  if (key == 'w') {
    players[0].move(0, -10);
  }
  if (key == 'a') {
    players[0].move(-10, 0);
  }
  if (key == 's') {
    players[0].move(0, 10);
  }
  if (key == 'd') {
    players[0].move(10, 0);
  }

  // Player 2 movement (Arrow keys)
  if (keyCode == UP) {
    players[1].move(0, -10);
  }
  if (keyCode == LEFT) {
    players[1].move(-10, 0);
  }
  if (keyCode == DOWN) {
    players[1].move(0, 10);
  }
  if (keyCode == RIGHT) {
    players[1].move(10, 0);
  }
}

class Player {
  float xpos, ypos, w, h;
  color playerColor;

  Player(float x, float y, float w, float h, color c) {
    this.xpos = x;
    this.ypos = y;
    this.w = w;
    this.h = h;
    this.playerColor = c;
  }

  void display() {
    fill(playerColor);
    rect(xpos, ypos, w, h);
  }

  void move(float dx, float dy) {
    xpos += dx;
    ypos += dy;
    xpos = constrain(xpos, 0, width - w);
    ypos = constrain(ypos, 0, height - h);
  }

  boolean collidesWith(Player other) {
    return xpos < other.xpos + other.w &&
           xpos + w > other.xpos &&
           ypos < other.ypos + other.h &&
           ypos + h > other.ypos;
  }
}
