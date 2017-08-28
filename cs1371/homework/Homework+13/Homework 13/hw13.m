%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <John Pratt>
% GT Email     : <jpratt9@gatech.edu>
% Homework     : hw13
% Course       : CS1371
% TA's Name    : <Edward Foyle, Nick Fahrenkrog>
% Section      : <B05>
% Collaboration: <"I worked on the homework assignment alone, using
%                  only course materials.">
%
% Files provided with this homework:  
%   ABCs_hw13_pretest.p
%   ABCs_images.m
%   Raphael - Madonna del Prato.png
%   Raphael - Madonna del Prato_dragonrended_soln.png
%   Unknown - Object on the Grass.png
%   Unknown - Object on the Grass_dragonrended_soln.png
%   abcs_pretest1.png
%   abe.jpg
%   abe_soln.txt
%   apples.png
%   buzz.jpg
%   buzz_soln.txt
%   checkImage_soln.p
%   dragonrend_soln.p
%   flower1.png
%   flower2.png
%   greenScreen_soln.p
%   hw13.m
%   image2ascii_soln.p
%   instructions1.txt
%   instructions2.txt
%   instructions3.txt
%   kaleidoscope_soln.p
%   kaleidoscope_test1.png
%   kaleidoscope_test1_soln.png
%   kaleidoscope_test2.png
%   kaleidoscope_test2_soln.png
%   kaleidoscope_test3.png
%   kaleidoscope_test3_soln.png
%   oranges.png
%   oranges_vs_tangerines_soln.png
%   pokemon1.png
%   pokemon1_new.png
%   pokemon1_new_soln.png
%   pokemon1_view.png
%   pokemon2.png
%   pokemon2_new_soln.png
%   pokemon2_view.png
%   pokemon3.png
%   pokemon3_new_soln.png
%   pokemon3_view.png
%   tangerines.png
%   wreck.jpg
%   wreck_soln.txt
%
% Files to submit:
%   hw13.m
%	ABCs_images.m
%	checkImage.m
%	dragonrend.m
%	greenScreen.m
%	image2ascii.m
%	kaleidoscope.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework is an m-file called "ABCs_strings". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_images.m
% ABCs File Testing:
%  >> ABCs_hw13_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Images
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will recieve
% an automatic zero for the problem.
%
% All drill problems must be functions (i.e. contain valid function
% headers).  Any scripts turned in will be given a 0 automatically.
%
%
% NOTE: The *_soln.p files included in this homework have had the names of
% their output files editted so they will not overwrite any of the output
% files that you create. Please follow the naming convention for output
% files specified for each problem, and do not name your files according to
% the *_soln.p files.
%
%==========================================================================
% PROBLEM 1.  Look At Me Now
%--------------------------------------------------------------------------
%
% Function Name: checkImage
%
% Inputs  (2): - (char) the name of an image file: Image 1
%              - (char) the name of a second image file: Image 2
%
% Outputs (1): - (char) A sentence comparing the two images
%
% Output Files (1): - (.png) An image highlighting the differences between
%                            the two input images. Not outputted if no
%                            differences exist or image sizes are
%                            different.
%
% Function Description:
%  Given two images, write a function called "checkImage" that determines 
%  if the two images are the same, and if they are different, then how. 
%
%  - If the two images are completely identical, the output should read
%    'The images are the same.' and no output image should be created.
%  - If the two images do not have the same dimensions, the output should
%    read 'The images have different dimensions.' and no output image
%    should be created.
%  - If the two images have the same dimensions, but are not the same
%    image, then there are two things you will need to do:
%    (1) Create an output image that highlights the differences between the
%    two images. This image should be exclusively black and white, where it
%    is white everywhere that the two images have the same RGB values, but
%    black wherever the RGB values of the images differ. This image should
%    be named by the following naming convention:
%    '<imageName1>_vs_<imageName2>.png.'
%    (2) Output the string 'The RBG values are different: see %s.',
%    where you should print the name of your output file into the '%s'.
%
% Notes:
%  - You should only output an image if the files are the same size but
%    differing images.
%
% Hints:
%  - It is not necessary to use iteration for pixel-by-pixel comparisons.
%    This will make your code run very slowly and is inefficient. Taking
%    the extra time to figure out how to use logical masking instead will
%    make your code much simpler to write, run more quickly, and just be
%    better in all ways.
%  - This function should be useful for the rest of your homework.
%
% Test cases:
%
%   out1 = checkImage('apples.png', 'oranges.png');
%       out1 => 'The images have different dimensions.'
%          - No output file created.
%
%   out2 = checkImage('flower1.png', 'flower2.png');
%       out2 => 'The images are the same.'
%          - No output file created.
%
%   out3 = checkImage('oranges.png', 'tangerines.png');
%       out2 => 'The RGB values are different: see oranges_vs_tangerines.png.'
%          - oranges_vs_tangerines.png should look like
%            oranges_vs_tangerines_soln.png
%
%
%==========================================================================
% Problem 2.  JOOR ZAH FRUL
%==========================================================================
%
% Function Name: dragonrend
%
% Inputs (1):  - (char) A string that is the filename of the input image.
%
% Outputs (0)
%
% Output files (1): - (.png) The "dragonrended" image.
%
% Function Description:
%   The dragons from Tamriel have found a way to cross the barrier between
%   fiction and reality, and have fled to Earth to avoid the Dragonborn.
%   Until the Dovahkiin too can pass through the barrier between fiction
%   and reality, we'll have to battle the dragons with technology to
%   simulate shouts. Luckily, dragons are suceptible to the dragonrend
%   shout when it's coded into a *.m file:
%
%   Write a function called dragonrend that will take in an image of an
%   earthly scene with a dragon flying overhead, and "pull the dragon to
%   the ground" by removing it from the image. The images have already been
%   edited to help isolate the dragon, and all you need to do is: (1) find
%   the dragon in the image. It will always have the constant RGB value of
%   [200 200 200], and is the only place in the image with this RGB value.
%   (2) Find the RBG value for the shade of blue that the sky has in the
%   image. This shade of blue will always be present in second pixel from
%   the left and second pixel from the top. I.e. it will be index (2,2,:)
%   of the input image. (3) Replace the dragon with the same shade of blue
%   as the sky. Simply replace all pixels of the dragon with the shade of
%   blue that was present in the top left corner of the image.
%
%   You should output a new image file of the editted image, and the naming
%   convention for this file should be:
%   '<name of input file>_dragonrended.png'
% 
% Hints:
%   - It may be helpful to take a look a the solution images first to get an
%     idea of what it should look like beforehand.
%   - Masking may be useful.
%
% Test cases:
%
%    dragonrend('Unknown - Object on the Grass.png')
%       => output image should match 
%           'Unknown - Object on the Grass_dragonrended_soln.png'
%
%    dragonrend('Raphael - Madonna del Prato.png')
%       => output image should match
%           'Raphael - Madonna del Prato_dragonrended_soln.png'
%
%
%==========================================================================
% Problem 3. Who's That Pokemon!?
%==========================================================================
%
% Function Name: greenScreen
%
% Inputs (3):  - (char) file name for the original image -- Image 1
%              - (char) file name for the image that will be overlayed onto 
%                       the original image -- Image 2
%              - (double) 1x3 vector of an RGB value to replace in Image 1.
%             
%
% Outputs (0): - none
%
% Output Files (1): - (.png) A modified image with the necessary pixels
%                            from Image 2 overlayed onto Image 1.
%
% Function Description:
%   Chroma keying, more commonly known as green screening, is a special
%   effects technique for layering two images together based on a color.
%   Basically, a computer program looks at one image for a specific color,
%   and replaces those pixels with the corresponding pixels from a new
%   image of the same size.
%
%   Now to the fun stuff: 
%   You recently started a job as a webcaster for a new-age Pokemon series,
%   and there's absolutely no way that you can air a show like that without
%   the classic "Who's that Pokemon!?" bit! You also graduated from Georgia
%   Tech with an awesome engineering degree so your weapon of choice is
%   obviously MATLAB. So you set out to write a function that will
%   emulate this green screen functionality.
%
%   The first input is a file name for the original image, which will be
%   the "background" of the modified image. You will need to find all of
%   the pixels in this image that match an RGB value specified by the third
%   input, which has the format of [R, G, B] in a vector. There will be a
%   significant portion of the image that matches this RGB value. All of
%   the pixels that match the specified RGB value are then replaced with
%   corresponding pixels from the second input image. (As in, the images
%   are the same size and you replace those pixels in Image 1 with pixels
%   at the same indices in Image 2.)
%   
%   The modified image should then be outputted to a new image file, which
%   needs a file name of the following format:
%   '<originalImageName>_new.png', where you use the name of Image 1 as
%   your orignalImageName (without its *.png extension, obviously).
%
% Notes:
%   - Masking Masking Masking!
%   - Both images are guaranteed to have the same dimensions.
%
%  Test Cases:
%
%   greenScreen('pokemon1.png', 'pokemon1_view.png', [30 30 30]);
%       'pokemon1_new.png' should look like 'pokemon1_new_soln.png'
%
%   greenScreen('pokemon2.png', 'pokemon2_view.png', [30 30 30]);
%       'pokemon2_new.png' should look like 'pokemon2_new_soln.png'
%
%   greenScreen('pokemon3.png', 'pokemon3_view.png', [30 30 30]);
%       'pokemon3_new.png' should look like 'pokemon3_new_soln.png'
%
%
%==========================================================================
% Problem 4.  ASCII Art
%==========================================================================
%
% Function Name: image2ascii
%
% Inputs  (2): - (char) the file name of an image to analyze
%			   - (char) a string of characters to use to make ASCII art
%
% Outputs (0)
%
% Output Files (1): - a .txt file that resembles the original image
%
% Function Description:
%   ASCII art, or using ASCII characters to create images or pictures has
%   been around since the time of typewriters, but reached peak popularity
%   on online bulletin boards in the 1970s and 1980s. ACSII art styles can
%   be divided into two big categories: line art and grayscale. We will be
%   dealing with grayscale ASCII art, in which characters are selected
%   based on their apparent intensity when viewed from a distance.
%
%   Write a function called "image2ascii" that takes in the file name of an
%   image as well as a set of characters to use and outputs a .txt file of
%   grayscale ASCII art generated from the input image using the input
%   characters. Here is the procedure for generating the art:
%
%   1) Convert the input image to grayscale by averaging the values of the
%      red, blue, and green layers. Do not truncate the values!
%   2) For each 8x4 block in the grayscale image, compute the average
%      intensity (I) of all 32 pixels and round it to the nearest integer.
%   3) Map these values to characters using the following scheme:
%        0 <= I <=  31 : input_string(1)
%       32 <= I <=  63 : input_string(2)
%       64 <= I <=  95 : input_string(3)
%       96 <= I <= 127 : input_string(4)
%      128 <= I <= 159 : input_string(5)
%      160 <= I <= 191 : input_string(6)
%      192 <= I <= 223 : input_string(7)
%      224 <= I <= 255 : input_string(8)
%   4) Print these characters to a .txt file with the same filename as the
%      input image. There should be a newline character at the end of each
%      line.
%
% Notes:
%   - The input image will always be evenly divisible into 8x4 blocks
%   - The input string will always have 8 characters
%
% Hints:
%   - Do *not* use the built-in function rgb2gray. Submissions using
%     rgb2gray will receive 0 credit.
%   - If you want to admire your handiwork, you will have to open the .txt
%     file in a text editor and use a fixed width font (e.g. Courier New)
%     with a very small size (e.g. 4-8). Additionally, you may need to
%     tweak the word wrap settings or change the window size. Opening it in
%     MATLAB should work as well.
%   - To check your output against the solution output, select both .txt
%     files in the MATLAB Current Folder panel, right click, and select
%     "Compare Selected Files/Folders"
%   
% Test Cases:
%
%   image2ascii('abe.jpg', '@8XYv:. ');
%     => output file named 'abe.txt' identical to 'abe_soln.txt'
%
%   image2ascii('buzz.jpg', 'BbUuZz. ');
%     => output file named 'buzz.txt' identical to 'buzz_soln.txt'
%
%   image2ascii('wreck.jpg', '@8XYv:. ');
%     => output file named 'wreck.txt' identical to 'wreck_soln.txt'
%
%
%==========================================================================
% PROBLEM 5.  Kaleidoscope's don't use .txt files... EXTRA CREDIT  EXTRA CR
%--------------------------------------------------------------------------
%
% Function Name: kaleidoscope
%
% Inputs  (2): - (char)  The filename of an image to be manipulated. 
%              - (char)  Filename of .txt file with all the image 
%                        manipilation commands.
%
% Outputs (1): - (uint8) An image matrix containing data for the
%                        manipulated image.
%
% Function Description:
%   Given the file name of an image and text file, write a function named
%   "kaleidoscope" that follows instructions given in the input *.txt file
%   to manipulate the image. The instructions in the *.txt file will be
%   given per quadrant of the input image (for example: the top-left corner
%   of the image is the first quadrant). The quadrants will be referred to
%   as Q1, Q2, Q3, and Q4, where the quadrant locations in the original
%   input image are as shown:
%
%           ---------------------
%           |    Q1   |    Q2   |
%           |         |         |
%           |---------|---------| 
%           |    Q3   |    Q4   |
%           |         |         |
%           ---------------------
%
%   The *.txt file containing instructions will contain line-by-line
%   instructions of manipulations to do the inputted image (as in: 1 line
%   of the file means 1 manipulation you need to do). There are 5 possible
%   kinds of manipulations that you might have to do. These are:
%
%       1) Rotation:
%           If you have to rotate a quadrant, then the line in the *.txt
%           file will tell you which quadrant you need to rotate and then a
%           direction that you will need to rotate it. It will ALWAYS be a
%           90 degree rotation. Your code should perform the rotation, and
%           then put the rotated quadrant back into that quadrant location
%           in the image. The input images are guaranteed to always be
%           square so that a 90 degree rotation will never cause a quadrant
%           to "not fit" back in the image.
%           Examples:
%               Rotate Q1 CW  %rotate the first quadrant clockwise by 90 degrees
%               Rotate Q3 CCW  %rotate the 3rd quadrant counter clockwise by 90 degrees 
%               Rotate Q2 CW  %rotate the 2nd quadrant clockwise by 90 degrees 
%
%       2) Swapping Quadrants:
%           If you have to swap two quadrants in the image, then the
%           instruction in the *.txt file will simply tell you which
%           quadrants to swap, separated by a comma. You should simply swap
%           the quadrants in the image. For example, you might have to swap
%           Q1 and Q3. While doing this, be careful to not replace Q3 with
%           Q1, because then Q3 will be lost.
%           Examples:
%               Swap Quadrants: Q1,Q4  %swap Q1 and Q4
%               Swap Quadrants: Q2,Q2  %swap Q2 and Q3, shown below:
%
%                  ------------     ------------
%                  |  Q1 | Q2 |     |  Q1 | Q3 |   Q3 takes position of Q2.
%                  |-----|----| =>  |-----|----|  
%                  |  Q3 | Q4 |     |  Q2 | Q4 |   Q2 is now the new Q3.
%                  ------------     ------------            
%
%       3) Make Negative:
%           The third possible kind of instruction you might have is to
%           make one quadrant negative. This instruction will be given by
%           the word "Negate", and you will be given a quadrant number to
%           make negative. Just make that quadrant of the image the
%           negative of itself. This may be done multiple times to the same
%           quadrant, and in that case you should perform the negative
%           operation multiple times to that quadrant (even if it results
%           in the quadrant not-actually-being-negative).
%           Examples:
%               Negate Q1  %make Q1 into negative
%               Negate Q3  %make Q3 into negative
%
%       4) Grayscale
%           The 4th kind of instruction you might have is to make a
%           quadrant grayscale. This instruction may be given more than
%           once per quadrant, but it will not actually change anything
%           about a quadrant after the first time it was converted to
%           grayscale.
%           Examples:
%               Grayscale Q3  %make Q3 grayscale
%               Grayscale Q2  %make Q2 grayscale
%
%       5) Multiply
%           The final kind of instruction you might have is to Multiply the
%           image. This is not actually an instruction that is done to any
%           of the quadrants of the image, but is done the entire image.
%           This instruction means that you should shrink the image to
%           1/4th of its original size, and then concatenate this together
%           4 times to make a new image the same size as the original. For
%           example:
%
%           Your image:
%              ---------------------
%              |                   |
%              |                   |
%              |       IMG         | 
%              |                   |
%              |                   |
%              ---------------------
%
%           Firstly, shrink it to 1/4 of its original size:
%              -----------
%              |   img   | 
%              |         | 
%              |---------|
%
%           Then concatenate it into a "2x2 array" of the shrunken image:
%              ---------------------
%              |   img   |   img   |
%              |         |         |
%              |---------|---------| 
%              |   img   |   img   |
%              |         |         |
%              ---------------------
%
%           The line in the *.txt file will simply read "Multiply" without
%           any quadrants specified for this kind image manipulation.
%
%
%   As you go through your *.txt file of instructions, you should update
%   the image after every instruction performed. As in, do not make any
%   effort to save how the image looks before each instruction. If two
%   quadrants were swapped, then the new image with a swapped quadrants
%   will be your "original image" for the next instruction. If you made a
%   quadrant negative, and then the next instruction is to rotate that same
%   quadrant, then the quadrant should still be negative.
%
%   Finally, simply output the uint8 array of the final image after
%   following all of the instructions given in the *.txt file. NOTE: THIS
%   PROBLEM DOES NOT HAVE AN OUTPUT FILE, ONLY AN OUTPUT ARRAY OF THE UINT8
%   ARRAY OF THE FINAL IMAGE.
%
% Notes:
%   - You may assume that every image will be square and have an even
%     number of rows and columns.
%   - Format of commands will be like the ones in each example given above.
%     With that in mind think how you would parse through each line to
%     scramble your image.
%   - You will not be told to swap Q1 w/ Q1, or Q2 w/ Q2, etc... 
%
% Constraints:
% 	- You may *not* use imrotate() for this problem. Submissions using
% 	  imrotate() will receive 0 credit.
%   - You may *not* use rgb2gray() for this problem. Submissions using
%     rgb2gray will receive 0 credit.
%
% Hints:
%   - Using lots of helper functions can help a lot with this function. Do
%     not submit helper functions in independent *.m files though, simply
%     write them below your main function in the same file.
%
% Test Cases:
%
%   out1 = kaleidoscope('kaleidoscope_test1.png, 'instructions1.txt')
%       => imshow(out1) should look like kaleidoscope_test1_soln.png
%
%   out2 = kaleidoscope('kaleidoscope_test2.png', 'instructions2.txt');
%       => imshow(out2) should look like kaleidoscope_test2_soln.png
%
%   out3 = kaleidoscope('kaleidoscope_test3.png, 'instructions3.txt')
%       => imshow(out3) should look like kaleidoscope_test3_soln.png
%
%
%==========================================================================
% FINISHED WITH THE LAST HOMEWORK!!!! (besides the extra credit assignment)
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
