/**
  Source file to portyray Steiner minimal tree problem (3 points)
  @author Aleksei Khvorostov
 */

Point A;
Point B;
Point C;
Vector AB = new Vector();
Vector BC = new Vector();
Vector CA = new Vector();
float rad;
float x1,y1;
float x2,y2;
float x3,y3;
float cx,cy;
char keypressed = 'a';


int counterP = 0;      //Start/End point counter
PVector intersection;  //PVector to store intersection point
void setup()
{
  stroke(1);
  size(640, 640);            //line16: set the size of the background 640 by 480 pixels
  fill(color(255,0,0));      //line17: Set Ellipse color to red
  background(255);           //line18: Set background to white
  smooth();                  //line19: Draws all geometry with smooth (anti-aliased) edges.
  x1 = random(200,440); //POINT A (X1,Y1)
  x2 = random(200,440); //POINT B (X2,Y2)
    x3 = random(200,440); //POINT C (X3,Y3)
    y1 = random(200,440); 
    y2 = random(200,440);
    y3 = random(200,440);
    
}

void draw()
{
  background(255);
  textSize(40);
  
      fill(75, 37, 109); //A FILL 
      text("press Q", 40, 60); 
      circle(x1,y1,20);
      fill(63, 100, 126); //B FILL
      text("press W", 40, 100);
      circle(x2,y2,20);
      fill(149, 212, 122); //C FILL
      text("press E", 40, 140);
      circle(x3,y3,20);
      
      noFill();
      triangle(x1,y1 , x2, y2, x3, y3);
      

  if (mouseButton == LEFT)
  {
      
      
      
      
      switch(keypressed) {
        case 'a': 
          x1=mouseX;
          y1=mouseY;  // Does not execute
          break;
        case 'b': 
          x2=mouseX;
          y2=mouseY;  // Does not execute
          break;
          case 'c':
          x3=mouseX;
          y3=mouseY; 
      }
      
      

      A = new Point(x1,y1);
      B = new Point(x2,y2);
      C = new Point(x3,y3);
      
      
      Vector AB = Vec(A,B);
      Vector BC = Vec(B,C);
      Vector AC = Vec(A,C);
      Point ABnew = (angle(AC,AB) > 0) ? P(B,R(AB,2*PI/3.0)) : P(A,R(AB,5*PI/3.0)); //third vertex for equivalent triangle from AB edge
      Point ACnew = (angle(AC,AB) > 0) ? P(A,R(AC,5*PI/3.0)) : P(C,R(AC,2*PI/3.0)); //third vertex for equivalent triangle from AC edge
      Point BCnew = (angle(AB,AC) > 0) ? P(B,R(BC,5*PI/3.0)) : P(C,R(BC,2*PI/3.0)); //third vertex for equivalent triangle from BC edge
      
      
      fill(230,230,250);
      triangle(A.x, A.y, B.x, B.y, ABnew.x, ABnew.y);
      triangle(A.x, A.y, C.x, C.y, ACnew.x, ACnew.y);
      triangle(B.x, B.y, C.x, C.y, BCnew.x, BCnew.y);
      
      
      if (angle(AB,AC) > 2*PI/3 || angle(AB,AC) < -2*PI/3)  //angle between AB and AC is greater than 120 => Point A is the Steiner Point
    {
      
      line(ABnew.x, ABnew.y, A.x, A.y); line(ACnew.x, ACnew.y, A.x, A.y); line(BCnew.x, BCnew.y, A.x, A.y);
      
      noFill();
      cx = (ABnew.x+A.x+B.x)/3;
      cy = (ABnew.y+A.y+B.y)/3;
      rad = sqrt(sq(AB.x)+sq(AB.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (ACnew.x+A.x+C.x)/3;
      cy = (ACnew.y+A.y+C.y)/3;
      rad = sqrt(sq(AC.x)+sq(AC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (BCnew.x+B.x+C.x)/3;
      cy = (BCnew.y+B.y+C.y)/3;
      rad = sqrt(sq(BC.x)+sq(BC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      ellipse(ABnew.x, ABnew.y, 10, 10);     
      ellipse(ACnew.x, ACnew.y, 10, 10); 
      ellipse(BCnew.x, BCnew.y, 10, 10); 
      
      ellipse(B.x, B.y, 10, 10); 
      ellipse(C.x, C.y, 10, 10); 
      fill(255,0,0);
      ellipse(A.x, A.y, 10, 10); 
     
    }
  else if (angle(Vec(B,A),Vec(B,C)) > 2*PI/3 || angle(Vec(B,A),Vec(B,C)) < -2*PI/3)  //angle between BA and BC is greater than 120 => Point B is the Steiner Point
    {
      
      line(ABnew.x, ABnew.y, B.x, B.y); line(ACnew.x, ACnew.y, B.x, B.y); line(BCnew.x, BCnew.y, B.x, B.y);
      
      noFill();
      cx = (ABnew.x+A.x+B.x)/3;
      cy = (ABnew.y+A.y+B.y)/3;
      rad = sqrt(sq(AB.x)+sq(AB.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (ACnew.x+A.x+C.x)/3;
      cy = (ACnew.y+A.y+C.y)/3;
      rad = sqrt(sq(AC.x)+sq(AC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (BCnew.x+B.x+C.x)/3;
      cy = (BCnew.y+B.y+C.y)/3;
      rad = sqrt(sq(BC.x)+sq(BC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      ellipse(ABnew.x, ABnew.y, 10, 10);     
      ellipse(ACnew.x, ACnew.y, 10, 10); 
      ellipse(BCnew.x, BCnew.y, 10, 10); 
 
         
      ellipse(A.x, A.y, 10, 10);
      ellipse(C.x, C.y, 10, 10); 
      fill(255,0,0);
       ellipse(B.x, B.y, 10, 10);
     
    }
  else if (angle(Vec(C,A),Vec(C,B)) > 2*PI/3 || angle(Vec(C,A),Vec(C,B)) < -2*PI/3) //angle between AC and BC is greater than 120 => Point C is the Steiner Point
    {
      
      noFill();
      cx = (ABnew.x+A.x+B.x)/3;
      cy = (ABnew.y+A.y+B.y)/3;
      rad = sqrt(sq(AB.x)+sq(AB.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (ACnew.x+A.x+C.x)/3;
      cy = (ACnew.y+A.y+C.y)/3;
      rad = sqrt(sq(AC.x)+sq(AC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      cx = (BCnew.x+B.x+C.x)/3;
      cy = (BCnew.y+B.y+C.y)/3;
      rad = sqrt(sq(BC.x)+sq(BC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);
      
      ellipse(ABnew.x, ABnew.y, 10, 10);     
      ellipse(ACnew.x, ACnew.y, 10, 10); 
      ellipse(BCnew.x, BCnew.y, 10, 10); 
 
         
      ellipse(A.x, A.y, 10, 10);
      ellipse(B.x, B.y, 10, 10);
      fill(255,0,0);
      ellipse(C.x, C.y, 10, 10);
      
    }
  else 
    {
      line(ABnew.x, ABnew.y, C.x, C.y); line(ACnew.x, ACnew.y, B.x, B.y); line(BCnew.x, BCnew.y, A.x, A.y); //Draw lines from outer vertices to inner angles
      
      noFill();
      cx = (ABnew.x+A.x+B.x)/3;   
      cy = (ABnew.y+A.y+B.y)/3;
      rad = sqrt(sq(AB.x)+sq(AB.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);        //Circumscribed circle around triangle with an edge AB
      
      cx = (ACnew.x+A.x+C.x)/3;    
      cy = (ACnew.y+A.y+C.y)/3;
      rad = sqrt(sq(AC.x)+sq(AC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);      //Circumscribed circle around triangle with an edge AC
      
      cx = (BCnew.x+B.x+C.x)/3;
      cy = (BCnew.y+B.y+C.y)/3;
      rad = sqrt(sq(BC.x)+sq(BC.y))*sqrt(3)/3*2;
      circle(cx, cy, rad);    //Circumscribed circle around triangle with an edge BC
      
      ellipse(ABnew.x, ABnew.y, 10, 10);     
      ellipse(ACnew.x, ACnew.y, 10, 10); 
      ellipse(BCnew.x, BCnew.y, 10, 10); 
      
      ellipse(A.x, A.y, 10, 10);
      ellipse(B.x, B.y, 10, 10);
      ellipse(C.x, C.y, 10, 10);
    }
  }
}

void mouseClicked()
{
  
 if (counterP == 0) //first click
  {
    
    counterP++;
  }
  else{  //second click
      counterP=0;
      background(255);
  }
}

void keyTyped()
{
  if (key == 'q'){
    keypressed = 'a';
      println("Q selected");}
  else if (key == 'w'){
    keypressed = 'b';
      println("W selected");}
  else if (key == 'e'){
    keypressed = 'c';
      println("E selected");}
}
