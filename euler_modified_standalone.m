%declare some variables
syms('x','y', 'y_ex') 

fprintf(1,'This is the Modified Euler Method\n');
fprintf(1,'Input derivative in terms of x and y, i.e. y''=(x)+(y):\n');
%take input of derivative in terms of x and y, i.e. y'=(x)+(y)
s = input(' ');
deriv = inline(s, 'x','y');
fprintf(1,'%s\n',s);

fprintf(1, '\n');
fprintf(1,'Input exact equation. e.g. y=2(x) (''write 2(x)''):\n');
s = input(' ');
exact = inline(s, 'x');
fprintf(1,'%s\n',s);

fprintf(1, '\n');
fprintf(1,'Input range: Start, End, initial y value, h, corrects\n');
xstart = input(' ');
xend = input(' ');
yinitial = input(' ');
h = input(' ');
corrects = input(' ');
fprintf(1, '\n');
fprintf(1,'Start: %d, End: %d, Initial y value: %d, h: %d, corrects: %d\n', xstart, xend, yinitial, h, corrects);
fprintf(1, '\n');

n = round((xend-xstart)/h); %calculates number of iterations required
x = xstart;
y = yinitial;
y_error = inline('(y_ex)-(y)','y_ex','y');%calculates error

%layout of output
fprintf(1, 'x \t\t\ty_exact \ty_predicted \terror\t\ty_1stCorr \ty_2ndCorr \n');
fprintf(1, '\n');

%display first line before calculations
fprintf (1, '%f \t%f \t%f \t\t%f \t',x,y,y,y_error(y,y));%y==yinitial, so duplicate
  
%to calculate the rest of the values;
for i=1:n
    
    f_old = deriv(x,y); %calculate derivative on 'old' values
    x = x+h;%increment by h
    y_ex = exact(x); %calculate new y value using analytical solution
    y_pred =y + h*(f_old); %predict 1
    
    for j=1:corrects
        f_pred = deriv(x,y_pred);
        y_pred = y + h/2*(f_old + f_pred); %correction calculation
        fprintf (1, '%f \t',y_pred);
    end
    fprintf (1, '\n');
    y = y_pred;
    fprintf (1, '%f \t%f \t%f \t\t%f \t',x,y_ex,y,y_error(y_ex,y));
end
fprintf (1, '\n');    


