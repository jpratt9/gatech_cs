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
    if(in_flight) {
        int xprev = x;
        int yprev = y;
        update_position(dt);
        sync.pixel(x, y, tank->tank_color);
        int pixel = sync.read_pixel(x,y);
        if((xprev == x && yprev == y)) {// || sync.pixel_eq(pixel,0xFF1493)) {
            sync.pixel(x, y, tank->tank_color);
            return BULLET_NO_COLLISION;
        }
        if(x < 0 || x > 127 || y < 0 || y > 127){
            sync.pixel(xprev, yprev, SKY_COLOR);
            in_flight = false;
            return BULLET_OFF_SCREEN;   
        }
        
        if (sync.pixel_eq(pixel, GND_COLOR)) {
            pc.printf("Bounce!");
            //return BULLET_NO_COLLISION;    
        }
        
        if(!sync.pixel_eq(pixel, SKY_COLOR)){
            for (int i = 0; i < 20; i++) {
                //sync.filled_circle(x, y, 4, EXPL_COLOR);
                sync.filled_circle(x, y, 4, EXPL_COLOR);
                //sync.filled_circle(x, y, 4, SKY_COLOR);
                sync.filled_circle(x, y, 4, SKY_COLOR);
            }
            sync.pixel(xprev, yprev, SKY_COLOR);
            sync.pixel(xprev, yprev, SKY_COLOR);
            in_flight = false;
            return pixel; 
        }
        sync.pixel(xprev, yprev, SKY_COLOR);
        sync.pixel(x, y, TANK_RED);
    }
    return BULLET_NO_COLLISION;
}