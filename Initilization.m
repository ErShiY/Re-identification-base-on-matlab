function [ D,Sa,Sb ] = Initilization( pars )
%INITILIZATION ��ʼ��
% ��Sa,Sb��Dһ�������ʼֵ�ȶ�
% ����ϵ��D,100*128
% �ֵ�D��124*100
    randn('seed',100);
    [ Sa ]    = randn(pars.Atoms, pars.Persons); % D,100*125     
    randn('seed',400);
    [ Sb ]   = randn(pars.Atoms, pars.Persons); % D,100*125
    randn('seed',200); 
    [ D ]    = randn(pars.Dimensions, pars.Atoms); % D,124*100   

