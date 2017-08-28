%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <John Pratt>
% GT Email     : <jpratt9@gatech.edu>
% Homework     : HW_StudyImages
% Course       : CS1371
% TA's Name    : <Edward Foyle, Nick Fahrenkrog>
% Section      : <B05>
% Collaboration: <I worked on the homework assignment alone, using
%                  only course materials.>
%
% NOTE: THIS HOMEWORK IS PURELY FOR STUDYING PURPOSES. IT WILL BE
% AUTOGRADED AND YOUR "GRADE" WILL BE UPLOADED TO TSQUARE, BUT IT WILL NOT
% CONTRIBUTE WHATSOEVER TO YOUR GRADE IN THIS COURSE. THEREFORE NO REGRADES
% WILL BE CONSIDERED. THIS IS ONLY A STUDY TOOL DESIGNED TO BE USED IN
% CONJUNCTION WITH HOMEWORK 13, BUT WILL PROVIDE YOU FEEDBACK BEFORE YOUR
% TEST. YOU MAY CHOOSE WHETHER OR NOT TO USE THIS STUDY TOOL, BUT IF YOU DO
% USE IT THEN IT IS YOUR RESPONSIBILITY TO USE IT EFFECTIVELY.
%
%
% Files provided with this homework:
%   hw_StudyImages.m
%   channing.png
%   channing_smurf_soln.png
%   colorSplash_soln.p
%   green_apple.png
%   immult_test1_soln.png
%   immult_test2_soln.png
%   immultiply_soln.p
%   immultiply_test1.png
%   immultiply_test2.png
%   jennifer.png
%   jennifer_smurf_soln.png
%   madeRed_apple_soln.png
%   optimus.png
%   pikachu.png
%   redApple_soln.p
%   ryan.png
%   ryan_smurf_soln.png
%   smurfed_soln.p
%   splash1.png
%   splash2.png
%
% Files to submit:
%   hw_StudyImages.m
%   redApple.m
%   smurfed.m
%   colorSplash.m
%   immultiply.m
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
% PART 1. Drill Problems
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
%==========================================================================
% PROBLEM 1.   Apparently a circle is an "apple"... Whatever...
%--------------------------------------------------------------------------
% Function Name: redApple
%
% Inputs (1): -(char) A string representing an image file name
% 			  -(char) A string representing the file to write the output to 
%
% Outputs (0): - none
%
% Output Files (1): - (.png) An output file with the green "apple" turned
%                            red.
%
% Function Description:
%   The first input is the name of an image of a green apple on a white
%   background. Because red apples are the superior type of apple, you
%   should change the color of the apple in the image to red. This color
%   change should only effect the apple, and not the white background of
%   the image. Write your red apple to an image file, the name of which is
%   given in the second input.
%
% Notes:
%   - The green apple will be wherever the Green value in the image is 255
%     and red and blue values are not 255.
%   - Use the RGB values of [255 0 0] for the red to make the apple.
%   - The "apple" in this problem is guaranteed to always be the only
%     feature in the image. As in, the image will be all white besides the
%     apple.
%
% Test Case:
%
%       redApple('green_apple.png', 'madeRed_apple.png');
%           => 'madeRed_apple.png' should look like 'madeRed_apple_soln.png'
%
%
%==========================================================================
% PROBLEM 2. Tangled Up In Blue
%--------------------------------------------------------------------------
% 
% Function Name: smurfed
% Inputs  (1): -(char) A string of the filename of an image of a
%                      celebrity
% Outputs (0):
%
% Output Files (1): - (.png) A file containing the manipulated picture
%
% Function Description:
%   As an avid Smurf fan, you were disappointed with the latest Smurf
%   movie. Instead, you'd prefer a film with live action Smurfs. To pick
%   the perfect cast your movie, you've decided to see what some famous
%   celebrities would look like when made-up as Smurfs.
%
%   Write a function called smurfed that takes in a filename of a celebrity
%   picture. The picture will have a celebrity's picture and a pure white
%   background. In order to make the celebrity appear blue, you should
%   firstly find which pixels are not the white background (i.e.
%   are the celebrity), and divide both the red and green layers of these pixels
%   by 3. After the image has been edited, write the new image to a
%   new file. The new file will have the same name as the original file,
%   but with '_smurf' appended before the file extension.
%
%   Original File: 'channing.png'
%        New File: 'channing_smurf.png'
%
% Hints:
%   - Try using a logical mask to avoid changing the white positions 
%     when changing the red and green values. 
%
% Test Cases:
%
%   smurfed('channing.png');
%       => 'channing_smurf.png' should look like 'channing_smurf_soln.png'
%
%   smurfed('jennifer.png');
%       => 'jennifer_smurf.png' should look like 'jennifer_smurf_soln.png'
%
%   smurfed('ryan.png');
%       => 'ryan_smurf.png' should look like 'ryan_smurf_soln.png'
%
%
%==========================================================================
% PROBLEM 3.   Because "Desaturate All But One Color" wasn't catchy enough
%--------------------------------------------------------------------------
%
% Function Name: colorSplash
%
% Inputs  (2): - (char)  The file name of an image 
%              - (uint8) A 1x3 vector representing an RGB color
%
% Outputs (1): - (uint8) An image that is grayscale except for one color.
%
% Function Description:
%   Do you ever see those pictures that are mostly grayscale, but have one 
%   object in color? How do they add that "splash" of color to an otherwise
%   grayscale image? Well, they probably don't use MATLAB, but you can
%   imitate this effect by taking a color image and removing all of the
%   colors except for one.
%
%   Write a function called "colorSplash" that makes an image grayscale
%   with the exception of a single color. The color will be input as a
%   vector of three uint8 values that correspond to the color's R, G, and B
%   values. For example, if we wanted to keep pure blue, the second input
%   argument would be uint8([0, 0, 255]).
%
% Notes:
%   - Do *NOT* use rgb2gray(). If you do, you will not get the correct
%     output. Instead, the grayscale part should be created by averaging
%     the values of the red, green, and blue layers of the image.
%   - It is unwise to try to tackle this problem by iterating through every
%     pixel. It will simply take too long. Instead, use logical indexing.
%
% Test Cases:
%   fn1 = 'pikachu.png';
%   color1 = uint8([255, 255, 0]);
%   splash1 = colorSplash(fn1, color1);
%       => imshow(splash1) should look like 'splash1.png'
%
%   fn2 = 'optimus.png';
%   color2 = uint8([128, 0, 0]);
%   splash2 = colorSplash(fn2, color2);
%       => imshow(splash2) should look like 'splash2.png'
%
%
%==========================================================================
% PROBLEM 4.  Mutiply image!
%--------------------------------------------------------------------------
%
% Function Name: immultiply
%
% Inputs  (1): - (char)  The filename of an image to multiply.
%
% Outputs (1): - (uint8) An image matrix containing data for the
%                        multiplied image.
%
% Function Description:
%   Given the name of an image file as an input, write a function that will
%   multiply the image. This will be done by shrinking an image to 1/4th of
%   its original size and then concatenating the shrunken image into a "2x2
%   array" of the same image. For example:
%
%   Given an input image:
%           ---------------------
%           |                   |
%           |                   |
%           |       IMG         | 
%           |                   |
%           |                   |
%           ---------------------
%
%   Firstly, shrink it to 1/4 of its original size:
%           -----------
%           |   img   | 
%           |         | 
%           |---------|
%
%   Then concatenate it into a "2x2 array" of the shrunken image:
%           ---------------------
%           |   img   |   img   |
%           |         |         |
%           |---------|---------| 
%           |   img   |   img   |
%           |         |         |
%           ---------------------
%           
%   To shrink an image to 1/4th of its original size it will need half as
%   many rows and half as many columns as the original image. There are no
%   guarantees given about the size of this problem, but the solution file
%   for this problem uses the round() function (rather than floor or ceil)
%   when dividing the rows and columns by 2, so your code should do the
%   same. You should then output the uint8 image array of the multiplied
%   image; there is no output image file for this problem.
%
% Test Cases:
%
%       out1 = immultiply('immultiply_test1.png')
%           => imshow(out1) should look like immult_test1_soln.png
%
%       out2 = immultiply('immultiply_test2.png')
%           => imshow(out2) should look like immuly_test2_soln.png
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.