

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% we convert the drawing into an .asc file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Written by M. Svendendahl and I. Alda

dose = 100;
% 
filename = ['PhCdiel_', num2str(round(rsmod*1000)),'_gamma_', num2str(aa*100),'.asc']; %name of PhC
%filename = ['WG_grat', num2str(round(rsmod*1000)),'.asc']; %name for a waveguide
delete(filename)
 
fid = fopen(filename,'w');
fid = fclose(fid);

%we initialize fvariables
dosex = 0;
dosey = 0;
count = 0;
NX = 1;
NY = 1;

%we convert the matlab vectors into an .asc file
for c0 = 1:NX
    for c1 = 1:NY
        clc
        count = count+1;
        display([num2str(count./NX/NY*100), '% done'])
        
        % First bow in 1st grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X)
dlmwrite(filename, [num2str(X(cu)+(c0-1)*px+offx), ' ',num2str(Y(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % 2nd bow in 1st grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X2)
dlmwrite(filename, [num2str(X2(cu)+(c0-1)*px+offx), ' ',num2str(Y2(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % 3rd bow in 1st grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X3)
dlmwrite(filename, [num2str(X3(cu)+(c0-1)*px+offx), ' ',num2str(Y3(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % 4th bow in 1st grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X4)
dlmwrite(filename, [num2str(X4(cu)+(c0-1)*px+offx), ' ',num2str(Y4(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');

        % WG hole 1
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(WGX1)
dlmwrite(filename, [num2str(WGX1(cu)+(c0-1)*px+offx), ' ',num2str(WGY1(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % WG hole 2
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(WGX2)
dlmwrite(filename, [num2str(WGX2(cu)+(c0-1)*px+offx), ' ',num2str(WGY2(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1

end
dlmwrite(filename, '#', 'delimiter', '', '-append');


      %  All rectangles
        nstructures=2*mirror+cavity;
        for i=1:nstructures
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
dlmwrite(filename, [([posx(i,:)]'),([posy(i,:)]')],  'delimiter', ' ','-append'); % u1 v1
dlmwrite(filename, '#', 'delimiter', '', '-append');
        end



 % First bow in 2nd grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X)
dlmwrite(filename, [num2str(X(cu)+(c0-1)*px+offx), ' ',num2str(-Y(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % 2nd bow in 2nd grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X2)
dlmwrite(filename, [num2str(X2(cu)+(c0-1)*px+offx), ' ',num2str(-Y2(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');

        % 3rd bow in 2nd grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X3)
dlmwrite(filename, [num2str(X3(cu)+(c0-1)*px+offx), ' ',num2str(-Y3(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1

end
dlmwrite(filename, '#', 'delimiter', '', '-append');


        % 4th bow in 2nd grating:
dlmwrite(filename, ['1 ', num2str(dose+dosex*(c0-1)+dosey*(c1-1)), ' 1'], 'delimiter', '','-append'); %polygon dose  layer
for cu = 1:length(X4)
dlmwrite(filename, [num2str(X4(cu)+(c0-1)*px+offx), ' ',num2str(-Y4(cu)+(c1-1)*py+offy)],  'delimiter', '','-append'); % u1 v1
end
dlmwrite(filename, '#', 'delimiter', '', '-append');

    end
end


