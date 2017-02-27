function tbl_out = readSignalTable(tbl_ind)
%  function specific for reading a table form a particulr path according to
%  the input index and path

tbl_out = table();
N = size(tbl_ind ,1);
for k = 1:N
    record_name = cell2mat(tbl_ind.Var1(k));
    [tm,ecg,fs,siginfo]=rdmat(record_name);
    ecg = {ecg};tm = {reshape(tm,[],1)};siginfo = {siginfo};
    tbl_itr = table(tm,ecg,fs,siginfo,'RowNames',{record_name});
    tbl_out = [tbl_out; tbl_itr];
end

end
