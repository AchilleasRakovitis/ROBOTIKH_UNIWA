function varargout = robsim_gui(varargin)
% ROBSIM_GUI M-file for robsim_gui.fig
%      ROBSIM_GUI, by itself, creates a new ROBSIM_GUI or raises the existing
%      singleton*.
%
%      H = ROBSIM_GUI returns the handle to a new ROBSIM_GUI or the handle to
%      the existing singleton*.
%
%      ROBSIM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBSIM_GUI.M with the given input arguments.
%
%      ROBSIM_GUI('Property','Value',...) creates a new ROBSIM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robsim_gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robsim_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help robsim_gui

% Last Modified by GUIDE v2.5 01-Apr-2008 15:54:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robsim_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @robsim_gui_OutputFcn, ...
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


% --- Executes just before robsim_gui is made visible.
function robsim_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robsim_gui (see VARARGIN)

% Choose default command line output for robsim_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
%set(hObject,'toolbar','figure'); %Toolbar -> Axis
% UIWAIT makes robsim_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = robsim_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%msgbox('You must first choose the "Joints Step", "Velocity", "Frame" and "Trajectory" you prefer!','Robot Simulation','help')
warning('off');
global sel
init_globals
%      
if sel == 1
    
    set(handles.pushbutton5,'Visible','Off')
    set(handles.pushbutton6,'Visible','Off')
    set(handles.pushbutton7,'Visible','Off')
    set(handles.pushbutton8,'Visible','Off')
    set(handles.text3,'Visible','Off')
    set(handles.text4,'Visible','Off')
    set(handles.text14,'Visible','Off')
    set(handles.text15,'Visible','Off')
    set(handles.text24,'Visible','Off')
    set(handles.text25,'Visible','Off')
    set(handles.text21,'Visible','Off')
    set(handles.text8,'Visible','Off')
    set(handles.text11,'Visible','Off')
    set(handles.checkbox1,'Visible','Off')
    set(handles.checkbox2,'Visible','Off')
    set(handles.checkbox3,'Visible','Off')
    set(handles.checkbox4,'Visible','Off')
    set(handles.pushbutton13,'Visible','Off')
    set(handles.pushbutton14,'Visible','Off')
    set(handles.pushbutton17,'Visible','Off')
    set(handles.pushbutton18,'Visible','Off')

elseif sel == 2
    
    set(handles.pushbutton7,'Visible','Off')
    set(handles.pushbutton8,'Visible','Off')
    set(handles.text15,'Visible','Off')
    set(handles.text4,'Visible','Off')
    set(handles.text25,'Visible','Off')
    set(handles.pushbutton7,'Visible','Off')
    set(handles.pushbutton8,'Visible','Off')
    set(handles.text8,'Visible','Off')
    set(handles.text11,'Visible','Off')
    set(handles.checkbox1,'Visible','Off')
    set(handles.checkbox2,'Visible','Off')
    set(handles.checkbox3,'Visible','Off')
    set(handles.checkbox4,'Visible','Off')
    set(handles.pushbutton14,'Visible','Off')
    set(handles.pushbutton17,'Visible','Off')
    set(handles.pushbutton18,'Visible','Off')
   
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles) %'+' q1
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 %Move Joints
    moveq1(CURRENT_Q(1)+st)
elseif f == 2 %Move Cartecian frame
    moveworldxs(pt)
elseif f == 3 %Move tool
    movetoolxs(pt)
else
    errordlg('Please select a frame','Error')
end

set(handles.text1,'String',CURRENT_Q(1))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end

set(handles.text5,'String',fd)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles) %'-' q1
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 %Move Joints
    moveq1(CURRENT_Q(1)-st)
elseif f == 2 %Move Cartecian frame
    moveworldxs(-pt)
elseif f == 3 %Move tool
    movetoolxs(-pt)
else
    errordlg('Please select a frame','Error')
end

set(handles.text1,'String',CURRENT_Q(1))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles) %'+' q2
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 %Move Joints
    moveq2(CURRENT_Q(2)+st)
elseif f == 2 %Move Cartecian frame
    moveworldys(pt)
elseif f == 3 %Move tool
    movetoolys(pt)
else
    errordlg('Please select a frame','Error')
end
set(handles.text2,'String',CURRENT_Q(2))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton4. 
function pushbutton4_Callback(hObject, eventdata, handles) %'-' q2
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 %Move Joints
    moveq2(CURRENT_Q(2)-st)
elseif f == 2 %Move Cartecian frame
    moveworldys(-pt)
elseif f == 3 %Move tool
    movetoolys(-pt)
else
    errordlg('Please select a frame','Error')
end
set(handles.text2,'String',CURRENT_Q(2))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton5. 
function pushbutton5_Callback(hObject, eventdata, handles) %'+' q3
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel


rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 && sel == 3 %Move joints - SCARA
    
    if pt < -1.1999 || pt > 1.2001
        errordlg('Input must be between -1.2..1.2','Wrong Input')
    else
        moveq3(CURRENT_Q(3)+pt)
    end
    
elseif f == 1 && sel == 2 %Move joints - F3L
    moveq3(CURRENT_Q(3)+st)
elseif f == 2 %Cartecian frame
    moveworldzs(pt)
elseif f == 3 %Move tool
    movetoolzs(pt)
end

set(handles.text3,'String',CURRENT_Q(3))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles) %'-' q3
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String'); %edit1 revolute (Joints Frame)
st=str2num(rv);
pv = get(handles.edit2,'String'); %edit2 prismatic-straight line (Cartecian - Tool Frame)
pt=str2num(pv);

f=FRAME;
if f == 1 && sel == 3 %Move joints - SCARA
    
    if pt < -1.1999 || pt > 1.2001
        errordlg('Input must be between -1.2..1.2','Wrong Input')
    else
        moveq3(CURRENT_Q(3)-pt)
    end
    
elseif f == 1 && sel == 2 %Move joints - F3L
    moveq3(CURRENT_Q(3)-st)
elseif f == 2 %Cartecian frame
    moveworldzs(-pt)
elseif f == 3 %Move tool
    movetoolzs(-pt)
end

set(handles.text3,'String',CURRENT_Q(3))

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles) %'+' q4
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String');
st=str2num(rv);

f=FRAME;
if f == 1
    
    moveq4(CURRENT_Q(4)+st)
    set(handles.text4,'String',CURRENT_Q(4))
    if sel == 1
        fd=CURRENT_Q(1)+CURRENT_Q(2);
        cw=where('w');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
    elseif sel == 2
        fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
        cw=where('w');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
    else
        fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
        cw=where('w');
        ct=where('t');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
        set(handles.text8,'String',cw(3))
        set(handles.text9,'String',ct(1))
        set(handles.text10,'String',ct(2))
        set(handles.text11,'String',ct(3))
    end
    set(handles.text5,'String',fd)
    
else
    errordlg('The current button is to be used only in "Joints" mode!','Wrong usage of button')
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles) %'-' q4
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

rv = get(handles.edit1,'String');
st=str2num(rv);

f=FRAME;
if f == 1
    
    moveq4(CURRENT_Q(4)-st)
    set(handles.text4,'String',CURRENT_Q(4))
    
    if sel == 1
        fd=CURRENT_Q(1)+CURRENT_Q(2);
        cw=where('w');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
    elseif sel == 2
        fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
        cw=where('w');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
    else
        fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
        cw=where('w');
        ct=where('t');
        set(handles.text6,'String',cw(1))
        set(handles.text7,'String',cw(2))
        set(handles.text8,'String',cw(3))
        set(handles.text9,'String',ct(1))
        set(handles.text10,'String',ct(2))
        set(handles.text11,'String',ct(3))
    end
    
else
    errordlg('The current button is to be used only in "Joints" mode!','Wrong usage of button')
end
set(handles.text5,'String',fd)
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles) %Do Ready
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global sel

ready

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    
    set(handles.text3,'String',CURRENT_Q(3))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',cw(1))
    set(handles.text7,'String',cw(2))
    set(handles.text8,'String',cw(3))
    set(handles.text9,'String',ct(1))
    set(handles.text10,'String',ct(2))
    set(handles.text11,'String',ct(3))
    
    set(handles.text3,'String',CURRENT_Q(3))
    set(handles.text4,'String',CURRENT_Q(4))
end
set(handles.text1,'String',CURRENT_Q(1))
set(handles.text2,'String',CURRENT_Q(2))

set(handles.text5,'String',fd)

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles) %ginput
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
movew


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles) %Trajectory mode
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global TRAJ_MODE
val = get(hObject,'Value');

switch val
    case 1
        errordlg('Please select a Trajectory...','Error')
    case 2
        TRAJ_MODE = 1; %3rd order
    case 3
        TRAJ_MODE = 2; %5th order
    case 4
        TRAJ_MODE = 3; %Parabolic mixture
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles) %Frame mode
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global FRAME
val = get(hObject,'Value');

switch val
    case 1
        errordlg('Please select a Frame...','Error')
    case 2
        FRAME = 1; %Joints
    case 3
        FRAME = 2; %Cartecian
    case 4
        FRAME = 3; %Tool
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles) %Table grid
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
chbox_state = get(hObject,'Value');
if chbox_state == get(hObject,'Max')
    grid_table(1)
    set(handles.togglebutton1,'Visible','On')
else
    grid_table(0)
    set(handles.togglebutton1,'Visible','Off')
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles) %Tool grid
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
chbox_state = get(hObject,'Value');
if chbox_state == get(hObject,'Max')
    grid_tool(1)
    set(handles.togglebutton2,'Visible','On')
else
    grid_tool(0)
    set(handles.togglebutton2,'Visible','Off')
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles) %World grid
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
chbox_state = get(hObject,'Value');
if chbox_state == get(hObject,'Max')
    grid_world(1)
else
    grid_world(0)
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles) %Z-grid
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
chbox_state = get(hObject,'Value');
if chbox_state == get(hObject,'Max')
    grid_z(1)
else
    grid_z(0)
end

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles) %table grid - thick/plain
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    % toggle button is pressed
    grid_table(2)
    set(handles.togglebutton1,'String','plain')
elseif button_state == get(hObject,'Min')
    % toggle button is not pressed
    grid_table(1)
    set(handles.togglebutton1,'String','thick')
end

% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles) %tool grid - thick/plain
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    % toggle button is pressed
    grid_tool(2)
    set(handles.togglebutton2,'String','plain')
elseif button_state == get(hObject,'Min')
    % toggle button is not pressed
    grid_tool(1)
    set(handles.togglebutton2,'String','thick')
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles) %plot q1(t)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ORBITS
cla(handles.axes1,'reset')
guidata(hObject, handles);

axes(handles.axes1)
plot(ORBITS(:,1),ORBITS(:,2))
AXIS tight
guidata(hObject, handles); %updates the handles
title('Q1(t)')

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles) %plot q2(t)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ORBITS
cla(handles.axes1,'reset')
guidata(hObject, handles);

axes(handles.axes1)
plot(ORBITS(:,1),ORBITS(:,3))
AXIS tight
guidata(hObject, handles); %updates the handles
title('Q2(t)')

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles) %plot q3(t)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ORBITS
cla(handles.axes1,'reset')
guidata(hObject, handles);

axes(handles.axes1)
plot(ORBITS(:,1),ORBITS(:,4))
AXIS tight
guidata(hObject, handles); %updates the handles
title('Q3(t)')

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles) %plot q4(t)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ORBITS
cla(handles.axes1,'reset')
guidata(hObject, handles);

axes(handles.axes1)
plot(ORBITS(:,1),ORBITS(:,5))
AXIS tight
guidata(hObject, handles); %updates the handles
title('Q4(t)')

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles) %Clear axis
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset')
guidata(hObject, handles);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles) %Close gui
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);
fin


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global VELOCITY_PERCENTAGE

vel = get(hObject, 'Value');
VELOCITY_PERCENTAGE = vel;

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grasp

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
leave



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CURRENT_Q
global FRAME
global sel

if sel == 1
    fd=CURRENT_Q(1)+CURRENT_Q(2);
    cw=where('w');
    set(handles.text6,'String',round((cw(1)*100))/100)
    set(handles.text7,'String',round((cw(2)*100))/100)
    set(handles.text1,'String',CURRENT_Q(1))
    set(handles.text2,'String',CURRENT_Q(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    cw=where('w');
    set(handles.text6,'String',round((cw(1)*100))/100)
    set(handles.text7,'String',round((cw(2)*100))/100)
    set(handles.text1,'String',CURRENT_Q(1))
    set(handles.text2,'String',CURRENT_Q(2))
    set(handles.text3,'String',CURRENT_Q(3))
else
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    cw=where('w');
    ct=where('t');
    set(handles.text6,'String',round((cw(1)*100))/100)
    set(handles.text7,'String',round((cw(2)*100))/100)
    set(handles.text8,'String',round((cw(3)*100))/100)
    set(handles.text9,'String',round((ct(1)*100))/100)
    set(handles.text10,'String',round((ct(2)*100))/100)
    set(handles.text11,'String',round((ct(3)*100))/100)

    set(handles.text1,'String',CURRENT_Q(1))
    set(handles.text2,'String',CURRENT_Q(2))
    set(handles.text3,'String',CURRENT_Q(3))
    set(handles.text4,'String',CURRENT_Q(4))
end
set(handles.text5,'String',fd)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;close all
change_arm


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit_vel_acc
