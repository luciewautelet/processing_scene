PImage img;
PImage img2;
PShape sphere;
PShape box1;
int movy = 250;
boolean desc = false;
PShape box2;
int cx = 150;
int cy = 150;
int quarter = 1;


void setup(){
  size(500, 500, P3D);
  background(0);
  noStroke();
  sphere= createShape(SPHERE, 50);
  box1 = createShape(BOX, 50);

  box2 = createShape(BOX, 50);

  img=loadImage("texture_sphere.jpeg");
  img2 = loadImage("texture_box.jpg");
  sphere.setTexture(img);
  box1.setTexture(img2);
  box2.setTexture(img2);
}

void draw(){
  background(0);
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  set_move();
  set_circle();
  ambientLight(100, 100, 100);
  directionalLight(102, 51, 126, -1, -1, 0);
  directionalLight(240, 28, 28, 0, 1, 0);
  pushMatrix();
  translate(cx, cy, 100);
  shape(sphere);
  popMatrix();
  pushMatrix();
  translate(50, movy, 0);
  shape(box1);
  popMatrix();
  pushMatrix();
  translate(450, movy, 0);
  shape(box2);
  popMatrix();
}

void set_circle()
{
   if (quarter == 1)
   {
     cy -= 1;
     cx += 1;
     if (cx > 250)
     {
       quarter = 2;
     }
   }
   else if(quarter == 2){
     cy += 1;
     cx += 1;
     if (cy > 250)
     {
       quarter = 3;
     }
   }
   else if(quarter == 3  )
   {
     cy += 1;
     cx -= 1;
     if (cx < 250)
     {
       quarter = 4;
     }
   }
   else if (quarter == 4)
   {
     cy -= 1;
     cx -= 1;
     if (cy < 250)
     {
       quarter = 1;
     }
   }
}

void set_move()
{
  if (desc == false)
  {
    movy -= 1;
    if (movy < 50)
    {
      desc =true;
    }
  }
  else
  {
    movy += 1;  
    if (movy > 450)
    {
      desc =false;
    }
  }
}