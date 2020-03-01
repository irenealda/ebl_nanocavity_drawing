%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We draw rectangles for dielectric mode nanocavity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Written by I. Alda

clc

%size of rectangular holes
beta=1; %correction factor for holes
recw=beta*0.7*(0.7/0.723)*(0.7/0.726); %rectangle width and its correction
rech=beta*0.2*(0.2/0.277)*(0.202/0.263)*(0.218/0.188); %rectangle height and its correction

%number of unit cells of the mirror and the cavity
mirror=20;
cavity=11;
defect=mirror+(cavity-1)/2+1;
nstructures= 2*mirror + cavity;
wrec= recw*ones(1,nstructures);

%initialize rectangles and position
r=zeros(nstructures,1);
pos=zeros(nstructures,4);
yy=zeros(nstructures,1);
posy=zeros(nstructures,5);
fcavity=zeros(cavity,1);

%unit cell variations and adjustments
cf= (1525/1606)*(1530/1557)*(1550/1560)*(1540/1570); %correction factor
per= 1; %percentage of variation
gamma=cf*per; %correcting factor

%Adjusting the cuadratic apodization
Lambda = 0.68*gamma;
Lambda0 = 0.6346*gamma;

%length of structure area + how do I choose where to start the first mirror
m=1:cavity;
Lambdaa= Lambda0+0.01*(Lambda-Lambda0)*(m-(cavity+1)/2).^2;
Delta =0.01*(Lambda-Lambda0)*(m-(cavity+1)/2).^2;
lstructures=2*mirror*Lambda+sum(Lambdaa);
lengthwg = 38;
deltastart= (lengthwg-lstructures)/2;

%first position of the mirror 
pxstart=25-0.5*recw;
pos(1,:)= [pxstart 6+deltastart+recw wrec(1) rech];
%the 4 vertices of the square
posx= [pos(1,1) pos(1,1)+recw pos(1,1)+wrec(1) pos(1,1) pos(1,1)];
posy(1,:) = [pos(1,2) pos(1,2) pos(1,2)+rech pos(1,2)+rech pos(1,2)];


%first set of mirrors
for j=2:mirror
    pos(j,:) = [pos(1,1) pos(1,2)+Lambda*(j-1) wrec(j) rech ]; %draws the rectangles in this code
    posx(j,:) = posx(1,:); %position x for the .asc file
    yy(j)=pos(1,2)+Lambda*(j-1);
    posy(j,:)= [yy(j) yy(j) yy(j)+rech yy(j)+rech yy(j)]; % position y for the .asc file
end

%cavity
for jj=mirror+1:mirror+cavity
    %fcavity (jj) = (2/(cavity+1))^2*(Lambda-Lambda0)*(jj-defect)^2;
    fcavity (jj) = 0.01*(Lambda-Lambda0)*(jj-defect)^2;
    yy(jj)=pos(mirror,2)+Lambda0*(jj-mirror)+fcavity(jj);
    pos(jj,:) = [pos(1,1)+abs(recw-wrec(jj))/2 pos(mirror,2)+Lambda0*(jj-mirror)+fcavity(jj) wrec(jj) rech ];
    posx(jj,:) = [pos(1,1)+abs(recw-wrec(jj))/2 pos(1,1)+abs(recw-wrec(jj))/2+wrec(jj) pos(1,1)+abs(recw-wrec(jj))/2+wrec(jj) pos(1,1)+abs(recw-wrec(jj))/2 pos(1,1)+abs(recw-wrec(jj))/2];
    posy(jj,:) = [yy(jj) yy(jj) yy(jj)+rech yy(jj)+rech yy(jj)];
   
end

% %ending set of mirrors
for jjj=mirror+1+cavity:2*mirror+cavity
    yy(jjj) = pos(mirror+cavity,2)+Lambda*(jjj-(mirror+cavity));
    pos(jjj,:) = [pos(1,1) pos(mirror+cavity,2)+Lambda*(jjj-(mirror+cavity)) wrec(jjj) rech];
    posx(jjj,:) = posx(1,:);
    posy(jjj,:) = [yy(jjj) yy(jjj) yy(jjj)+rech yy(jjj)+rech yy(jjj)];
end

%draw the rectangles
for i=1:nstructures;
    r(i)=rectangle('Position', pos (i,:));
end
