function func = exponential_fit( x, y )
%EXPONENTIAL_FIT
%   Author : Satyajit Ghana
%USAGE: exponential_fit(xi, yi)
%   where xi and yi are the data points given 

n = length(x);
Y = log(y);
S = [x; ones(1,n)];

A = S*S';
B = S*Y';
D = A\B;

func = @(t) exp(D(1)*t+D(2));

error = 0;
for k=1:length(x)
    error = error + (func(x(k))-y(k))^2;
end

func = subs(func);
disp('Exponential fit for the gien data points is : ');
disp(vpa(func,6));
disp('With a least square error sum as')
disp(error)

%%
plot(x, y, 'r*');
hold on;
fplot(func, [(min(x)-(x(2)-x(1))) (max(x)+(x(2)-x(1)))],'LineWidth',1.2);
axis tight
title('$ $ Exponential Curve fit for the given data points','Interpreter','latex');
legend('Data Points',char(vpa(func, 4)),'Location','best');

func = matlabFunction(vpa(func, 8));

end

