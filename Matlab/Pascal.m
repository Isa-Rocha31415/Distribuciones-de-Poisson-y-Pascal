r = 3;          % Número de éxitos
p = 1/6;        % Probabilidad de éxito en cada ensayo
x = 7;          % Número de fracasos
%: Un dado se lanza repetidamente. ¿Cuál es la probabilidad de que se 
%necesiten 10 lanzamientos para obtener 3 "6"s
% Calcular la probabilidad
Probab=BinomialNegativa(r,p,x)
disp(Probab);
function y_x = BinomialNegativa(r, p, x)
     % Definir el rango de valores de x (número de fracasos)
    rango_max = max(x, 15 * r);  % Valor máximo entre x y una constante 15*r
    rango = 0:1:rango_max;
    % Calcular la función de probabilidad binomial negativa para cada valor de x
    y = nbinpdf(rango, r, p);
    bar(rango, y, 'b'); 
    hold on;
    % Calcula la probabilidad para el valor específico de x
    y_x = nbinpdf(x, r, p);
    % Resalta el punto específico de interés (x) en rojo
    bar(x, y_x, 'r', 'FaceColor', 'r');
    title(sprintf('Distribución Binomial Negativa (Discreta) con r = %d, p = %.3f', r, p));
    xlabel('Número de fracasos (x)');
    ylabel('Probabilidad P(X=x)');
    hold off;
end
