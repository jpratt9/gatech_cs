// Student Side.

#include "mbed.h"

#include "SDFileSystem.h"
#include "wave_player.h"
#include "game_synchronizer.h"
#include "tank.h"
#include "bullet.h"
#include "globals.h"


DigitalOut led1(LED1);
DigitalOut led2(LED2);
DigitalOut led3(LED3);
DigitalOut led4(LED4);

DigitalIn pb_u(p21);                        // Up Button
DigitalIn pb_r(p22);                        // Right Button
DigitalIn pb_d(p23);                        // Down Button
DigitalIn pb_l(p24);                        // Left Button

Serial pc(USBTX, USBRX);                    // Serial connection to PC. Useful for debugging!
MMA8452 acc(p28, p27, 100000);              // Accelerometer (SDA, SCL, Baudrate)
uLCD_4DGL uLCD(p9,p10,p11);                 // LCD (tx, rx, reset)
SDFileSystem sd(p5, p6, p7, p8, "sd");      // SD  (mosi, miso, sck, cs)
AnalogOut DACout(p18);                      // speaker
wave_player player(&DACout);                // wav player
Game_Synchronizer sync(PLAYER1);            // Game_Synchronizer (PLAYER)
Timer frame_timer;                          // Timer

// Global variables go here.

int winner = -1;
int whose_turn = PLAYER1;


// Ask the user whether to run the game in Single- or Multi-Player mode.
// Note that this function uses uLCD instead of sync because it is only 
// writing to the local (Player1) lcd. Sync hasn't been initialized yet,
// so you can't use it anyway. For the same reason, you must access
// the buttons directly e.g. if( !pb_r ) { do something; }.

// return MULTI_PLAYER if the user selects multi-player.
// return SINGLE_PLAYER if the user selects single-player.
int game_menu(void) {
    
    uLCD.baudrate(BAUD_3000000);
    
    // title text (sorry, not enough room for ascii art)
    uLCD.locate(0,0);
    uLCD.puts("==================");
    uLCD.locate(0,1);
    uLCD.puts("||     Tank     ||");
    uLCD.locate(0,2);
    uLCD.puts("||     Duel     ||");
    uLCD.locate(0,3);
    uLCD.puts("==================");
    
    uLCD.locate(0,5);
    uLCD.puts(">Press the left");
    uLCD.locate(0,6);
    uLCD.puts(" button to start");
    uLCD.locate(0,7);
    uLCD.puts(" single player");
    
    
    uLCD.locate(0,9);
    uLCD.puts(">Press the right");
    uLCD.locate(0,10);
    uLCD.puts(" button to start");
    uLCD.locate(0,11);
    uLCD.puts(" multiplayer");
    
    // Button Example:
    // Use !pb_r to access the player1 right button value.
    
    while(true) {
        if (!pb_l) {
            return SINGLE_PLAYER;
        }
        if (!pb_r) {
            return MULTI_PLAYER;
        }       
    }      
}

// Initialize the world map. I've provided a basic map here,
// but as part of the assignment you must create more
// interesting map(s).
// Note that calls to sync.function() will run function()
// on both players' LCDs (assuming you are in multiplayer mode).
// In single player mode, only your lcd will be modified. (Makes sense, right?)
void map_init() {
    
    // Fill the entire screen with sky blue.
    sync.background_color(SKY_COLOR);
    
    // Call the clear screen function to force the LCD to redraw the screen
    // with the new background color.
    sync.cls();
    
    // Draw the ground in green.
    sync.filled_rectangle(0,0,128,20, GND_COLOR);
    
    // Draw some obstacles. They don't have to be black, 
    // but they shouldn't be the same color as the sky or your tanks.
    // Get creative here. You could use brown and grey to draw a mountain
    // or something cool like that.
    sync.filled_rectangle(59, 20, 69, 60, BLACK);
    
    // Before you write text on the screens, tell the LCD where to put it.
    sync.locate(0,15);
    
    // Set the text background color to match the sky. Just for looks.
    sync.textbackground_color(SKY_COLOR);
    
    // Display the game title.
    char title[] = "    TANK  DUEL";
    sync.puts(title, sizeof(title));
    
    // Flush the draw buffer and execute all the accumulated draw commands.
    sync.update();          
}

// Initialize the game hardware. 
// Call game_menu to find out which mode to play the game in (Single- or Multi-Player)
// Initialize the game synchronizer.
void game_init(void) {
    
    led1 = 0; led2 = 0; led3 = 0; led4 = 0;
    
    pb_u.mode(PullUp);
    pb_r.mode(PullUp); 
    pb_d.mode(PullUp);    
    pb_l.mode(PullUp);
    
    pc.printf("\033[2J\033[0;0H");              // Clear the terminal screen.
    pc.printf("I'm alive! Player 1\n");         // Let us know you made it this far.
    int mode = game_menu();
    sync.init(&uLCD, &acc, &pb_u, &pb_r, &pb_d, &pb_l, mode); // Connect to the other player.
    map_init();
    pc.printf("Initialized...\n");              // Let us know you finished initializing.
}

// Display some kind of game over screen which lets us know who won.
// Play a cool sound!
void game_over() {
    
}


int main (void) {
    
    int* p1_buttons;
    int* p2_buttons;
    
    float ax1, ay1, az1;
    float ax2, ay2, az2;
    
    game_init();
    
    // Create your tanks.
    Tank t1(4, 21, 12, 8, TANK_RED);            // (min_x, min_y, width, height, color)
    Tank t2(111, 21, 12, 8, TANK_BLUE);         // (min_x, min_y, width, height, color)
    
    // For each tank, create a bullet.
    Bullet b1(&t1);
    Bullet b2(&t2);
    
    frame_timer.start();
    
    // Your code starts here...
    while(true) {

        // Get a pointer to the buttons for both sides.
        // From now on, you can access the buttons for player x using
        //
        // px_buttons[U_BUTTON] 
        // px_buttons[R_BUTTON] 
        // px_buttons[D_BUTTON] 
        // px_buttons[L_BUTTON]
        
        p1_buttons = sync.get_p1_buttons();
        p2_buttons = sync.get_p2_buttons();
        
        led1 = p1_buttons[0] ^ p2_buttons[0];
        led2 = p1_buttons[1] ^ p2_buttons[1];
        led3 = p1_buttons[2] ^ p2_buttons[2];
        led4 = p1_buttons[3] ^ p2_buttons[3];

        // Get the accelerometer values.
        sync.get_p1_accel_data(&ax1, &ay1, &az1);
        sync.get_p2_accel_data(&ax2, &ay2, &az2);

        if (whose_turn == PLAYER1) {
                        
            // TANK MOVEMENT
            if(ax1 < -1 * ACC_THRESHOLD) { 
                // Move the tank to the right if the accelerometer is tipped far enough to the right.
                 t1.reposition(+1, 0, 0);
            } else if(ax1 > ACC_THRESHOLD) {
                // Move tank left if accelerometer is tipped far enough left.
                t1.reposition(-1,0,0);
            }
            
            // BARREL POSITIONING
            if(ay1 < -1 * ACC_THRESHOLD) { 
                // Move tank barrel up 5 degrees (PI/72 rads) if accelerometer is tipped far enough "upward."
                 t1.reposition(0, 0, PI / 24);          
            } else if(ay1 > ACC_THRESHOLD) {
                // Move tank barrel down 5 degrees (PI/72 rads) if accelerometer is tipped far enough "downward."
                t1.reposition(0, 0, PI / -24);
            }
            
             // Button example
            if(p1_buttons[D_BUTTON]) { 
                b1.shoot(); 
            }
            
            float dt = frame_timer.read();
            int intersection_code = b1.time_step(dt); 
            
            if(intersection_code != BULLET_NO_COLLISION || intersection_code == BULLET_OFF_SCREEN) { 
                pc.printf("Now it's P2's turn!\n");
                whose_turn = PLAYER2;
            }
            
            // If you shot yourself, you lost.
            if(sync.pixel_eq(intersection_code, t1.tank_color)) { 
                sync.update();  // Is this necessary?
                winner = PLAYER2;
                break;
            }
            
            // If you shot the other guy, you won!
            if(sync.pixel_eq(intersection_code, t2.tank_color)) { 
                sync.update();
                winner = PLAYER1;
                break;
            }
        } else if(whose_turn == PLAYER2) {
            
            // I gave you a lot of the logic for Player1. It's up to you to figure out Player2!
            // If you are in SINGLE_PLAYER mode, you should use the p1 inputs to control p2.
            // In MULTI_PLAYER mode, you should use the p2 inputs to control p2.
            //
            // Hint: 
            //         sync.play_mode will tell you if you are in MULTI_PLAYER or SINGLE_PLAYER mode.
            //
            
            // FIX AX/AY VALUES
            whose_turn = PLAYER1;

        }

        frame_timer.reset();
        sync.update();     
    } 
    
    game_over();
    
}