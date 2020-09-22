%declare some variables
syms('x','y','z', 'y_ex') 

fprintf(1,'This is the Shooting with Modified Euler Method\n');
fprintf(1,'Input 2nd derivative in terms of x and y and z (z = y''), i.e. y''''=(x)+(y)+(z):\n');
%take input of derivative in terms of x and y, i.e. y'=(x)+(y)
s = input(' ');
zprime = inline(s, 'x','y','z');
fprintf(1,'%s\n',s);

fprintf(1, '\n');
fprintf(1,'Input exact equation. e.g. y=2(x) (''write 2(x)''):\n');
s = input(' ');
exact = inline(s, 'x');
fprintf(1,'%s\n',s);

fprintf(1, '\n');
fprintf(1,'Input range: Start, End, initial y value, h, corrects, y'' guess\n');
xstart = input(' ');
xend = input(' ');
yinitial = input(' ');
h = input(' ');
corrects = input(' ');
z_guess = input(' ');
fprintf(1, '\n');
fprintf(1,'Start: %d, End: %d, Initial y value: %d, h: %d, corrects: %f, y'' guess: %f\n', xstart, xend, yinitial, h, corrects,z_guess);
fprintf(1, '\n');

n = round((xend-xstart)/h); %calculates number of iterations required
x = xstart;
y = yinitial;
z = z_guess;
y_error = inline('(y_ex)-(y)','y_ex','y');%calculates error

%layout of output
fprintf(1, 'x \t\t\ty_exact \ty_predicted \terror\t\ty_1stCorr\n');
fprintf(1, '\n');

%display first line before calculations
fprintf (1, '%f \t%f \t%f \t\t%f \t',x,y,y,y_error(y,y));%y==yinitial, so duplicate
  
%to calculate the rest of the values;
for i=1:n
    
    z_prime = zprime(x,y,z); %calculate derivative on 'old' values
    y_prime = z;
    x = x+h;%increment by h
    y_ex = exact(x); %calculate new y value using analytical solution
    y_pred =y + h*(y_prime); %predict 1
    z_pred =z + h*(z_prime);
    
    if (corrects >0)
        for j=1:corrects
            z = z + h/2*(z_prime + zprime(x,y_pred,z_pred)) ;
            y = y + h/2*(y_prime + z); %correction calculation
            fprintf (1, '%f \t',y);
        end
    else
        z = z_pred;
        y = y_pred;
    end
    fprintf (1, '\n');

    fprintf (1, '%f \t%f \t%f \t\t%f \t',x,y_ex,y,y_error(y_ex,y));
end
fprintf (1, '\n');    


