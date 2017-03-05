%% noisy_data_exploration
%  here we try to find patterns that differs noisy recordings from quality
%  data

rng(373737);
%  constants
% trainRatio = 0.6; testRatio= 0.2; valRatio = 0.2;
%% read csv_map and load train data

currFolder = pwd;
addpath(genpath(currFolder)); % add all to path
cpath = fullfile(currFolder,'data/training2017/');
indx_tbl = readtable([cpath,'REFERENCE.csv'],'ReadVariableNames',false); 
tbl_ind_noise = indx_tbl(cell2mat(indx_tbl.Var2) == '~',:);
tbl_ind_ok = indx_tbl(cell2mat(indx_tbl.Var2) ~= '~',:);
N_noise = size(tbl_ind_noise ,1); N_ok = size(tbl_ind_ok ,1);

% read noisy
tbl_noise = readSignalTable(tbl_ind_noise);
tbl_ok = readSignalTable(tbl_ind_ok);

%% Some exploration
%  plot some examples

figure(1);plotSignal( tbl_noise, randi(N_noise,1));
figure(2);plotSignal( tbl_ok, randi(N_ok,1));

%  possible direction for noisy observation cleaning:
% 1.
% attention mechanism for fixed signal truncation, check for very high frequencies,
% divide to segments and check for the covariance,number of 'wild' peaks per 10 sec,
% kernel shape with blind
% deconv, conditional proboilty of values after peak
% 2. 
% train a simple binary 1D CNN for this noisy classification: run the
% network on every 5 sec segment of the data and use the median prediction
% as the signal class

%% test iterator

train_iterator = DataIterator( cpath );
[train_iterator ,sig] = train_iterator.nextFile();disp(sig)


