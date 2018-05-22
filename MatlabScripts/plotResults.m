M = csvread('OnlyDropReg.csv',1);
N = csvread('NoDropReg.csv',2);
K = csvread('Par_T4000_V1000_D2048_L165_B32_Drop0_5_KReg0_25_Lr0_01_minLr1e-09_logs.csv',1);
L = csvread('Rotation.csv',1);

for i = 2:5 
M(:,i) = smooth(M(:,i),10);
N(:,i) = smooth(N(:,i),10);
K(:,i) = smooth(K(:,i),10);
L(:,i) = smooth(L(:,i),10);
end
epochs = 100;%(M(end,1));
plot_title = 'Experimental Result: no regularization, dropout or augmentation';
% plot_title = 'Experimental Result: regularization and dropout only';
% plot_title = 'Experimental Result: regularization, dropout and rotation';
% plot_title = 'Experimental Result: regularization, dropout and zoom';
% plot_title = 'Experimental Result: regularization, dropout and shear';
% plot_title = 'Experimental Result: regularization, dropout and shift';
% plot_title = 'Experimental Result: regularization, dropout and color';
% plot_title = 'Experimental Result: regularization, dropout and brightness/darkness';

xpoint = 55;

figure(50);clf;
subplot(311);
plot(M(:,1),M(:,[3 5]),'LineWidth',1.5); title(plot_title); 
xlabel('Epochs [N]'); ylabel('Accuracy'); grid minor;  xlim([1 epochs]); ylim([0.8 1.025]); %min(min(M(:,[3 5])))*0.9
% legend('Training','Validation','location','SouthEast');
hold on;
% plot(N(:,1),N(:,[3 5]),'LineWidth',1.5);
plot(L(:,1),L(:,[3 5]),'LineWidth',1.5);
plot(K(:,1),K(:,[3 5]),'LineWidth',1.5);
plot(xpoint,M(xpoint,5),'rx','markersize',12,'linewidth',2);
subplot(312);
plot(M(:,1),M(:,[2 4]),'LineWidth',1.5); 
xlabel('Epochs [N]'); ylabel('Loss'); grid minor;  xlim([1 epochs]);% ylim([min(min(M(:,[2 4])))*0.9 max(max(M(:,[2 4])))*1.1]);
% legend('Training','Validation'); 
hold on;
% plot(N(:,1),N(:,[2 4]),'LineWidth',1.5); 
plot(L(:,1),L(:,[2 4]),'LineWidth',1.5); 
plot(K(:,1),K(:,[2 4]),'LineWidth',1.5); 
plot(xpoint,M(xpoint,4),'rx','markersize',12,'linewidth',2);
subplot(313);
stairs(M(:,1),M(:,6),'LineWidth',1.5); 
xlabel('Epochs [N]'); ylabel('Learning Rate'); grid minor; xlim([1 epochs]); ylim([min(M(:,6))*0.75 max(M(:,6))*1.1]);
legend('Training & Validation');    