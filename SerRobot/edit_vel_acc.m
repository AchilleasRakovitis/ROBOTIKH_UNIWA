function varargout = edit_vel_acc(varargin)
% EDIT_VEL_ACC M-file for edit_vel_acc.fig
%      EDIT_VEL_ACC, by itself, creates a new EDIT_VEL_ACC or raises the existing
%      singleton*.
%
%      H = EDIT_VEL_ACC returns the handle to a new EDIT_VEL_ACC or the handle to
%      the existing singleton*.
%
%      EDIT_VEL_ACC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDIT_VEL_ACC.M with the given input arguments.
%
%      EDIT_VEL_ACC('Property','Value',...) creates a new EDIT_VEL_ACC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edit_vel_acc_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edit_vel_acc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help edit_vel_acc

% Last Modified by GUIDE v2.5 01-Apr-2008 15:35:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edit_vel_acc_OpeningFcn, ...
                   'gui_OutputFcn',  @edit_vel_acc_OutputFcn, ...
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


% --- Executes just before edit_vel_acc is made visible.
function edit_vel_acc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edit_vel_acc (see VARARGIN)

% Choose default command line output for edit_vel_acc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edit_vel_acc wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = edit_vel_acc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

init_globals

global V1_max
global V2_max
global V3_max
global V4_max
global A1_max
global A2_max
global A3_max
global A4_max

global sel

if sel == 1
    
    set(handles.text4,'Visible','Off')
    set(handles.text5,'Visible','Off')
    set(handles.edit3,'Visible','Off')
    set(handles.edit4,'Visible','Off')
    set(handles.edit7,'Visible','Off')
    set(handles.edit8,'Visible','Off')
    set(handles.text8,'Visible','Off')
    set(handles.text9,'Visible','Off')
    
    set(handles.edit1,'String',V1_max)
    set(handles.edit2,'String',V2_max)
    set(handles.edit5,'String',A1_max)
    set(handles.edit6,'String',A2_max)
    
elseif sel == 2
    set(handles.text5,'Visible','Off')
    set(handles.edit4,'Visible','Off')
    set(handles.edit8,'Visible','Off')
    set(handles.text9,'Visible','Off')
    
    set(handles.edit1,'String',V1_max)
    set(handles.edit2,'String',V2_max)
    set(handles.edit3,'String',V3_max)
    set(handles.edit5,'String',A1_max)
    set(handles.edit6,'String',A2_max)
    set(handles.edit7,'String',A3_max)
elseif sel == 3
    set(handles.edit1,'String',V1_max)
    set(handles.edit2,'String',V2_max)
    set(handles.edit3,'String',V3_max)
    set(handles.edit4,'String',V4_max)
    set(handles.edit5,'String',A1_max)
    set(handles.edit6,'String',A2_max)
    set(handles.edit7,'String',A3_max)
    set(handles.edit8,'String',A4_max)
end

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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global V1_max
global V2_max
global V3_max
global V4_max
global A1_max
global A2_max
global A3_max
global A4_max
global sel
% init_globals

if sel == 1
    
    v1 = get(handles.edit1,'String');
    v2 = get(handles.edit2,'String');
    a1 = get(handles.edit5,'String');
    a2 = get(handles.edit6,'String');
    V1_max = str2num(v1);
    V2_max = str2num(v2);
    A1_max = str2num(a1);
    A2_max = str2num(a2);
    
elseif sel == 2
    
    v1 = get(handles.edit1,'String');
    v2 = get(handles.edit2,'String');
    v3 = get(handles.edit3,'String');
    a1 = get(handles.edit5,'String');
    a2 = get(handles.edit6,'String');
    a3 = get(handles.edit7,'String');
    V1_max = str2num(v1);
    V2_max = str2num(v2);
    V3_max = str2num(v3);
    A1_max = str2num(a1);
    A2_max = str2num(a2);
    A3_max = str2num(a3);
    
elseif sel == 3
    
    v1 = get(handles.edit1,'String');
    v2 = get(handles.edit2,'String');
    v3 = get(handles.edit3,'String');
    v4 = get(handles.edit4,'String');
    a1 = get(handles.edit5,'String');
    a2 = get(handles.edit6,'String');
    a3 = get(handles.edit7,'String');
    a4 = get(handles.edit8,'String');

    V1_max = str2num(v1);
    V2_max = str2num(v2);
    V3_max = str2num(v3);
    V4_max = str2num(v4);
    A1_max = str2num(a1);
    A2_max = str2num(a2);
    A3_max = str2num(a3);
    A4_max = str2num(a4);
    
end

close(handles.figure1);