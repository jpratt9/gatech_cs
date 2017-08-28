# HW1-3
# Student Name:
# Date:
#
# This program computes the difference in the frequency of
# boiling temperatures and the frequency of freezing temperatures in a
# set of 25 integers, Temps.

.data
Temps:    .word 110, 5, 200, -73, 0
          .word 17, 9, -7, -3, 100
          .word 25, 242, -126, 108, -60
          .word 26, 8, 60, 27, 117,
          .word 8, 7, 33, 100, 125
FreqDiff: .alloc 1

.text
                # write your code here...

                jr $31   # return to OS


