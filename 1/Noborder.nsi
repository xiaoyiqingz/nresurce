Var MSG

Var BGImage
Var MiddleImage         ;�м�Ĵ�Logo
Var ImageHandle

;---------------------------ȫ�ֱ���ű�Ԥ����ĳ���-----------------------------------------------------
!define  EM_BrandingText "testtest"
; MUI Ԥ���峣��
!define MUI_ABORTWARNING
;��װͼ���·������
!define MUI_ICON "images\fav.ico"
;ж��ͼ���·������
!define MUI_UNICON "images\fav.ico"
;��ƷЭ�����·������
;!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define EM_OUTFILE_NAME "test.exe"

;---------------------------�������ѹ�����ͣ�Ҳ����ͨ���������ű����ƣ�------------------------------------
SetCompressor lzma
BrandingText "${EM_BrandingText}"
SetCompress force
XPStyle on
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
!include "nsWindows.nsh"

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit

;�Զ���ҳ��
Page custom WelcomePage

; ���Э��ҳ��
!define MUI_LICENSEPAGE_CHECKBOX

; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!insertmacro MUI_PAGE_FINISH
; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES
; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

;------------------------------------------------------MUI �ִ����涨���Լ���������------------------------
;Ӧ�ó�����ʾ����
Name "test"
;Ӧ�ó������·��
OutFile "${EM_OUTFILE_NAME}"
InstallDir "$PROGRAMFILES\test"

Function .onInit
    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp`
    File `/ONAME=$PLUGINSDIR\middle.bmp` `images\middle.bmp`
FunctionEnd

Function onGUIInit
    ;�����߿�
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    ;����һЩ���пؼ�
    GetDlgItem $0 $HWNDPARENT 1034
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1035
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1036
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1037
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1038
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1039
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1256
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1028
    ShowWindow $0 ${SW_HIDE}
FunctionEnd

;�����ޱ߿��ƶ�
Function onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

Function WelcomePage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
        Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ;�������͸��

    ${NSW_SetWindowSize} $HWNDPARENT 513 354 ;�ı䴰���С
    ${NSW_SetWindowSize} $0 513 354 ;�ı�Page��С
    
    ;��Сͼ
    ${NSD_CreateBitmap} 0 34 100% 100% ""
    Pop $MiddleImage
    ${NSD_SetImage} $MiddleImage $PLUGINSDIR\middle.bmp $ImageHandle
    
    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\bg.bmp $ImageHandle


    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Section MainSetup
SectionEnd
