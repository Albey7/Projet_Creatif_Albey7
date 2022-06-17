/*
Ce programme consiste d'un jeu où il y a un serpent formé de blocs et se déplace dans une fenêtre selon les instructions de l'utilisateur. 
À chaque fois que le serpent rentre en contacte avec de la nourriture (cercle) placé au hasard sur la quadrillé, le serpent augmentera sa taille avec une bloc. 
Et le plus de points accumulé de bonds de 5, le plus vite que le serpent devient.
Authors Eric Albert, James Malek
Date 17 juin 2022
*/


ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, blocks=20, direction=2, foodx=15, foody=15, speed = 8, fc1 = 255, fc2 = 255, fc3 = 255; 
int[]x_direction={0, 0, 1, -1}, y_direction={1, -1, 0, 0}; //direction pour la valeur de x et y
boolean gameover=false;// 

PFont font; //Créer une valeur dans processing pour une nouvelle police de caractère

void setup() {
    size(600, 600); //création de la fenêtre du jeux, d'une taille de 600 pixels par 600
    
    //position initiale du serpent
    x.add(0); 
    y.add(15);
    font = loadFont("BookmanOldStyle-BoldItalic-48.vlw"); // Différente police d'écriture
}
void draw() {
    background(235, 131, 52); //La couleur de l'arrière plan est orange selon le code html qui y est associé
    fill(255); //La couleur du serpent est blanc.
    for (int i = 0; i < x.size(); i++) rect(x.get(i) * blocks, y.get(i) * blocks, blocks, blocks); //Le code qui permet au serpent de devenir plus grand.
    if (!gameover) {
        fill(fc1, fc2, fc3); //La couleur de la nourriture.
        ellipse(foodx * blocks + 10, foody * blocks + 10, blocks, blocks); //Nourriture, ellipse s'agit d'une demande afin d'avoir la nourriture en cercle
        textAlign(RIGHT); //score
        textSize(25);
        fill(255);
        textFont(font);
        text("Score: " + x.size(), 10, 10, width - 20, 50);//montre le résultat lorsque le serpent est en jeu
        
       /*La variable système frameCount contient le nombre d'images affichées depuis le démarrage du programme. 
       Dans setup() la valeur est 0 et après la première itération de draw c'est 1, etc.*/
        if (frameCount % speed == 0) { 
          
           //ça rend le serpent plus grand.
            x.add(0, x.get(0) + x_direction[direction]);
            y.add(0, y.get(0) + y_direction[direction]);
            if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;// 
            for (int i = 1; i < x.size(); i++)
                if (x.get(0) == x.get(i) && y.get(0) == y.get(i)) gameover = true;
            if (x.get(0) == foodx && y.get(0) == foody) { //nouvelle nourriture sera généré si déjà touché
                if (x.size() % 5 == 0 && speed >= 2) speed -= 1; // every 5 points speed increase
                
                //Position de la nourriture.
                foodx = (int) random(0, w); 
                foody = (int) random(0, h); 
                
                //Par défault, nous avons le 255 afin d'accepter les différentes couleurs qui varient de 0 à 255 sur le tableau de pixel. 
                fc1 = (int) random(255);
                fc2 = (int) random(255);
                fc3 = (int) random(255); //nouvelle couleur de nourriture
            }else {
                x.remove(x.size() - 1);// ce code sert à garder la taille des serpents limités à une bloc par nourriture
                y.remove(y.size() - 1);
            }
        }
    } else {
        fill(3, 102, 252);
        textSize(30);//la grandeur de l'écriture
        textFont(font);//appel à la variable font que nous avons définis 
        textAlign(CENTER);
        text("JEU TERMINÉ \n Ton Score est: " + x.size() + "\n clique ENTER", width / 2, height / 3);//Montre le résultat du jeu joué
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
void mouseClicked() { // Lorsque le clavier est clické....
  paused = !paused;
  if (paused) {
    noLoop(); // Arrête la boucle draw()
  } else {
    loop(); // Redémarre la boucle draw()
  }
}
