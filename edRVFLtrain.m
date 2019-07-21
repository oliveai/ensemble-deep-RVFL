function net= edRVFLtrain(input, target, structure)
% edRVFLtrain: Ensenmbled Deep Random Vector Functional Link training function
%
%Output Parameters
%         net: structure that includes network parameters.
%         structure, numberofhiddenlayer, hiddenlayerweights,
%         hiddenlayerout, D, outputlayerweights
%
%Input Parameters
%         input: input data (each row represent different observations)
%         target: desired outputs
%         structure: hidden layer neuron numbers (exept first and last layers), for instance: [5, 10, 15, 20]
%         enhancementnodesneuronnumber: number of enhacement nodes (specific to RVFL nets)
%
% Example Usage
%         input=rand(3,5);
%         target=rand(3,1);
%         net=edRVFLtrain(input, target, [5,5,5])
%             
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                           TRAIN                              %
% %          Ensembled Deep Random Vector Functional Link        %
% %                                                              %
% %                    Apdullah Yayik, 2019                      %
% %                    apdullahyayik@gmail.com                   %
% %                                                              %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if isequal(size(target,1), size(input,1))==0
    error('Error: input and target sizes dismatch')
else
    
    structure=[size(input, 2), structure, size(target,1)];
    numberofhiddenlayer=size(structure, 2);
    hiddenlayerouts=input;
    net.hiddenlayerweights=cell(1,numberofhiddenlayer-1);

    
    for p=1:numberofhiddenlayer-1
        net.hiddenlayerweights{1,p}=rand(structure(p),structure(p+1));
        hiddenlayerouts=logsig(hiddenlayerouts*net.hiddenlayerweights{1,p});      
        D=[input, hiddenlayerouts];
        net.outputlayerweights{1,p}=pinv(D)*target;        
    end
    
end

% Adjustable parameters and functions--> random range, deep and structure of network, inverse function,
% transfer function
    
    
    
    
    
 
