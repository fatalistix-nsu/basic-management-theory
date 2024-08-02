// prepare data
X = [0, 1:0.5:5]
Y = [12 10.1 11.58 17.4 30.68 53.6 87.78 136.9 202.5 287]
Data = [X ; Y]
// function which parameters we are using for
function y=FF(x, p)
y = p(1)*x^3+p(2)*x^2+p(3)
endfunction
// error function - actual values sub counted
function e=G(p, Data)
e = Data(2,:) - FF(Data(1,:), p)
endfunction
// start weights
p0 = [1;1;1]
// fited weights and low squares error (all counted by datafit func)
[p, dmin] = datafit(G, Data, p0)

// function for making interpolated plot
function y=FF_int(x, p)
y = p(1) * x .* x .* x + p(2) * x .* x + p(3)
endfunction

// prepearing plot
x_int = -10:0.1:10
y_int = FF_int(x_int, p)
// showing plot
plot(x_int, y_int)

// linear regression
[a, b] = reglin(X, Y)
plot(x_int, a*x_int+b, "red")
