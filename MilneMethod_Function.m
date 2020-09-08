function Milne = MilneMethod_Function(x,y,h,i,deriv)

y_pred = y(i-4) + (4*h/3)*(2*deriv(i-1) - deriv(i-2) + 2*deriv(i-3));
f_pred = deriv1val(x(i),y_pred);
Milne = y(i-2) + (h/3)*(f_pred + 4*deriv(i-1) + deriv(i-2));

end