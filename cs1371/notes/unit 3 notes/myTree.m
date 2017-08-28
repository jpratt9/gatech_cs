function  myTree( x1, y1,ln,th)

x2 = x1 + ln .* sin(th);
y2 = y1 + ln .* cos(th);

if ln < 1 %leaf
  plot([x1 x2], [y1 y2], 'g');
else %branch
    
   plot([x1 x2], [y1 y2], 'k');
   
   rn = rand(1,2) - 0.5;
   newL = ln .* 0.7;
   hold on
   myTree(x2, y2, newL, th+rn(1));
   myTree(x2, y2, newL, th+rn(2));
end
end