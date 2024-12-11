import java.util.*;
Player[] players = new Player[2];
int startTime;
boolean gameOver = false;
String keys = "";
ArrayList<Integer> codes = new ArrayList<Integer>();
void setup() {
  size(640, 360);
  players[0] = new Player(50, height - 50, 50, 50, 255); // Player 1 - White square
  players[1] = new Player(300, height - 50, 50, 50, color(255, 0, 0)); // Player 2 - Red square
  startTime = millis();
}

void draw() {
  for (int i = 0; i < keys.length(); i++){
    if (keys.charAt(i) == 'w') {
    players[0].move(0, -10);
    }
    else if (keys.charAt(i) == 'a') {
      players[0].move(-10, 0);
    }
    else if (keys.charAt(i) == 's') {
      players[0].move(0, 10);
    }
    else if (keys.charAt(i) == 'd') {
      players[0].move(10, 0);
    }
  }
  for (int code: codes){
    if (code == UP) {
    players[1].move(0, -10);
    }
    else if (code == LEFT) {
      players[1].move(-10, 0);
    }
    else if (code == DOWN) {
      players[1].move(0, 10);
    }
    else if (code == RIGHT) {
      players[1].move(10, 0);
    }
  }
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

void keyPressed(){
  if (key == 'w' || key == 'a' || key == 'd' || key == 's'){
    String k = ""+key;
    if (!(keys.contains(k))){
      keys += key;
    }
  }
  else if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
    if (!(codes.contains(keyCode))){
      codes.add(keyCode);
    }
  }
}

void keyReleased(){
  String k = ""+key;
    if (keys.contains(k)){
      keys = keys.substring(0,keys.indexOf(k))+keys.substring(keys.indexOf(k)+1);
    }
    if (codes.contains(keyCode)){
      codes.remove((Integer)keyCode);
    }
}
