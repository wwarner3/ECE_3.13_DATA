clc, clear, close all; 


%Ace_to_Ele_DATA = readmatrix("3.13_Sustainable_energy_for_all.xltx");

%Countries = readtable("3.13_Sustainable_energy_for_all.xltx", "Range", [5 1 230 1 ]);

Year19_sorted = readmatrix("3.13_SUS.xlsx","Range",[5 2 230 2]);
Year20_sorted = readmatrix("3.13_SUS.xlsx","Range",[5 3 230 3]);
Urban_sorted = readmatrix("3.13_SUS.xlsx","Range", [5 4 230 4]);
Rural_sorted = readmatrix("3.13_SUS.xlsx","Range", [5 5 230 5]);
Clean_tech00 = readmatrix("3.13_SUS.xlsx","Range", [5 6 230 6]);
Clean_tech16 = readmatrix("3.13_SUS.xlsx","Range", [5 7 230 7]);

%F_z(isnan(F_z)) = [];
Year19_sorted(isnan(Year19_sorted)) = [];
Year20_sorted(isnan(Year20_sorted)) = [];
Urban_sorted(isnan(Urban_sorted)) = [];
Rural_sorted(isnan(Rural_sorted)) = [];
Clean_tech00(isnan(Clean_tech00)) = [];
Clean_tech16(isnan(Clean_tech16)) = [];

figure(1);
tiledlayout(3,1);
% Top graph
nexttile
plot(Year19_sorted);
hold on 
plot(Year20_sorted);
hold off 
xlabel("Countries");
ylabel("% of population");
title("Access to electricity");
legend('2019','2020');

% Middle Graph 
nexttile
plot(Urban_sorted);
hold on
plot(Rural_sorted);
hold off
xlabel("Countries");
ylabel("% of population");
title("Access to electricity in 2019: Urban vs. Rural");
legend('Urban Polpulation','Rural Polulation');

% Bottom Graph
nexttile
plot(Clean_tech00);
hold on 
plot(Clean_tech16);
hold off 
xlabel("Countries");
ylabel("% of population");
title("Access to clean fuels and technologies for cooking");
legend('2000','2016');

figure(2);
tiledlayout(3,1);
% Top graph fig.2
nexttile
G_X = categorical({'Max','Min','Mean','Std','Mean Gradient'});
G_X = reordercats(G_X,{'Max','Min','Mean','Std','Mean Gradient'});
G_Y = [max(Year19_sorted) max(Year20_sorted); min(Year19_sorted) min(Year20_sorted); mean(Year19_sorted) mean(Year20_sorted); std(Year19_sorted) std(Year20_sorted); mean(gradient(Year19_sorted)) mean(gradient(Year20_sorted))];
bar(G_X,G_Y);
title("Access to electricity");
ylabel("% of population")
legend('2019','2020');

%middle Graph fig.2
nexttile
B_X = categorical({'Max','Min','Mean','Std','Mean Gradient'});
B_X = reordercats(B_X,{'Max','Min','Mean','Std','Mean Gradient'});
B_Y = [max(Urban_sorted) max(Rural_sorted); min(Urban_sorted) min(Rural_sorted); mean(Urban_sorted) mean(Rural_sorted); std(Urban_sorted) std(Rural_sorted); mean(gradient(Urban_sorted)) mean(gradient(Rural_sorted))];
bar(B_X,B_Y);
ylabel("% of population");
title("Access to electricity in 2019: Urban vs. Rural");
legend('Urban Polpulation','Rural Polulation');


% Bottom Graph fig.2
nexttile
C_X = categorical({'Max','Min','Mean','Std','Mean Gradient'});
C_X = reordercats(C_X,{'Max','Min','Mean','Std','Mean Gradient'});
C_Y = [max(Clean_tech00 ) max(Clean_tech16); min(Clean_tech00 ) min(Clean_tech16); mean(Clean_tech00 ) mean(Clean_tech16); std(Clean_tech00) std(Clean_tech16); mean(gradient(Clean_tech00 )) mean(gradient(Clean_tech16))];
bar(C_X,C_Y);
ylabel("% of population");
title("Access to clean fuels and technologies for cooking");
legend('2000','2016');
