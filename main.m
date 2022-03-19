clear all;clc

path='G:\code\dataset\';
j=1;
for Atoms = 100
    fprintf('%d:   \n',j);
    
    for i = 1 : 10
       fprintf('第 %d 组数据： \n',i);
       load(strcat(path,'prid2011\gog',num2str(i),'.mat'));%%载入数据集数据.mat文件
       
       
%% parameter setting
pars.alpha1 = 17;
pars.alpha2 = 9;
pars.Persons = size(Xa_train,1);
pars.Dimensions = size(Xa_train,2);
pars.Atoms = Atoms;
pars.Atoms_t = 760;
pars.Noises = size(Xb_test,1);


%% data preparation
Xa = Xa_train';
Xb = Xb_train';
Xa1 = Xa_test';
Xb1 = Xb_test';

%% training the model
[D] = train (Xa,Xb,pars);

%% testing the model
[Sa, Sb] = test(Xa1,Xb1,D,pars);
rank = sim_match1(Sa, Sb);

%% show accuracy
aaa(i,:) = rank(:,1);
fprintf('  Rank1,   Rank5,   Rank10,  Rank20\n');
fprintf('  %5.2f%%,  %5.2f%%,  %5.2f%%,  %5.2f%%\n\n',rank([1,  5,  10,  20]));
fprintf('\n\n');
    end
AVE(j,:) = mean(aaa,1);
fprintf('平均识别性能: \n ');
fprintf('Rank1,  Rank5,  Rank10,  Rank20\n' );
fprintf('%5.2f%%, %5.2f%%, %5.2f%%, %5.2f%%\n\n', AVE(j,[1,5,10,20]));
j=j+1;
end