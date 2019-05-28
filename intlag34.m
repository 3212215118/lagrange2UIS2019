clc 
clear
%{
xo=input('Valor que desea interpolar ');
n=input('Número de puntos que desea ingresar ');
for i=1:n
    disp('');
    disp('Ingrese el punto');
    disp(i);
    X(i)=input('Ingrese el valor de X ');
    Y(i)=input('Ingrese el valor de Y ');
end
%}
%plot(X,Y,'r-+')
xo=3.5;
n=4;
X=[0.5 2 3.2 5 6 8 7];
Y=[2 3 2.7 4 5 6 8 9];
for i=1:n
    Ya(i)=Y(i)
    for j=1:n
        if j~=i;
            Ya(i)=Ya(i)*(xo-X(j))/(X(i)-X(j));
        end
    end
end
Yo=sum(Ya)
Xg=[min(X):(max(X)-min(X))/100:max(X)];
for k=1:length(Xg)
    for i=1:n
    Ya(i)=Y(i)
    for j=1:n
        if j~=i;
            Ya(i)=Ya(i)*(Xg(k)-X(j))/(X(i)-X(j));
        end
    end
    end
Yg(k)=sum(Ya);
end
plot(Xg,Yg,'p-',xo,Yo,'r*');
%plot(X,Y,'p-',xo,Yo,'r+')
title('Interpolacion de lagrange')
xlabel('Ordenadas')
ylabel('Abscisas ')
legend('Puntos iniciales','Punto interpolado')