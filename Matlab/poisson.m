%Se realiza un estudio para oberservar la probabiliad de tener un 
%accidente de traficocon una p de 0.02
%en 300 vaijes ,¿Cual es la probabilidad en 3 viajes
x=3;
p=0.02;
n=300;
Probabilidad=graficar((p*n),2)*100;
disp(Probabilidad);
function y_x= graficar(lambda,x)
    % Definir el rango de valores de x (número de eventos)
    rango_max = max(x, 15 * lambda); %alor entre x y un a constante 15*lambda
    rango = 0:1:rango_max;
    % Calcular la función de probabilidad para cada valor de x
    y = poisspdf(rango, lambda);
    % Graficar la distribución de Poisson
    plot(rango,y,'-b')
    hold on
    y_x=poisspdf(x,lambda);
    plot(x, y_x, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    title(sprintf('Distribución de Poisson con \\lambda = (%.3f)',lambda));
    xlabel('Número de eventos (x)');
    ylabel('Probabilidad P(X=x)');
end 
