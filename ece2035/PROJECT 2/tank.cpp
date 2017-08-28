#include "tank.h"
#include "globals.h"
#include "math.h"
#include "game_synchronizer.h"

extern Game_Synchronizer sync;

// sx is the x-coord of the bottom left corner of the tank
// sy is the y-coord of the same corner
// width is the width of the tank
// height is the height of the tank
Tank::Tank(int sx, int sy, int width, int height, int color) {
    x = sx; y = sy;
    w = width; h = height;
    tank_color = color;
    if (tank_color == TANK_RED) {
        barrel_theta = PI / 4.0;
    } else {
        barrel_theta = 3 * PI / 4.0;
    }
    barrel_length = w;
    wheel_rad = 2.0;
    draw();
}

// Return the minimum x-coord of your tank's bounding box.
int Tank::min_x() {
    int res = barrel_x();
    if (res > x) {
        res = x;
    }
    return res;
}    

// Return the minimum y-coord of your tank's bounding box.
int Tank::min_y() {
    return y;
}

// Return the maximum x-coord of your tank's bounding box.
int Tank::max_x() { 
    int res = barrel_x();
    if (res < x + w) {
        res = x + w;
    }
    return res;
}

// Return the maximum y-coord of your tank's bounding box. 
int Tank::max_y() {
    return y + wheel_rad + h;
}

void Tank::barrel_end(int* bx, int* by) {
    // Set the x and y coords of the end of the barrel.
    *bx = barrel_x();
    *by = barrel_y();
}

void Tank::reposition(int dx, int dy, float dtheta) {
    // Blank out the old tank position, and
    //      Move the tank dx pixels in the x direction.
    //      Move the tank dy pixels in the y direction.
    //      Move the tank barrel by an angle dtheta. Don't allow it to go below parallel.
    
    // Step 1:
    // Try incrementing everything
    x += dx;             // add to a tmp x
    y += dy;                // add to y
    barrel_theta += dtheta;  // add to theta
    
    // Step 2
    // Do collision detection to prevent the tank from hitting things. 
    // (obstacles, side of the screen, other tanks, etc.)
    // WORKS AS EXPECTED
    bool problem_x;
    if (dx < 0) {
        int left_pix = sync.read_pixel(min_x(), max_y());
        problem_x = min_x() < 0 || !sync.pixel_eq(left_pix, SKY_COLOR);
    } else if (dx > 0) {
        int right_pix = sync.read_pixel(max_x(), max_y());
        problem_x = max_x() > 127 || !sync.pixel_eq(right_pix, SKY_COLOR);
    } else {
        problem_x = false;
    }
    
    if (problem_x) {
        x -= dx;
    }
    
    // Step 3:
    // if barrel "goes below tank" (theta < 0 or theta > pi)
    // then change theta back
    // TODO: prevent barrel from slicing through objects or going out of bounds
    int new_barrel_pix = sync.read_pixel(barrel_x(), barrel_y());
    bool problem_theta = barrel_theta < 0 || barrel_theta > PI
                            || !sync.pixel_eq(new_barrel_pix, SKY_COLOR)
                            || barrel_x() < 0 || barrel_x() > 127;
    
    if (problem_theta){
        barrel_theta -= dtheta;  
    }
    
    // Step 4:
    // if one of the parameters changed successfully, redraw the tank
    if (!problem_x || !problem_theta) {
        // draws over old barrel
        sync.line(x + w/2.0 - dx, y + h + wheel_rad - dy, x + w/2.0 + wheel_rad + barrel_length * cos(barrel_theta - dtheta) - dx, y + h + wheel_rad + barrel_length * sin(barrel_theta - dtheta) - dy, SKY_COLOR);
        // draws over old wheels and body
        sync.filled_rectangle(x - dx, y - dy, x + w - dx, y + h + wheel_rad - dy, SKY_COLOR);
        // draws new tank
        draw();
    }
}

// Example tank draw function. We expect you to get creative on this one!
void Tank::draw() {
    sync.filled_rectangle(x, y + wheel_rad, x + w, y + h + wheel_rad, tank_color);
    sync.line(x + w/2.0, y + h + wheel_rad, barrel_x(), barrel_y(), BLACK);
    sync.filled_circle(x + wheel_rad, y + wheel_rad, wheel_rad, BLACK);
    sync.filled_circle(x + w - wheel_rad, y + wheel_rad, wheel_rad, BLACK);
}

// Returns the x-coordinate of the end of the barrel
int Tank::barrel_x() {
    return x + w/2.0 + wheel_rad + barrel_length * cos(barrel_theta);
}

// Returns the y-coordinate of the end of the barrel
int Tank::barrel_y() {
    return y + h + wheel_rad + barrel_length * sin(barrel_theta);
}