classdef FeatureGenerator
    % FeatureGenerator class; creates features and provides segments from current signal
    
    properties
        feature_names
    end
    
    methods
        function [obj] = FeatureGenerator(feat_names_)
            pharsed_feat_ = textscan(feat_names_,'%s','delimiter',{';'},'TreatAsEmpty',{' '});;
            obj.feature_names = pharsed_feat_{:};
        end
        
        [output] = generateData(obj, input);
    end
    
end

