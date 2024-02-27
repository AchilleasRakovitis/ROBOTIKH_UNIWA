function varargout = change_arm(varargin)
% CHANGE_ARM M-file for change_arm.fig
%      CHANGE_ARM, by itself, creates a new CHANGE_ARM or raises the existing
%      singleton*.
%
%      H = CHANGE_ARM returns the handle to a new CHANGE_ARM or the handle to
%      the existing singleton*.
%
%      CHANGE_ARM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANGE_ARM.M with the given input arguments.
%
%      CHANGE_ARM('Property','Value',...) creates a new CHANGE_ARM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before change_arm_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to change_arm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help change_arm

% Last Modified by GUIDE v2.5 27-Mar-2008 20:34:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @change_arm_OpeningFcn, ...
                   'gui_OutputFcn',  @change_arm_OutputFcn, ...
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


% --- Executes just before change_arm is made visible.
function change_arm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to change_arm (see VARARGIN)

% Choose default command line output for change_arm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes change_arm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = change_arm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global sel
val = get(hObject,'Value');

switch val
    case 1
        errordlg('Please select a Robot to Simulate...','Error')
    case 2
        sel = 1; %RR
        robsim(1)
        robsim_gui
        close(handles.figure1);
    case 3
        sel = 2; %RRR
        robsim(2)
        robsim_gui
        close(handles.figure1);
    case 4
        sel = 3; %SCARA
        robsim(3)
        robsim_gui
        close(handles.figure1);
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


