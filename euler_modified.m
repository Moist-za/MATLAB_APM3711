syms('x','y','s','deriv', 'xstart', 'xend', 'h', 'corrects')



fprintf(1,'This is the Modified Euler Method\n');
fprintf(1,'Input derivative in terms of x and y\n');
s = input(' ');
deriv = inline(s, 'x','y');

fprintf(1,'This is the Modified Euler Method\n');
fprintf(1,'Input exact equation y=somethingx\n');
ex = input(' ');
exact = inline(ex, 'x');

fprintf(1,'Input range: Start, End, initial y value, h, corrects\n');
xstart = input(' ');
xend = input(' ');
yinitial = input(' ');
h = input(' ');
corrects = input(' ');

n = round((xend-xstart)/h);
x = xstart;
y = yinitial;

fprintf(1, 'x \t y_ex \t y_pred \t ycor1 \t ycor2 \n');
fprintf(1, '\n');
fprintf(1, '%f \t %f \n',x,y);


for i=0:n
    
    f_old = deriv(x,y);
    x = x+h;
    y_ex = exact(x); 
    fprintf (1, '%f \t %f \t',x,y_ex);
    y_pred =y + h*(f_old);
    fprintf (1, '%f \t',y_pred);
    
    for j=1:corrects
        f_pred = deriv(x,y_pred);
        y_pred = y + h/2*(f_old + f_pred);
        fprintf (1, '%f \t',y_pred);
    end
    
    y = y_pred;
    fprintf(1,'y: %f \t x: %f \n',y,x);
end
    


