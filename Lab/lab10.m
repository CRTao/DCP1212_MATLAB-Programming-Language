function varargout = lab10(varargin)
% LAB10 MATLAB code for lab10.fig
%      LAB10, by itself, creates a new LAB10 or raises the existing
%      singleton*.
%
%      H = LAB10 returns the handle to a new LAB10 or the handle to
%      the existing singleton*.
%
%      LAB10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB10.M with the given input arguments.
%
%      LAB10('Property','Value',...) creates a new LAB10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab10

% Last Modified by GUIDE v2.5 12-May-2017 13:40:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab10_OpeningFcn, ...
                   'gui_OutputFcn',  @lab10_OutputFcn, ...
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


% --- Executes just before lab10 is made visible.
function lab10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab10 (see VARARGIN)


axis([0,10,0,10]);
hold on;
handles.r = get(handles.radiusSlider,'Value');
contents = get(handles.colorMenu,'String');
handles.col = contents{get(handles.colorMenu,'Value')};
handles.wid = 1;

set(handles.radiusText,'String',['r = ' num2str(handles.r)]);
set(handles.widthText,'String',['Width = ' num2str(handles.wid)]);
% Choose default command line output for lab10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab10_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plusButton.
function plusButton_Callback(hObject, eventdata, handles)
% hObject    handle to plusButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.wid = handles.wid+1;
if(handles.wid >20)
    handles.wid  = 20;
end
set(handles.widthText,'String',['Width = ' num2str(handles.wid)]);
guidata(hObject, handles);

% --- Executes on button press in minusButton.
function minusButton_Callback(hObject, eventdata, handles)
% hObject    handle to minusButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.wid = handles.wid-1;
if(handles.wid <1)
    handles.wid  = 1;
end
set(handles.widthText,'String',['Width = ' num2str(handles.wid)]);
guidata(hObject, handles);

% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;

% --- Executes on slider movement.
function radiusSlider_Callback(hObject, eventdata, handles)
% hObject    handle to radiusSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.r = get(handles.radiusSlider,'Value');
set(handles.radiusText,'String',['r = ' num2str(handles.r)]);
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function radiusSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiusSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in colorMenu.
function colorMenu_Callback(hObject, eventdata, handles)
% hObject    handle to colorMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(handles.colorMenu,'String');
handles.col = contents{get(handles.colorMenu,'Value')};
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns colorMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colorMenu


% --- Executes during object creation, after setting all properties.
function colorMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = get(handles.axes1,'CurrentPoint');
mouse_x =m(1,1);
mouse_y = m(1,2);
% Plot
plot(handles.r * cosd(0:360) + mouse_x,handles.r * sind(0:360) + mouse_y, 'Color',handles.col,'LineWidth',handles.wid);
