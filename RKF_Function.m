function RKF = RKF_Function(x,y,h)

k1 = h*deriv1val(x,y);
k2 = h*deriv1val(x + h/4, y + k1/4);
k3 = h*deriv1val(x + 3*h/8, y + 3*k1/32 + 9*k2/32);
k4 = h*deriv1val(x + 12*h/13, y + 1932*k1/2197 - 7200*k2/2197 ...
        + 7296*k3/2197);
k5 = h*deriv1val(x + h, y + 439*k1/216 - 8*k2 + 3680*k3/513 ...
        - 845*k4/4104);
k6 = h*deriv1val(x + h/2, y - 8*k1/27 + 2*k2 - 3544*k3/2565 ...
        + 1859*k4/4104 - 11*k5/40);

    
RKF = y + (16/135)*k1 + (6656/12825)*k3 + (28561/56430)*k4 ...
        - (9/50)*k5 + (2/55)*k6;    

end