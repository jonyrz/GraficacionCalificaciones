%{
Practicas= xlsread('calificaciones.xlsx','B2:B10');
Teoria = xlsread('calificaciones.xlsx','C2:C10');
Participacion = xlsread('calificaciones.xlsx','D2:D10');
[~,Nombre]  = xlsread('calificaciones.xlsx','A2:A10');
CalifFinales = ((Practicas .* .30)+(Teoria .* .60)+(Participacion .* .10));

filename = 'calificación_final.xls';
T = table(Nombre,CalifFinales);
writetable(T,filename,'Sheet',1,'Range','A1')

figure(1)
grid
plot(Practicas)
hold on
plot(Teoria)
hold on
plot(Participacion)
hold on 
plot(CalifFinales)
legend('Practicas','Teoria','Participacion','CalifFinales')
xlabel('Alumnos')
ylabel('Calificacion')
title('Calificaciones Finales')
%%
r = randi(10,1,50);
m = sum(r)/50;
Sumatoria = 0;
for i = 1:50
    C = (r(i)-m)^2;
    Sumatoria = C + Sumatoria;
    VS(i) = Sumatoria ;
end
Sumatoria;
DesviacionEstandar = sqrt((1/4)*Sumatoria);
DEM = sqrt((1/4).*VS);

figure(2)
subplot(1,2,1);
plot(r)
xlabel('Elementos')
ylabel('Valor del Elemento')
title('Vector R')

subplot(1,2,2)
plot(DEM)
xlabel('Desviacion Estandar por Elemento')
ylabel('Valor de Desviacion Estandar')
title('Desviacion Estandar')
%}
%%
gravedad = xlsread('gravedad.xlsx','B2:B12');
[~,Planetas]  = xlsread('gravedad.xlsx','A2:A12');
gravedad = gravedad';
filename = 'masas.txt';
T = readtable(filename,'Format','%s %f');
masa = T.Var2;
Nombres = T.Var1;
peso = mg_N(masa,gravedad);


for i = 1:10
    figure(i+2)
    plot(peso(i,1:11))
    xlabel('Planeta')
    ylabel('Peso')
    title(Nombres(i))
end


Y = [4,1:11; 9,1:11; 6,1:11];
X = [Planetas'];
c = categorical({'valvula','elefante','torno'});
figure(13)
barh(c,Y)
set(gca,'XtickLabel',X);
xlabel('Planetas')
ylabel('Objetos')
title('Peso en Planetas')


