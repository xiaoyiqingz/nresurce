Var MSG
Var Dialog

Var BGImage
Var MiddleImage         
Var ImageHandle
Var Btn_Next
Var Btn_Cancel
Var Btn_Agreement
Var Bool_License
Var Txt_License

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
;�����ļ�����ͷ�ļ�
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "LoadRTF.nsh"
!include "WinMessages.nsh"

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
    File `/ONAME=$PLUGINSDIR\welcome.bmp` `images\welcome.bmp`
		File `/ONAME=$PLUGINSDIR\btn_next.bmp` `images\btn_next.bmp`
		File `/oname=$PLUGINSDIR\btn_agreement1.bmp` `images\btn_agreement1.bmp`
    File `/oname=$PLUGINSDIR\btn_agreement2.bmp` `images\btn_agreement2.bmp`
    File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf`
    
		SkinBtn::Init "$PLUGINSDIR\btn_next.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement1.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement2.bmp"
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

;��һ����ť�¼�
Function onClickNext
  MessageBox MB_OK "��һ��"
  Abort
FunctionEnd

;Э�鰴ť�¼�
Function onClickAgreement
	${IF} $Bool_License == 1
		ShowWindow $Txt_License ${SW_HIDE}
		ShowWindow $MiddleImage ${SW_SHOW}
		IntOp $Bool_License $Bool_License - 1
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement1
	${ELSE}
	  ShowWindow $Txt_License ${SW_SHOW}
	  ShowWindow $MiddleImage ${SW_HIDE}
		IntOp $Bool_License $Bool_License + 1
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement2
	${EndIf}
FunctionEnd

;-----------------------------------------Ƥ����ͼ����----------------------------------------------------
Function SkinBtn_Next
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_next.bmp $1
FunctionEnd

Function SkinBtn_Agreement1
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_agreement1.bmp $1
FunctionEnd

Function SkinBtn_Agreement2
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_agreement2.bmp $1
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
    
    ;��ȡRTF���ı���
		nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  5 35 501 216 ''
    Pop $Txt_License
		${LoadRTF} '$PLUGINSDIR\license.rtf' $Txt_License
    ShowWindow $Txt_License ${SW_HIDE}

    
    ;��һ��
    ${NSD_CreateButton} 330 315 88 25 ""
		Pop $Btn_Next
		StrCpy $1 $Btn_Next
		Call SkinBtn_Next
		GetFunctionAddress $3 onClickNext
    SkinBtn::onClick $1 $3
    
    ;�û�Э��
		${NSD_CreateButton} 181 273 95 15 ""
		Pop $Btn_Agreement
		StrCpy $1 $Btn_Agreement
		Call SkinBtn_Agreement1
	  GetFunctionAddress $3 onClickAgreement
	  SkinBtn::onClick $1 $3
 		StrCpy $Bool_License 0 ;��ʼ��ֵΪ0

    ;��Сͼ
    ${NSD_CreateBitmap} 1 31 511 226 ""
    Pop $MiddleImage
    ${NSD_SetImage} $MiddleImage $PLUGINSDIR\welcome.bmp $ImageHandle
    ;ShowWindow $MiddleImage ${SW_HIDE}
    
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
