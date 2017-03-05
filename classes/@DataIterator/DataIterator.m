classdef DataIterator
    %Iterator class which summits the signals and parse them for further
    %analysis
    
    properties(Access = private)
        path_
        current_file_
        file_list_
        bookmark_
        files_iterated_ 
        size_ % number of files
        segment_size_
    end
    
    %% public methods
    methods (Access = public)
        function [obj] = DataIterator( folder)
            obj.path_ = folder;
            current_folder = pwd;
            cd(folder);
            obj.file_list_ =  dir('*.mat');
            obj.size_ = numel(obj.file_list_);
            obj.bookmark_ = 1;
            obj.current_file_ = obj.file_list_(1);
            obj.files_iterated_ = 0;
            cd(current_folder);
        end
            
        [ obj, out ] = nextFile(obj);
        
        [] = nextSegment(obj)
   
    end
    
    %% private methods
   
   methods (Access = private)
        
       function [obj] = reset(obj)
            obj = DataIterator(obj,obj.path_);
        end
    end
    
end

