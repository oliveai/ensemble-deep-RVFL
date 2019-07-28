function out=edRVFLtest(input,net)
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
%         out=edRVFLtest(input, net)
%        % check target and y values
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                           TEST                               %
% %           Ensemble Deep Random Vector Functional Link        %
% %                       (Avaraging)                            %
% %                  Apdullah Yayik, 2019                        %
% %                  apdullahyayik@gmail.com                     %
% %                                                              %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input=normDadapt(input, net.normparameters.minn, net.normparameters.maxx);
hiddenlayeroutstest=input;
numberofhiddenlayer=size(net.hiddenlayerweights, 2)+1;
y=zeros(size(input, 1), numberofhiddenlayer-1);

for p=1:numberofhiddenlayer-1
    hiddenlayeroutstest=logsig(hiddenlayeroutstest*net.hiddenlayerweights{1,p});
    Dtest=[input, hiddenlayeroutstest];
    y=Dtest*net.outputlayerweights{1,p};
    out(:,p)=outCreate(y);
end
    out=mean(out,2); 
end

function out=outCreate(y)
% create output

outtemp=[];
for p=1:size(y,1)
    outtemp=[outtemp; y(p,:)==max(y(p,:))];
end
clear y

out=zeros(size(outtemp,1), 1);
for pp=1:size(outtemp,2)
    out=out+outtemp(:,pp)*pp;
end
end

function X=normDadapt(X, minn, maxx)
% adapt norm

sizeX=size(X);
for ii=1:sizeX(1)
    for j=1:sizeX(2)
        X(ii,j)=(((X(ii,j)-minn(j))/(maxx(j)-minn(j))))*2-1;
    end
end
end










