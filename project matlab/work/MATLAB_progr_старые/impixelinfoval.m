function huic = impixelinfoval(parent,himage)
%IMPIXELINFOVAL Pixel information tool without the text label.
%   HTEXT = IMPIXELINFOVAL(HPARENT,HIMAGE) creates a pixel information tool in
%   HPARENT that provides information about the pixels in the image specified by
%   HIMAGE. HPARENT is a handle to a figure or uipanel object.  HIMAGE can be a
%   handle to an image or an array of image handles.
%
%   The pixel information tool displays information about the pixel in an image
%   that the cursor is positioned over. The tool displays pixel information for
%   all the images in a figure.
%
%   When created with IMPIXELINFO, the tool is a uipanel object, positioned in
%   the lower-left corner of the figure, that contains the text label "Pixel
%   Info:" followed by the the x and y coordinates of the pixel and its
%   value. When created with IMPIXELINFOVAL, the tool is a uicontrol object
%   positioned in the lower-left corner of the figure, that displays the pixel
%   information without the text label.
%
%   The pixel information provided varies, depending on the image type. See
%   IMPIXELINFO for more information.
%
%   Note
%   ----    
%   To copy the pixel information string to the clipboard, right-click while the
%   cursor is positioned over a pixel. In the context menu, choose Copy pixel
%   info.
%
%   Example
%   -------
%       ankle = dicomread('CT-MONO2-16-ankle.dcm');
%       h = imshow(ankle,[]);
%       hText= impixelinfoval(gcf,h);
%       set(hText,'FontWeight','bold')
%       set(hText,'FontSize',10)
%
%   See also IMPIXELINFO.

%   Copyright 1993-2004 The MathWorks, Inc.
%   $Revision.3 $  $Date: 2004/08/10 01:49:13 $

global ZMIN DZX %%%%% переставили в начало программы

iptcheckhandle(parent,{'figure','uipanel','uicontainer'},mfilename, ...
   'HPARENT',1);
checkImageHandleArray(himage,mfilename);

[himage,axesHandles,hFig] = imhandles(himage);

huic = uicontrol('Parent',parent,...
   'Style','text',...
   'Units','pixels',...
   'HorizontalAlignment','left',...
   'BusyAction','queue',...
   'enable', 'inactive',...
   'Interruptible','off',...
   'Visible','off');
setChildColorToMatchParent(huic,parent);

% declare so they will have scope in nested functions
imageModels = getimagemodel(himage);
xystring = '(X, Y)';
spacestring = '  ';
stringForMultipleImages = 'Pixel Value';

% create Context menu
cmenu = uicontextmenu('Parent', hFig);
set(himage, 'UIContextMenu', cmenu);
menuItemHandle = uimenu(cmenu,...
   'Label','Copy pixel info', ...
   'Callback',@copyPixInfoToClipboard');

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   function copyPixInfoToClipboard(obj,eventdata)

      clipboard('copy', pixelString);
   end

callbackID = iptaddcallback(hFig,'WindowButtonMotionFcn', @displayPixelInfo);
set(huic,'DeleteFcn',@removeCallback);

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   function removeCallback(obj,eventData)

      iptremovecallback(hFig,'WindowButtonMotionFcn',callbackID);
      if ishandle(cmenu)
         delete(cmenu);
      end
      if ishandle(menuItemHandle)
         delete(menuItemHandle);
      end
   end

reactToImageChangesInFig(himage,@deleteFcn);

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   function deleteFcn(obj,eventData)

      if ishandle(huic)
         delete(huic);
      end
   end


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   function displayPixelInfo(obj,eventdata)

      axesCurPt = get(axesHandles,{'CurrentPoint'});
      overAnImage = false;
      him = [];
      im = [];

      % determine which image the cursor is over.
      for k = 1:length(axesHandles)
         pt = axesCurPt{k};
         x = pt(1,1);
         y = pt(1,2);
         xlim = get(axesHandles(k),'Xlim');
         ylim = get(axesHandles(k),'Ylim');

         if x >= xlim(1) && x <= xlim(2) && y >= ylim(1) && y <= ylim(2)
            him = himage(k);
            im = imageModels(k);
            overAnImage = true;
            break;
         end
      end

      if ~overAnImage
         displayDefaultString;

      else
         [nrows,ncols,ndims] = size(get(him,'Cdata'));
         xdata = get(him,'XData');
         ydata = get(him,'YData');

         if (xdata(2) == xdata(1) || ydata(2) == ydata(1) || nrows == 0  || ...
               ncols == 0)
            displayDefaultString;
            
         else
            [isXDataDefault,isYDataDefault] = isDefaultXYData(him);
            if isXDataDefault && isYDataDefault
               createXYString = @(x,y) sprintf('(%1d, %1d)  ', round(x), ...
                  round(y));
            else
               createXYString = @(x,y) sprintf('(%1.2f, %1.2f)  ',x,y);
            end

            % Construct pixel value string
            rp = axes2pix(nrows,ydata,y);
            cp = axes2pix(ncols,xdata,x);
            r = min(nrows,max(1,round(rp)));
            c = min(ncols,max(1,round(cp)));

            valueString = getPixelInfoString(im,r,c);
            %ZZhx = imshow('MZ16');       %%% ZZZ добавлено мной
            %ZZhx=read(MZ16);                  %%% ZZZ добавлено мной
            %ZZimx = getimagemodel(hx);  %%% ZZZ добавлено мной
            
            %%global ZMIN DZX  %%переставим в начало программы
            
            ac0=DZX/255.;
            ac1=str2double(valueString);
            ac2=ac0*ac1;
            ac3=ZMIN+ac2;
            %valueStringx=num2str(ac2);
            valueStringx=int2str(ac3);
            %ZZvalueStringxyy = valueString*1000; %Z-доб мной
            %ZZvalueStringx=char(round(valueStringxyy));
            % make sure that string with E notation looks the same on all
            % platforms.
            if ispc
               valueString = strrep(valueString,'E+0','E+');
               valueString = strrep(valueString,'E-0','E-');
               valueStringx= strrep(valueStringx,'E+0','E+');  %%ZZ
               valueStringx = strrep(valueStringx,'E-0','E-');  %%ZZ
            end
                       %%ZZZZZZZZ
            %%%ZZZ pixelString = sprintf('%s%s',createXYString(x,y),valueString);
            
            pixelString=sprintf('%s%s  %s',createXYString(x,y),valueString,valueStringx); %%%ZZZ 
            
            set(huic,'String',pixelString);
         end
      end

      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      function displayDefaultString

         if numel(himage) ~= 1
            defaultPixelInfoString = stringForMultipleImages;
         else
            defaultPixelInfoString = getDefaultPixelInfoString(imageModels);
         end
         pixelString = sprintf('%s%s%s',xystring,spacestring, ...
            defaultPixelInfoString);
         set(huic,'String',pixelString);
      end

   end %displayPixelInfo

   % Set position of string so that it could fit the largest pixel value.
   % Turn pixel reporting on by default, after resetting hPixelInfoValue's
   % string to ''.
   set(huic,'String','(0000,0000) [0.00E+00 0.00E+00 0.00E+00]');
   pixInfoExtent = get(huic,'Extent');
   fudge = 2;
   posPixInfoValue = [1 1 pixInfoExtent(3)+3*fudge pixInfoExtent(4)];
   set(huic,'Position',posPixInfoValue);
   pixelString = sprintf('%s%s%s',xystring,spacestring, stringForMultipleImages);
   set(huic,'String',pixelString);
   set(huic,'Visible','on');

end
