function [ ] = plotSignal( tbl, entry_ind)
% plots the entry of the table in the current axes
error_id = 'plotSignal::';
if(entry_ind > size(tbl,1))
    error([error_id,'index out of table''s dimensions']);
end

vname = @(x) inputname(1);
s_entry = tbl(entry_ind,:);
time = s_entry.tm{:}; sig = s_entry.ecg{:};
plot(time,sig);
axis tight;
title(['ECG signal num ',num2str(entry_ind),' table - ', vname(tbl)]);
xlabel('time [sec]');
ylabel('ECG signal')
end

