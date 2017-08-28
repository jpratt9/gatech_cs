#include "uLCD_4DGL.h"
#include "bullet.h"
#include "game_synchronizer.h"
#include "globals.h"
#include "math.h"

extern Game_Synchronizer sync;
 
// Initialize the bullet. Don't have to do much here.
// Keep a pointer to this bullet's tank.
// Set the speed, and default the bullet to not in_flight.
Bullet::Bullet(Tank* t) {
    tank = t;
    speed = 25;
    in_flight = false;
}
 
// If in_flight, do nothing. Otherwise,
// set the in_flight flag, and initialize values needed for
// the trajectory calculations. (x0, y0), (vx0, vy0), time
// Hint: tank->barrel_end(...) is useful here.
void Bullet::shoot(void) {
    if (!in_flight) {
        in_flight = true;
        tank->barrel_end(&x0, &y0);
        vx0 = speed * cos(tank->barrel_theta);
        vy0 = speed * sin(tank->barrel_theta);
        time = 0;
    }
}
 
// If the bullet is in flight, calculate its new position
// after a time delta dt.
void Bullet::update_position(float dt) {
    if (in_flight) {
        //sync.pixel(100, 100, tank->tank_color);
        x = ceil(x0 + vx0 * time);
        y = ceil(y0 + vy0 * time - 4.9 * time * time);
        time = time + dt;
        x = x0; 
        y = y0;
        sync.pixel(x,y, tank->tank_color);
    }
}
 
int Bullet::time_step(float dt) {
    // If the bullet hasn't hit anything, 
    // redraw the bullet at its new location. 
    // If it has hit something (obstacle, tank, edge of the screen), 
    // set the in_flight flag back to false, explode the nearby area,
    // and return one of the following codes.
    //
    // return codes:
    //      BULLET_NO_COLLISION: no collision
    //      BULLET_OFF_SCREEN:   off the side of the screen
    //      Otherwise, return the color you've hit in 16bpp format.
    //if (in_flight) {
        int x_prev = x;
        int y_prev = y;
        update_position(dt);
        int pixel = sync.read_pixel(x, y);
        if ((x_prev == x && y_prev == y)) {
            return BULLET_NO_COLLISION;
        }
        
        if (x < 0 || x > 127 || y > 127 || y < 0) {
            in_flight = false;
            return BULLET_OFF_SCREEN;
        }
        
        /* (!sync.pixel_eq(pixel, SKY_COLOR)){
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            sync.filled_circle(x, y, 4, EXPL_COLOR);
            sync.filled_circle(x, y, 4, SKY_COLOR);
            in_flight = false;
            return pixel;
        }*/
        //sync.pixel(x_prev, y_prev, SKY_COLOR);
        sync.pixel(x, y, tank->tank_color);
    //}
    return BULLET_NO_COLLISION;
}