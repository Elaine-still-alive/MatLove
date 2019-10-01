x=2.5;
b=0.04;
k=3;
n=5;
y=1/9-power(10,-4)*exp(x*k)+cos(sqrt(power(x,2)+b))+(sqrt(power(x,2)+b)/0.4*x)+sin(3)/(n*(power(x,2)+b));
a = [x,b,k,n,y];
a = sort(a, 'descend');
a(end) = sum(a) + a(end)
