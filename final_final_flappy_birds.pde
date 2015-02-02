PImage backImg = loadImage ("http://i.imgur.com/cXaR0vS.png");
PImage birdImg = loadImage ("http://wscont2.apps.microsoft.com/winstore/1x/5a1a8186-9626-494b-9187-6551fbd08853/Icon.318947.png");
PImage wallImg = loadImage ("http://i.imgur.com/4SUsUuc.png");
PImage startImg =loadImage ("http://i.imgur.com/U6KEwxe.png");
int gamestate = 1; // define el estado inicial del juego = pantalla de inicio
int score = 0;//crear el score
int highScore = 0;
int x = 0, y = 0, vy = 0; // valores iniciales de posicion
float [] wx = new float[2]; // posicion en x del tubo  float [] = arreglo. el arreglo es una variable que contiene varios valores
float [] wy = new float[2]; // posicion en y del tubo

void setup(){ // corre una sola vez
  size(600,800); // define tamaño del juego
  fill(0); // define el color del texto
  textSize(40); // define tamaño de los textos
  }
  void draw (){ //corre 60 veces por segundo
  if(gamestate == 0) { // el estado = inicia el juego
    imageMode (CORNER); // ubica el punto de origen a la esquina de la imagen
    image(backImg, x, 0); // posicion de la imagen de fondo
    
    
    x -=3; // velocidad del movimiento de la imagen de fondo
    vy += 1; // velocidad de caida del pájaro
    y += vy; // la posicion en y del pajaro caiga a la velocidad establecida de vy
    if(x == -1200) x = 0; // Si la imagen de fondo llega a su fin, se reinicia
   
    for(int i = 0; i < 2; i ++) { // genera una repeticion, la variable i inicia en 0 y no puede haber mas de 2 a la vez y el 1++ hace q se repita cada segundo
      imageMode(CENTER); // ubica el punto de origen en el medio de la imagen
      image(wallImg, wx[i], wy[i] - (wallImg.height/2+100)); // define la ubicacion en x e y iniciales del tubo superior
      image(wallImg, wx[i], wy[i] + (wallImg.height/2+100)); // define la ubicacion en x e y iniciales del tubo inferior
      if(wx[i] < 0) { // si el tubo sale de la pantalla regresa con valores aleatorios
        wy[i]= random(100, 500); // valor aleatoria de la posicion en y de los tubos
        wx[i] = width; // valor de la posicion en x igual al ancho de la pantalla = 600
         }
         if(wx[i] ==width/2){ // si la posicion del tubo es igual a la mitad de la pantalla, se suman los puntos
           score++; // aumenta el puntaje
           highScore = max(score,highScore); //valor del puntaje mas alto
          } 
          if( y > height || (abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) { // condicion si el pajaro cae o si se choca el juego vuelve al intro
           gamestate = 1;  // estado de inicio
           score = 0;
        }  
      wx[i] -= 3; // velocidad de los tubos
     }
     image(birdImg, width/2, y); // ubicacion del pájaro
     text("Score: "+score, 230, 700); // genera y ubica el texto
    }
    else { // si no se cumple la condicion
      imageMode(CENTER); // el centro de origen se ubica en el centro de la imagen
      image(startImg, width/2, height/2); // genera la imagen de introduccion y la ubica desde el centro
      text("High Score: "+highScore, 50, 600); // genera y ubica el texto en la pantalla
       }
  } 
void mousePressed(){ // al hacer click se definen los siguientes parametros
  
  vy -= 17; // al presionar el mouse la velocidad de caida del pajaro se vuelve negativa y el pajaro vuela
   y += vy; // iguala la posicion en y del parajro a la velocidad q ponemos en vy
  if(gamestate==1){ //este codigo solo sirve para definir los valores cada q se da click al inicio
    wx[0] = 600;
    wy[0] = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = 0;
    y = height / 2;
    gamestate = 0; // al dar click al inicio el juego cambia al estado 0 y empieza el juego
 }   
    }
