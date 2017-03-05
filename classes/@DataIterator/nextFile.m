function [obj, signal_out] = nextFile(obj)
    if(obj.files_iterated_  == obj.size_)
       dsip('nextFile:: all files have benn iterated. reseting DataIterator');
       obj.reset();
    end
    
    fName = textscan(obj.current_file_.name,'%s', 'delimiter','.mat');
    filename = fullfile(obj.path_,fName{:}{1});
    [tm,ecg,fs,siginfo]=rdmat(filename);
    ecg = {ecg};tm = {reshape(tm,[],1)};siginfo = {siginfo};
    signal_out = table(tm,ecg,fs,siginfo,'RowNames',{fName{:}{1}});
    
    % update index
    obj.file_list_(1) = [];
    obj.current_file_ = obj.file_list_(1);
    obj.files_iterated_ = obj.files_iterated_ + 1;
end