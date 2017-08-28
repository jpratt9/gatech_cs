#ifndef TANK_H__
#define TANK_H__

// This class describes a tank. You may need to add
// additional member variables (and maybe even member functions)
// to draw your super cool new tank. 

class Tank {
    public:
    
        int x, y;               // Keep track of your tank's position.
        int w;                  // Tank width.
        int h;                  // Tank height. 
        int tank_color;         // Tank color. Duh :)
        float barrel_theta;     // Barrel angle. 
        int barrel_length;      // Length of the barrel.
        int wheel_rad;          // Radius of the wheels.
        
        
        // Construct a tank given its starting position (sx, sy),
        // its width and height, and its color.
        Tank(int sx, int sy, int width, int height, int color);
        
        // Calculate the bounding box of your tank for collision checking.
        int min_x();
        int min_y();
        int max_x();
        int max_y();
        
        // Calculate the position of the end of the barrel.
        void barrel_end(int* bx, int* by);
        
        // Reposition the tank!
        void reposition(int dx, int dy, float dtheta);
        
        // Draw the tank!
        void draw();
        
        // x- and y-coords of end of barrel (cleans up code quite a bit)
        int barrel_x();
        int barrel_y();
};

#endif