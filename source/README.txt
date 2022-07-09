Minimal Steiner Tree

The main problem is formulated as follows. A finite set (k ≥ 2) of points is given on
the plane(in our case k =3). It is necessary to connect them with the shortest road
system. Steiner himself solved this problem for k = 3 and gave some examples for k
= 4.

The Algorithm
The algorithm I’ve implemented works the following way.
1)Draw a random triangle
2)Build a equilateral triangle on each edge of the triangle
3)Draw circumscribed circle for each of the equilateral triangles
4)The intersection of circles is the Torricelli point. (Case when there are no angles
<120)
5)Otherwise, the largest angle (>120 is the solution)