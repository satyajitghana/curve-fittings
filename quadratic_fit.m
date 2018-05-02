function func = quadratic_fit( x, y )
%QUADRATIC_FIT 
%   Author : Satyajit Ghana
%USAGE: quadratic_fit(xi, yi)
%   where xi and yi are the data points given 

n = length(x);
S = [x.*x; x; ones(1,n)];
A = S*S';
B = S*y';
C = A\B;

func = @(t) C(1)*t^2 + C(2)*t + C(3);

error = 0;
for k=1:length(x)
    error = error + (func(x(k))-y(k))^2;
end

func = subs(func);
disp('Qudratic fit for the gien data points is : ');
disp(vpa(func, 6))
disp('With a least square error sum as')
disp(error)

%%
plot(x,y,'r*');
hold on;
fplot(func, [(min(x)-(x(2)-x(1))) (max(x)+(x(2)-x(1)))], 'LineWidth', 1.2);
axis tight
title('$ $ Quadratic Fit for the given data points','Interpreter','latex')
legend('Data Points',char(vpa(subs(func),4)),'Location','best');

func = matlabFunction(vpa(func, 8));

end

