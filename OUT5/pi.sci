n = 6
T_0 = 1.41
K = 1.1
T_i = 15.707
T_1 = 1.5

s = poly(0, 's')

exp_series = 1 - T_1 * s + (T_1 * s)^2 / 2 - (T_1 * s)^3 / 6 + (T_1 * s)^4 / 24

W_2 = exp_series / (1 + s * T_1)^n
W_1 = K * (1 + (1 / (T_i * s))) * W2

W = W1 / (1 + W1)

Sys = syslin('c', W)
h = 1
Sysd = dscr(Sys, h)

Ad = Sysd.A;
disp('Ad = ', Ad);

I = eye(Ad);

// Решение уравнения Ляпунова Ad^THAd - H = -I
// Флаг 'd' говорит о том, что система дискретная
Hd = lyap(Ad, -I, 'd');
disp('Hd = ', Hd);

hs = spec(Hd);
disp('Спектр матрицы H', hs);
if (hs > 0) then
    disp('H положительно определена. Cистема устойчива асимптотически');
    kappa = norm(hs, 2);
else
    disp('Разностное уравнение с матрицей Ad неустойчиво');
    kappa = %inf;
end
disp('kappa(Ad) = ', kappa);
