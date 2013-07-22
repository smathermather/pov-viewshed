#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

 // 10 light positions with follow a road in the southeast corner
#include "light_posits.inc"

// The standard Linden from povtree
// http://www.propro.ru/go/Wshop/povtree/povtree.html
#include "Linden.inc"

// Randomly generated tree locations averaging 30 feet apart
// A subset of 28,000 using the canopy boundary derived from LiDAR
#include "tree_coords5.inc"   

/* 
Orthographic Camera-- Allows us to avoid geographic distortion
Which means I can just add a world file to my output, e.g. if I render
this at 5000 x 5000 pixels, I have a 1 foot pixel and I can put the following
in a txt file *.pgw, for a png output, or *.tfw for a tiff output):

1
0
0
-1
2224868
630008

*/

camera { 
   orthographic
   // what's the +130 for below?  I don't know.  Probably
   // an error in my tree locations.  This is the quick fix.
   location <2227368+130, 6000, 627508>  
   look_at <2227368+130, 0, 627508>
   right 5000*x            // horizontal size of view
   up 5000*y               // vertical size of view
}

height_field {
   png "n2225625i1.png" 
   water_level 0.0    
  texture {
	pigment {
		rgb <1, 1, 1>
	}
  }      
   scale <5000, 65536, 5000> // Scale to real world size
   translate <2224868+130,0,625008> // Move to state plane coordinates
}

// Loop though our light positions
#declare LastIndex = dimension_size(lightPosits, 1)-1;

#declare Index = 0;
#while(Index <= LastIndex)
       
        light_source {
                0*x
                color rgb <0,2,2> 
                translate lightPosits[Index]
        }

       #declare Index = Index + 1;
#end

// Let's make some pseudo-random numbers for tree-size and rotation 
#declare Rnd_1 = seed (1153);

// Loop through our tree positions
#declare LastIndex = dimension_size(treePosits, 1)-1;

#declare Index = 0;
#while(Index <= LastIndex)
                  
	object {
		TREE
		scale 80+rand(Rnd_1)*20 // trees 80 to 100 feet tall
		rotate <0,rand(Rnd_1)*360,0>
		translate treePosits[Index]
	}
                    
#declare Index = Index + 1;
#end



