function varargout = P4_0516320(varargin)
% P4_0516320 MATLAB code for P4_0516320.fig
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @P4_0516320_OpeningFcn, ...
                   'gui_OutputFcn',  @P4_0516320_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before P4_0516320 is made visible.
function P4_0516320_OpeningFcn(hObject, eventdata, handles, varargin)

handles.xgap=480;
handles.ygap=360;

axis([0 handles.xgap 0 handles.ygap])
hold on
iptsetpref('ImshowAxesVisible','on')
handles.zoom=1;
handles.locx=1;
handles.locy=1;

str = 'Zoom :  '
stra = num2str(handles.zoom)
str = strcat(str,stra)

set(handles.text3,'String',str)

handles.zeros=255*ones(5000)

handles.output = hObject;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = P4_0516320_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

prompt = 'Enter image location:'
dlg_title = 'Import image';
handles.loc = inputdlg(prompt,dlg_title);
handles.loc=handles.loc{1}
if ischar(handles.loc)==1
    handles.img = imread(handles.loc)
    handles.imgo = handles.img
    handles.img = imresize(handles.imgo, handles.zoom, 'nearest');
    handles.imgsize = size(handles.img)
    handles.realy = handles.imgsize(1)
    set(handles.slider1,'Max',handles.imgsize(1)-handles.ygap)
    set(handles.slider2,'Max',handles.imgsize(2)-handles.xgap)
    imshow(handles.img)
    axis([1 handles.xgap handles.realy-handles.ygap+1 handles.realy])
    hold on
else
    errordlg('File not found','File Error');
end
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.zoom=handles.zoom/2;
if handles.zoom < 1
    handles.zoom=1;
end
str = 'Zoom :  '
stra = num2str(handles.zoom)
str = strcat(str,stra)
set(handles.text3,'String',str)

handles.img = imresize(handles.imgo, handles.zoom, 'nearest');
handles.imgsize = size(handles.img)
handles.realy = handles.imgsize(1)
set(handles.slider1,'Max',handles.imgsize(1)-handles.ygap)
set(handles.slider1,'SliderStep',[1 0.1*(handles.zoom/2)])
set(handles.slider2,'SliderStep',[1 0.1*(handles.zoom/2)])
set(handles.slider2,'Max',handles.imgsize(2)-handles.xgap)
imshow(handles.zeros)
imshow(handles.img)
axis([1 handles.xgap handles.realy-handles.ygap+1 handles.realy])
hold on

guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
handles.zoom=handles.zoom*2;
if handles.zoom>16
    handles.zoom=16
end
str = 'Zoom :  '
stra = num2str(handles.zoom)
str = strcat(str,stra)
set(handles.text3,'String',str)

handles.img = imresize(handles.imgo, handles.zoom, 'nearest');
handles.imgsize = size(handles.img)
handles.realy = handles.imgsize(1)
set(handles.slider1,'Max',handles.imgsize(1)-handles.ygap)
set(handles.slider1,'SliderStep',[1 0.1*(handles.zoom/2)])
set(handles.slider2,'SliderStep',[1 0.1*(handles.zoom/2)])
set(handles.slider2,'Max',handles.imgsize(2)-handles.xgap)
imshow(handles.zeros)
imshow(handles.img)
axis([1 handles.xgap handles.realy-handles.ygap+1 handles.realy])
hold on


guidata(hObject, handles);



function slider1_Callback(hObject, eventdata, handles)
handles.locy=get(hObject,'Value') 
handles.locy=floor(handles.locy)
if handles.locy==0
    handles.locy=1;
end
imshow(handles.img)
axis([handles.locx handles.locx+handles.xgap-1 handles.realy-handles.ygap+1-handles.locy handles.realy-handles.locy])
hold on
guidata(hObject, handles);

function slider2_Callback(hObject, eventdata, handles)
handles.locx=get(hObject,'Value')
handles.locx=floor(handles.locx)
if handles.locx==0
    handles.locx=1;
end
imshow(handles.img)
axis([handles.locx handles.locx+handles.xgap-1 handles.realy-handles.ygap+1-handles.locy handles.realy-handles.locy])
hold on
guidata(hObject, handles);




function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
