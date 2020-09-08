%Executes the Runge-Kutta-Fehlberg Method
fprintf(1, '#####\t\tRUNGE-KUTTA-FEHLBERG\t\t####\n');

%initialise starting values
fprintf(1, 'Please input x start:\n');
xstart = input(' ');
fprintf(1, 'Please input x end:\n');
xend = input(' ');
fprintf(1, 'Please input y:\n');
y = input(' ');
fprintf(1, 'Please input h:\n');
h = input(' ');

n=round((xend-xstart)/h);
x = xstart;

format long;
fprintf(1,'x\t\ty_exact\t\t\ty_pred\t\t\terror\n');

for i=1:n+1
    y_exact = functionval(x);
    fprintf(1,'%2.2f\t%12.12f\t%12.12f\t%12.12f\n',x ,y_exact,y,(y_exact-y));
    k1 = h*deriv1val(x,y);
    k2 = h*deriv1val(x + h/4, y + k1/4);
    k3 = h*deriv1val(x + 3*h/8, y + 3*k1/32 + 9*k2/32);
    k4 = h*deriv1val(x + 12*h/13, y + 1932*k1/2197 - 7200*k2/2197 ...
        + 7296*k3/2197);
    k5 = h*deriv1val(x + h, y + 439*k1/216 - 8*k2 + 3680*k3/513 ...
        - 845*k4/4104);
    k6 = h*deriv1val(x + h/2, y - 8*k1/27 + 2*k2 - 3544*k3/2565 ...
        + 1859*k4/4104 - 11*k5/40);
    y = y + (16/135)*k1 + (6656/12825)*k3 + (28561/56430)*k4 ...
        - (9/50)*k5 + (2/55)*k6;
    x = x + h;
end


















