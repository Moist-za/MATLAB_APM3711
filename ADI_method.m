%Given the Dirichlet boundary conditions, uses ADI to solve the 
%Laplace equation to find steady state heat on a rectangular plate.
clear, clc, format short;
fprintf('\nADI Method\n');
UPPER=[90 70 50];                   %vector containing upper boundary conditions
LOWER=[70 50 30];                   %vector containing lower boundary conditions
LEFT=[120 150 150 120];             %vector containing left boundary conditions
RIGHT=[0 0 0 0];                    %vector containing right boundary conditions
rho= 1;
MAX_ITER=100                        %set max number of iterations
TOL=0.00001                            %set tolerance for termination condition

mean_u=mean([UPPER LOWER LEFT RIGHT]);
T=mean_u*ones(length(LEFT),length(UPPER));    %populate inner grid points with mean value of boundary points
% T=zeros(length(LEFT),length(UPPER)); 
T=[UPPER; T; LOWER];
T=[[0 LEFT 0]' T [0 RIGHT 0]']                %arrange T to include boundary points & display

iterations=0; max_err=1;                      %initialize iteration counter & error variable
while (iterations<MAX_ITER) && (max_err>TOL)
  max_err=0;                                  %initilize max_err counter for this iteration
  %//Solving in the x-direction//#
  for i=2:length(LEFT)+1                      %for each interior row of T
    for j=2:length(UPPER)+1                   %for each interior column of T
      %new_T=(1/3)*(T(i-1,j)-2*T(i,j)+T(i+1,j)+T(i,j-1)+T(i,j+1));
      new_T=1/(1/rho+2)*(T(i-1,j)+T(i,j-1)+T(i,j+1)+((1/rho-2)*T(i,j))+T(i+1,j));        
      if abs(T(i,j)-new_T)>max_err           %calculate error for tolerance condition
        max_err=abs(T(i,j)-new_T);            %update error if greater
      end
      T(i,j)=new_T;                           %update value of inner grid point
    end
  end
  iterations=iterations+1;                               %increment iteration counter
  %//Solving in the y-direction//#
%   for j=2:length(UPPER)+1                     %for each interior column of T
%     for i=2:length(LEFT)+1                    %for each interior row of T
%       %new_T=(1/3)*(T(i,j-1)-2*T(i,j)+T(i,j+1)+T(i-1,j)+T(i+1,j));
%       new_T=1/(1/rho+2)*(T(i-1,j)+T(i,j-1)+T(i+1,j)-T(i,j)+T(i,j+1));
%       if abs(T(i,j)-new_T)>max_err           %calculate error for tolerance condition
%         max_err=abs(T(i,j)-new_T);            %update error if greater
%       end
%       T(i,j)=new_T;                           %update value of inner grid point
%     end
%   end
%   iterations=iterations+1;                                %increment iteration counter
end

fprintf('\nMethod terminated after %d iterations. Result:\n',iterations)
display(T);                                   %display solution