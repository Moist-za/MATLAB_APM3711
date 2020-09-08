
fprintf(1,'The following will print the RKF for the first three iterations\n')
fprintf(1,'and then include the Milne Method\n');
fprintf(1,'\n');

%initialise vectors/arrays
x = zeros(6,1);
y = zeros(6,1);
deriv = zeros(6,1);
y_exact = zeros(6,1);

x(1) = 0;%start x
y_exact(1) = 1;%start y
y(1) = 1;
deriv(1) = deriv1val(x(1),y(1));
h = 0.2;

fprintf(1,'x\t\ty_exact\t\t\ty_pre\t\t\t\ty_pred\t\t\terror\n');
fprintf(1,'%2.2f\t%1.12f\n',x(1),y_exact(1));

for i=2:4
    x(i)= x(i-1) + h;
    y_exact(i) = functionval(x(i));
    y(i) = RKF_Function(x(i-1),y(i-1),h);
    deriv(i) = deriv1val(x(i),y(i));
    fprintf(1,'%2.2f\t%1.12f\t\t\t\t\t\t%1.12f\t%1.12f\n',x(i) , y_exact(i), ...
        y(i), y_exact(i)-y(i))
end

for i=5:6
    x(i)= x(i-1) + h;
    y_exact(i) = functionval(x(i));

    
    %Milne
    y_pred = y(i-4) + (4*h/3)*(2*deriv(i-1) - deriv(i-2) + 2*deriv(i-3));
    f_pred = deriv1val(x(i),y_pred);
    y(i) = y(i-2) + (h/3)*(f_pred + 4*deriv(i-1) + deriv(i-2));     
    
    deriv(i) = deriv1val(x(i),y(i));

    fprintf(1,'%2.2f\t%1.12f\t%1.12f\t\t%1.12f\t%1.12f\n',x(i) , y_exact(i), ...
        y_pred, y(i), y_exact(i)-y(i));
end
fprintf(1,'\n');

clear;

fprintf(1,'The following will print the RKF for the first three iterations\n')
fprintf(1,'and then include the Adams-Moulton Method\n');
fprintf(1,'\n');

%initialise vectors/arrays
x = zeros(6,1);
y = zeros(6,1);
deriv = zeros(6,1);
y_exact = zeros(6,1);
y_func = zeros(6,1);

x(1) = 0;%start x
y_exact(1) = 1;%start y
y(1) = 1;
deriv(1) = deriv1val(x(1),y(1));
h = 0.2;

fprintf(1,'x\t\ty_exact\t\t\ty_pre\t\t\t\ty_pred\t\t\terror\n');
fprintf(1,'%2.2f\t%1.12f\n',x(1),y_exact(1));

for i=2:4
    x(i)= x(i-1) + h;
    y_exact(i) = functionval(x(i));
    y(i) = RKF_Function(x(i-1),y(i-1),h);
    deriv(i) = deriv1val(x(i),y(i));
    fprintf(1,'%2.2f\t%1.12f\t\t\t\t\t\t%1.12f\t%1.12f\n',x(i) , y_exact(i), ...
        y(i), y_exact(i)-y(i))
end

for i=5:6
    x(i)= x(i-1) + h;
    y_exact(i) = functionval(x(i));

    
    %Adams-Moulton
    y_pred = y(i-1) + (h/24)*(55*deriv(i-1) - 59*deriv(i-2)...
        + 37*deriv(i-3) - 9*deriv(i-4));
    f_pred = deriv1val(x(i),y_pred);
    
    
    y(i) = y(i-1) + (h/24)*(9*f_pred + 19*deriv(i-1) - 5*deriv(i-2)...
        + deriv(i-3));    

    deriv(i) = deriv1val(x(i),y(i));

    fprintf(1,'%2.2f\t%1.12f\t%1.12f\t\t%1.12f\t%1.12f\n',x(i) , y_exact(i), ...
        y_pred, y(i), y_exact(i)-y(i));
end
fprintf(1,'\n');