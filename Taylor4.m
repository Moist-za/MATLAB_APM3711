%Executes the 4th Order Taylor Method
fprintf(1,'####\t4th ORDER TAYLOR METHOD\t####\n');

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
    y = y + h*( deriv1val(x,y) + h*( deriv2val(x,y)/2 + ...
        h*( deriv3val(x,y)/6 + h*deriv4val(x,y)/24)));
    x = x + h;
end