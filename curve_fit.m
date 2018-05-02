function [  ] = curve_fit( x, y )
%CURVE_FIT Summary of this function goes here
%   Detailed explanation goes here
filename = 'test.gif';
h = figure;
plot(x,y,'r*');
hold on;
for i = 1:1:20
    syms t;
    S = polyfit(x, y, i);
    func_handle = @(t) 0;
    for j = 1:1:length(S)
        func_handle = func_handle + t^(length(S)-j)*S(j);
    end
    disp(strcat(int2str(i),' th order fit'));
    disp(S);
    %func_handle = matlabFunction(func);
    fplot(func_handle, [min(x) max(x)]);
    disp(func_handle)
    %figure(fig);
    %getframe;
    drawnow
    frame = getframe(h);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
    %figure;
    %hold on;
end
%imshow(F);
end

