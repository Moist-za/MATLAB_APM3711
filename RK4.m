%Executes the 4th Order Runge-Kutta Method
fprintf(1,'####\t4th ORDER RUNGE-KUTTA METHOD\t####\n');

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


fprintf(1,'x\t\t\ty_exact\t\ty_pred\t\terror\n');

for i=1:n+1
    y_exact = functionval(x);
    fprintf(1,'%f\t%f\t%f\t%f\n',x ,y_exact,y,(y_exact-y));
    k1 = h*deriv1val(x,y);
    k2 = h*deriv1val(x + h/2,y + k1/2);
    k3 = h*deriv1val(x + h/2,y + k2/2);
    k4 = h*deriv1val(x + h,y + k3);
    y = y + (k1 + 2*k2 +2*k3 + k4)/6;
    x = x + h;
end