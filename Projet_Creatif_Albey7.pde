/*
Ce programme consiste d'un jeu où il y a un serpent formé de blocs et se déplace dans une fenêtre selon les instructions de l'utilisateur. À chaque fois que le serpent rentre en contacte avec de la nourriture (cercle) placé au hasard sur la quadrillé, le serpent augmentera sa taille avec une bloc. Et le plus de points accumulé de bonds de 5, le plus vite que le serpent devient.
Authors Eric Albert, James Malek
Date 17 juin 2022
*/


ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, blocks=20, direction=2, foodx=15, foody=15, speed = 8, fc1 = 255, fc2 = 255, fc3 = 255; 
int[]x_direction={0, 0, 1, -1}, y_direction={1, -1, 0, 0}; //direction for x and y
boolean gameover=false;

PFont font; //Créer une valeur dans processing pour une nouvelle police de caractère

void setup() {
    size(600, 600);
    x.add(0); //snake start position
    y.add(15);
    font = loadFont("BookmanOldStyle-BoldItalic-48.vlw");
}
void draw() {
    background(235, 131, 52); //La couleur de l'arrière plan est orange selon le code html qui y est associé
    fill(0, 255, 0); //snake color green
    for (int i = 0; i < x.size(); i++) rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks); //snake
    if (!gameover) {
        fill(fc1, fc2, fc3); //food color red
        ellipse(foodx * blocks + 10, foody * blocks + 10, blocks, blocks); //food
        textAlign(LEFT); //score
        textSize(25);
        fill(255);
        textFont(font);
        text("Score: " + x.size(), 10, 10, width - 20, 50);
        if (frameCount % speed == 0) {
            x.add(0, x.get(0) + x_direction[direction]); //make snake longer
            y.add(0, y.get(0) + y_direction[direction]);
            if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;
            for (int i = 1; i < x.size(); i++)
                if (x.get(0) == x.get(i) && y.get(0) == y.get(i)) gameover = true;
            if (x.get(0) == foodx && y.get(0) == foody) { //new food if we touch
                if (x.size() % 5 == 0 && speed >= 2) speed -= 1; // every 5 points speed increase
                foodx = (int) random(0, w); //new food
                foody = (int) random(0, h);
                fc1 = (int) random(255);//Par défault, nous avons le 255 afin d'accepter les différentes couleurs qui varient de 0 à 255 sur le tableau de pixel. 
                fc2 = (int) random(255);
                fc3 = (int) random(255); //new food color
            } else {
                x.remove(x.size() - 1);
                y.remove(y.size() - 1);
            }
        }
    } else {
        fill(3, 102, 252);
        textSize(30);
        textFont(font);
        textAlign(CENTER);
        text("GAME OVER \n Your Score is: " + x.size() + "\n Press ENTER", width / 2, height / 3);
        if (keyCode == ENTER) {
            x.clear();
            y.clear();
            x.add(0);
            y.add(15);
            direction = 2;
            speed = 8;
            gameover = false;
        }
    }
}

void keyPressed() {
    int newdir = keyCode == DOWN ? 0 : (keyCode == UP ? 1 : (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)));
    if (newdir != -1) direction = newdir;
}
boolean paused = false;  
void mouseClicked() { // click event, outside draw()!
  paused = !paused;
  if (paused) {
    noLoop(); // stops the draw() loop
  } else {
    loop(); // restarts the draw() loop
  }
}
