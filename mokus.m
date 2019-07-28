function varargout = mokus(varargin)
% MOKUS MATLAB code for mokus.fig
%      MOKUS, by itself, creates a new MOKUS or raises the existing
%      singleton*.
%
%      H = MOKUS returns the handle to a new MOKUS or the handle to
%      the existing singleton*.
%
%      MOKUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOKUS.M with the given input arguments.
%
%      MOKUS('Property','Value',...) creates a new MOKUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mokus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mokus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mokus

% Last Modified by GUIDE v2.5 25-Apr-2019 00:31:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mokus_OpeningFcn, ...
                   'gui_OutputFcn',  @mokus_OutputFcn, ...
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


% --- Executes just before mokus is made visible.
function mokus_OpeningFcn(hObject, eventdata, handles, varargin)
board = playSpace();
createPlayBoard(board,handles);
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mokus (see VARARGIN)

% Choose default command line output for mokus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mokus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mokus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in playGame.
function playGame_Callback(hObject, eventdata, handles)
cla
playGame(handles);
% hObject    handle to playGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in player1PopUp.
function player1PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to player1PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns player1PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from player1PopUp


% --- Executes during object creation, after setting all properties.
function player1PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player1PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in player2PopUp.
function player2PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to player2PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns player2PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from player2PopUp


% --- Executes during object creation, after setting all properties.
function player2PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player2PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in player3PopUp.
function player3PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to player3PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns player3PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from player3PopUp


% --- Executes during object creation, after setting all properties.
function player3PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player3PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in player4PopUp.
function player4PopUp_Callback(hObject, eventdata, handles)
% hObject    handle to player4PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns player4PopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from player4PopUp


% --- Executes during object creation, after setting all properties.
function player4PopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to player4PopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
