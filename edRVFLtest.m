function y=edRVFLtest(input,net)
% dRVFLtest: Ensemble Deep Random Vector Functional Link (Avaraging) testing function
%
%Output Parameters
%         y: actul avaraged output
%
%Input Parameters
%         net: structure that includes network parameters.
%         structure, numberofhiddenlayer, hiddenlayerweights,
%         hiddenlayerout, D, outputlayerweights
%
% Example Usage
%         input=rand(3,5);
%         target=rand(3,1);
%         net=edRVFLtrain(input, target, [5,5,5])
%         y=edRVFLtest(input, net)
%        % check target and y values
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                           TEST                               %
% %           Ensemble Deep Random Vector Functional Link        %
% %                       (Avaraging)                            %
% %                  Apdullah Yayik, 2019                        %
% %                  apdullahyayik@gmail.com                     %
% %                                                              %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hiddenlayeroutstest=input;
numberofhiddenlayer=size(net.hiddenlayerweights, 2)+1;
y=zeros(size(input, 1), numberofhiddenlayer-1);


for p=1:numberofhiddenlayer-1
    hiddenlayeroutstest=logsig(hiddenlayeroutstest*net.hiddenlayerweights{1,p});
    Dtest=[input, hiddenlayeroutstest];
    y(:,p)=Dtest*net.outputlayerweights{1,p};
end
   y=mean(y,2);
end














