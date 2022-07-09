/**
  Class representing a Point, Vector and operations on them
  
  @author Aleksei Khvorostov
 */

class Point 
  { 
  float x=0; 
  float y=0;
  Point () {}
  Point (float px, float py) {x = px; y = py;};

  } 
  
class Vector 
  { 
  float x=0; 
  float y=0;
  Vector (){};
  Vector (float px, float py) {x = px; y = py;};
  } 
 
Vector Vec(Point A, Point B) {return new Vector(B.x-A.x,B.y-A.y);}; //Vector from A to B

Vector Vec(float s,Vector V) {return Vec(s*V.x,s*V.y);}
Vector Vec(float x, float y) {return new Vector(x,y); };
Vector Vec(Vector U, Vector V) {return Vec(U.x+V.x,U.y+V.y);} 
Vector Vec(float a, Vector A, float b, Vector B) {return Vec(Vec(a,A),Vec(b,B));}

float angle (Vector U, Vector V) {return atan2(determinant(U,V),dot(U,V)); };     //angle between vectors
float dot(Vector U, Vector V) {return U.x*V.x+U.y*V.y; }                          // dot product
float determinant(Vector U, Vector V) {return dot(R(U),V); }  

Vector R(Vector V) {return new Vector(-V.y,V.x);};
Vector R(Vector V, float a) { return Vec(cos(a),V,sin(a),R(V)); }   

    
Point PSet(float x, float y) {return new Point(x,y); };
Point P(Point P, Vector V) {return PSet(P.x + V.x, P.y + V.y); }  //P transalted point

Point P(Point A, float a, Vector B) {return P(A,Vec(a,B)); }      //P transalted by sV)
Point P(Point A, float a, Vector B, float b, Vector Vec) {return P(P(A,a,B),b,Vec); }          
