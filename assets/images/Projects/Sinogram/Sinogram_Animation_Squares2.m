%% Sinogram animation/ demonstration script
% This script was written rather quickly so it is fairly slow and not
% pretty, but hopefully it functions to give a clear picture of how
% projection reconstruction works. Please don't judge me on the messy code
% :)

% Eli Mattingly, July 2020

%%

clear

% CanvasSize = 187; %Pixels on the edge
CanvasSize = 200; %Pixels on the edge
AngleVec = 1:10:360; %Angles that the animation runs over
DisplayMatrix = NaN(CanvasSize,CanvasSize+1,length(AngleVec)); %Defining a matrix of NaNs, so only cells with real values are displayed
Backdrop = zeros(CanvasSize);
Square1Coords = [75+25 100+25;75+25 100+25]; %Locations of the squares in the base image
Square2Coords = [60 65; 60 65];
Square3Coords = [63 69; 85 93];
% Backdrop(Square1Coords(1,1):Square1Coords(1,2),Square1Coords(2,1):Square1Coords(2,2)) = .5;
% Backdrop(Square2Coords(1,1):Square2Coords(1,2),Square2Coords(2,1):Square2Coords(2,2)) = .5;
% Backdrop(Square3Coords(1,1):Square3Coords(1,2),Square3Coords(2,1):Square3Coords(2,2)) = .5;

Im = imread('BW_P_Letter.png'); %You can use this to run this animation over any image

Im = imresize(Im,[CanvasSize CanvasSize]);
Backdrop = Im(:,:,1);
NormalizeFac = max(sum(Backdrop))/cast(max(max(Backdrop)),'double'); %A nomalizing factor that takes into account the max in a projection and the max value in the base image
Count = 0;

filename = 'GIFFolder\testAnimated_TMP'; %File path to save images
WriteVideos = 1; % If this is 1, the script will write videos of the animations
%% Single Projection
Animate_Proj_Build = 1; %Logical if you want to animate the projection building
Num_Proj = 50; %Number of projections it will run over
StartPoint = 0.05; %Graphics variable: how far left in the figure will the images plot (set at 0.05=5%)
EndPoint = 0.95;
Delta = (EndPoint-StartPoint)*(Num_Proj*3+1)/(Num_Proj*3);
SegmentLength = Delta/Num_Proj;
Proj_X_Length = SegmentLength*3/4;
DeltaTheta = 180/Num_Proj;
FrameCount = 1; %The frame counter for video making
AccelFac = 20; %An acceleration factor so it doesn't take forever to build must be an integer >=1

if Animate_Proj_Build==1
    figure(3)
    clf
    Ax1 = axes('Position',[0.45 0.1 0.5 0.5]);
    set(gca,'XTick',[], 'YTick', [])
    %     imagesc(Backdrop)
    Ax2 = axes('Position',[0.05 0.1 0.25 0.5]);
    set(gca,'XTick',[], 'YTick', [])
    
    for Proj = 1:Num_Proj
        ProjAx.(['P' num2str(Proj)]) = axes('Position',[StartPoint+(Proj-1)*SegmentLength,0.7,Proj_X_Length,0.25]);
        
        set(gca,'XTick',[], 'YTick', [])
    end

    Names = fieldnames(ProjAx);
    axes(Ax1)
    for tmp = 1:Num_Proj
        Proj_Readout(:,tmp) = sum(imrotate(Backdrop,DeltaTheta*(tmp-1),'crop'),2); %Each "Readout" of a projection is the integral of the signal along the line
    end
    Count = 1;
    for P = 1:Num_Proj
        for k = 1:AccelFac:CanvasSize
            axes(Ax1)
            cla
            imagesc(imrotate(Backdrop,(P-1)*DeltaTheta,'crop'))
            hold on
            FFL_Vec(:,1) = 0:10:CanvasSize;
            FFL_Vec(:,2) = k;
            plot(FFL_Vec(:,1),FFL_Vec(:,2),'g:','LineWidth',2)
            set(gca,'XTick',[], 'YTick', [])
            axes(Ax2)
            
            cla
            
            plot(Proj_Readout(1:k,P),CanvasSize-(1:k),'b','LineWidth',2)
            ylim([0 CanvasSize])
            xlim([0 max(max(Proj_Readout))])
            set(gca,'XTick',[], 'YTick', [])
            Proj_Readout_TMP = zeros(size(Proj_Readout(:,1)));
            Proj_Readout_TMP(1:k) = Proj_Readout(1:k,P);
            axes(ProjAx.(Names{P}))
            imagesc(Proj_Readout_TMP)
            caxis([0 max(max(Proj_Readout))])
            set(gca,'XTick',[], 'YTick', [])
            if mod(Count,1)==0
                frame_1(FrameCount) = getframe(gcf);
                FrameCount = FrameCount+1;
            end
            Count = Count+1;
        end
                axes(ProjAx.(Names{P}))
                imagesc(Proj_Readout(:,P))
        set(gca,'XTick',[], 'YTick', [])
    end
    if WriteVideos==1
        v = VideoWriter('P_Letter_Proj_Build_3','MPEG-4');
        open(v)
        writeVideo(v,frame_1)
        close(v)
    end
end
%%
figure(4)
Ax1 = axes('Position',[0.45 0.1 0.5 0.5]);

Ax2 = axes('Position',[0.05 0.1 0.25 0.5]);

Count = 1;
for Proj = 1:Num_Proj
    ProjAx.(['P' num2str(Proj)]) = axes('Position',[StartPoint+(Proj-1)*SegmentLength,0.7,Proj_X_Length,0.25]);
    imagesc(Proj_Readout(:,Proj))
    set(gca,'XTick',[], 'YTick', [])
    caxis([0 max(max(Proj_Readout))])
end
Names = fieldnames(ProjAx);
axes(Ax1)
set(gca,'XTick',[], 'YTick', [])
Recon_Image = zeros([size(Backdrop),Num_Proj]);
imagesc(sum(Recon_Image,3))
for JJ = 1:Num_Proj
    Recon_Image(:,:,JJ) = repmat(Proj_Readout(:,JJ),1,CanvasSize);
    Recon_Image = imrotate(Recon_Image,DeltaTheta,'crop');
end
MaxVal = max(max(sum(Recon_Image,3)/Num_Proj));
Recon_Image = zeros([size(Backdrop),Num_Proj]);
for P = 1:Num_Proj
    axes(ProjAx.(Names{P}))
    imagesc(zeros(size(Proj_Readout(:,1))))
    caxis([0 1])
    set(gca,'XTick',[], 'YTick', [])
    axes(Ax2)
    imagesc(Proj_Readout(:,P))
    set(gca,'XTick',[], 'YTick', [])
    for k = 1:CanvasSize
        axes(Ax1)
        cla
        
%         Recon_Image(:,k:k+AccelFac-1,P) = repmat(Proj_Readout(:,P),1,AccelFac);
          Recon_Image(:,k,P) = Proj_Readout(:,P);

        imagesc(sum(Recon_Image,3)./P)
        caxis([0 MaxVal])
        set(gca,'XTick',[], 'YTick', [])
%         if mod(Count,2)==0
            frame_1(Count) = getframe(gcf);
            Count = Count+1;
%         end
    end
    Recon_Image = imrotate(Recon_Image,DeltaTheta,'crop');
    
end

if WriteVideos==1
    v = VideoWriter('P_Letter_Proj_Recon_2','MPEG-4');
    open(v)
    writeVideo(v,frame_1)
    close(v)
end

%% All projections
for i = AngleVec
    Count = Count+1;
    figure(1)
    %    subplot(1,2,2),imagesc(imrotate(Backdrop,i,'crop'))
    Sinogram(:,Count)=((sum(imrotate(Backdrop,i+90,'crop')))')/NormalizeFac;
    pause(.001)
    DisplayMatrix(:,1,1:Count) = fliplr(Sinogram);
    DisplayMatrix(:,2,1:Count) = fliplr(Sinogram);
    DisplayMatrix(:,2:end,1) = imrotate(Backdrop,i,'crop');
    DisplayMatrix(:,2,1:Count) = fliplr(Sinogram);
    h = slice(DisplayMatrix,1,1,1,'Nearest');
    set(h,'edgecolor','none')
    view(48,25)
    axis equal
    frame(Count) = getframe(gcf);
    
end
if WriteVideos==1
    v = VideoWriter('Test4');
    open(v)
    writeVideo(v,frame)
    close(v)
end
clf
ReconBase =zeros(size(Backdrop));
Count = 0;





%% Reconstruction
for j = 1:length(AngleVec)
    
    SlideSin(:,:,j) = repmat(Sinogram(:,j),1,CanvasSize);
    
    SlidSin_Rot(:,:,j) = imrotate(SlideSin(:,:,j),AngleVec(j),'crop');
    SubAngleVec = AngleVec(end-j+1:end);
    figure(1)
    
    Recon = iradon(fliplr(Sinogram(:,end+1-j:end)),SubAngleVec);
    ReconTmp =ReconBase;
    LengthDiff = round((CanvasSize-size(Recon,1))/2);
    
    pause(.001)
    DisplayMatrix(:,1,1:length(AngleVec)-j+1) = (Sinogram(:,j:end));
    if j>1
        DisplayMatrix(:,1,length(AngleVec)-j+2:end) = NaN*(Sinogram(:,end+2-j:end));
    end
    DisplayMatrix(:,2,1:length(AngleVec)-j+1) = (Sinogram(:,j:end));
    if j>1
        DisplayMatrix(:,2,length(AngleVec)-j+2:end) = NaN*(Sinogram(:,end+2-j:end));
    end
    DisplayMatrix(:,2:end,1) = imrotate(sum(SlidSin_Rot,3),-AngleVec(j),'crop')/max(max(sum(SlidSin_Rot,3)))*max(max(Sinogram));
    h = slice(DisplayMatrix,2,1,1,'Nearest');
    set(h,'edgecolor','none')
    view(48,25)
    axis equal
    frame(j) = getframe(gcf);
    
    
    
end


if WriteVideos==1
    v = VideoWriter('Recon_5');
    open(v)
    writeVideo(v,frame)
    close(v)
end