clc
x = [1,2];
h = [1,2,4];
m = length(x);
n = length(h);
subplot(2,2,1);
stem(x);
subplot(2,2,2);
stem(h);
X = [x, zeros(1,m)];
disp(X);
H = [h, zeros(1,n)];
disp(H);
o = m + n -1;
y = zeros(1,o);
for i = 1 : m+n-1
     y(i) = 0;
    for j = 1:m
        if(i-j+1)>0
            y(i)=y(i) + X(j)*H(i-j+1);
        else
        end
    end
end
subplot(2,2,3);
stem(y);
disp(y);


