%Executes the 2nd Order Runge-Kutta Method
fprintf(1,'####\t2ND ORDER RUNGE-KUTTA METHOD\t####\n');

fprintf(1, 'Please input x start:\n');
xstart = input(' ');
fprintf(1, 'Please input x end:\n');
xend = input(' ');
fprintf(1, 'Please input y:\n');
y = input(' ');
fprintf(1, 'Please input h:\n');
h = input(' ');

fprintf(1, 'Please input alpha:\n');
a = input(' ');
fprintf(1, 'Please input beta:\n');
b = input(' ');
fprintf(1, 'Please input c:\n');
c = input(' ');

n=round((xend-xstart)/h);
x = xstart;


fprintf(1,'x\t\t\ty_exact\t\ty_pred\t\terror\n');

for i=1:n+1
    y_exact = functionval(x);
    fprintf(1,'%f\t%f\t%f\t%f\n',x ,y_exact,y,(y_exact-y));
    k1 = h*deriv1val(x,y);
    k2 = h*deriv1val(x + c*h,y +c*k1);
    y = y + a*k1 + b*k2;
    x = x + h;
end