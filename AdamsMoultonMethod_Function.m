
function ADM = AdamsMoultonMethod_Function(x,y,h,i,deriv)

y_pred = y(i-1) + (h/24)*(55*deriv(i-1) - 59*deriv(i-2)...
        + 37*deriv(i-3) - 9*deriv(i-4));
f_pred = deriv1val(x(i),y_pred);
    
ADM = y(i-1) + (h/24)*(9*f_pred + 19*deriv(i-1) - 5*deriv(i-2)...
        + deriv(i-3));    

end