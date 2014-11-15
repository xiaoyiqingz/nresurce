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
Var Btn_Close
Var WarningForm

Var Ck_ShortCut
Var Bool_ShortCut
Var Lbl_ShortCut

Var Ck_AutoRun
Var Bool_AutoRun
Var Lbl_AutoRun

Var Ck_FinishPage
Var Bool_FinishPage
Var Lbl_FinishPage

Var Btn_Install

Var Txt_Browser
Var Btn_Browser

Var Btn_DetailsPrint
Var UDetailsPrint   ;��ϸ��������
Var Txt_DetailsPrint  ;��ϸ���ֿ�ؼ�
Var Bool_DetailsPrint ;��¼�Ƿ���ʾ��ϸ��Ϣ�ı���

Var Lbl_Sumary
Var PB_ProgressBar

Var WebImg ;��ҳ�ؼ�

Var Ck_Weibo
Var Bool_Weibo
Var Lbl_Weibo
Var Btn_Complete




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
Page custom InstallationPage
Page custom LoadingPage
Page custom CompletePage

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
    File `/ONAME=$PLUGINSDIR\quit.bmp` `images\quit.bmp`
    File `/ONAME=$PLUGINSDIR\select.bmp` `images\select.bmp`
    File `/ONAME=$PLUGINSDIR\welcome.bmp` `images\welcome.bmp`
		File `/ONAME=$PLUGINSDIR\btn_next.bmp` `images\btn_next.bmp`
		File `/oname=$PLUGINSDIR\btn_agreement1.bmp` `images\btn_agreement1.bmp`
    File `/oname=$PLUGINSDIR\btn_agreement2.bmp` `images\btn_agreement2.bmp`
    File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf`
    File `/oname=$PLUGINSDIR\btn_close.bmp` `images\btn_close.bmp`
    File `/oname=$PLUGINSDIR\btn_cancel.bmp` `images\btn_cancel.bmp`
    File `/oname=$PLUGINSDIR\checkbox1.bmp` `images\checkbox1.bmp`
    File `/oname=$PLUGINSDIR\checkbox2.bmp` `images\checkbox2.bmp`
    File `/oname=$PLUGINSDIR\btn_quit.bmp` `images\btn_quit.bmp`
   	File `/oname=$PLUGINSDIR\btn_install.bmp` `images\btn_install.bmp`
   	File `/oname=$PLUGINSDIR\btn_change.bmp` `images\btn_change.bmp`
   	
   	File `/oname=$PLUGINSDIR\index.htm` `images\index.htm`
    File `/oname=$PLUGINSDIR\loading_pic1.bmp` `images\loading_pic1.bmp`
    File `/oname=$PLUGINSDIR\loading_pic2.bmp` `images\loading_pic2.bmp`
    File `/oname=$PLUGINSDIR\loading_pic3.bmp` `images\loading_pic3.bmp`
    File `/oname=$PLUGINSDIR\loading_pic4.bmp` `images\loading_pic4.bmp`
   	File `/oname=$PLUGINSDIR\installation.bmp` `images\installation.bmp`
   	
   	File `/oname=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
    File `/oname=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`
    File `/oname=$PLUGINSDIR\btn_complete.bmp` `images\btn_complete.bmp`
    File `/oname=$PLUGINSDIR\success.bmp` `images\success.bmp`
    
		SkinBtn::Init "$PLUGINSDIR\btn_next.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement1.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_agreement2.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_close.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_cancel.bmp"
		SkinBtn::Init "$PLUGINSDIR\checkbox1.bmp"
		SkinBtn::Init "$PLUGINSDIR\checkbox2.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_quit.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_install.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_change.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_complete.bmp"
		
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

Function onWarningGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $WarningForm ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
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

Function SkinBtn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close.bmp $1
FunctionEnd

Function SkinBtn_Cancel
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_cancel.bmp $1
FunctionEnd

Function SkinBtn_Checked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox2.bmp $1
FunctionEnd

Function SkinBtn_UnChecked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox1.bmp $1
FunctionEnd

Function SkinBtn_Quit
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_quit.bmp $1
FunctionEnd

Function SkinBtn_Install
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_install.bmp $1
FunctionEnd

Function SkinBtn_Browser
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_change.bmp $1
FunctionEnd

Function SkinBtn_DetailsPrint1
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_installlist1.bmp $1
FunctionEnd

Function SkinBtn_DetailsPrint2
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_installlist2.bmp $1
FunctionEnd

Function SkinBtn_Complete
	SkinBtn::Set /IMGID=$PLUGINSDIR\btn_complete.bmp $1
FunctionEnd

Function OnClickQuitOK
	Call onClickClose
FunctionEnd

Function OnClick_CheckShortCut
  ${IF} $Bool_ShortCut == 1
		IntOp $Bool_ShortCut $Bool_ShortCut - 1
		StrCpy $1 $Ck_ShortCut
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_ShortCut $Bool_ShortCut + 1
		StrCpy $1 $Ck_ShortCut
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

Function OnClick_CheckAutoRun
  ${IF} $Bool_AutoRun == 1
		IntOp $Bool_AutoRun $Bool_AutoRun - 1
		StrCpy $1 $Ck_AutoRun
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_AutoRun $Bool_AutoRun + 1
		StrCpy $1 $Ck_AutoRun
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

Function OnClick_CheckFinishPage
  ${IF} $Bool_FinishPage == 1
		IntOp $Bool_FinishPage $Bool_FinishPage - 1
		StrCpy $1 $Ck_FinishPage
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_FinishPage $Bool_FinishPage + 1
		StrCpy $1 $Ck_FinishPage
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

;������Ͻǹرհ�ť
Function onClickClose
    FindProcDLL::FindProc "test.exe"
    Sleep 500
    Pop $R0
    ${If} $R0 != 0
    KillProcDLL::KillProc "test.exe"
    ${EndIf}
FunctionEnd

;����ҳ����ת������
Function RelGotoPage
  IntCmp $R9 0 0 Move Move
    StrCmp $R9 "X" 0 Move
      StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

;��һ����ť�¼�
Function onClickNext
  StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

;�����װ��ť
Function OnClick_Install
	StrCpy $R9 1 ;Goto the next page
    Call RelGotoPage
FunctionEnd

Function OnClickQuitCancel
  ${NSW_DestroyWindow} $WarningForm
  EnableWindow $hwndparent 1
  BringToFront
FunctionEnd

Function onCancel
	IsWindow $WarningForm Create_End
	!define Style ${WS_VISIBLE}|${WS_OVERLAPPEDWINDOW}
	${NSW_CreateWindowEx} $WarningForm $hwndparent ${ExStyle} ${Style} "" 1018

	${NSW_SetWindowSize} $WarningForm 349 184
	EnableWindow $hwndparent 0
	System::Call `user32::SetWindowLong(i$WarningForm,i${GWL_STYLE},0x9480084C)i.R0`
	${NSW_CreateButton} 148 122 88 25 ''
	Pop $R0
	StrCpy $1 $R0
	Call SkinBtn_Quit
	${NSW_OnClick} $R0 OnClickQuitOK

	${NSW_CreateButton} 248 122 88 25 ''
	Pop $R0
	StrCpy $1 $R0
	Call SkinBtn_Cancel
	${NSW_OnClick} $R0 OnClickQuitCancel

	${NSW_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
  ${NSW_SetImage} $BGImage $PLUGINSDIR\quit.bmp $ImageHandle
	GetFunctionAddress $0 onWarningGUICallback
	WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
  ${NSW_CenterWindow} $WarningForm $hwndparent
	${NSW_Show}
	Create_End:
  ShowWindow $WarningForm ${SW_SHOW}
FunctionEnd

;����Ŀ¼�¼�
Function OnChange_DirRequest
	;Pop $0
	;System::Call "user32::GetWindowText($Txt_Browser,t.r0,i${NSIS_MAX_STRLEN})"
	;StrCpy $INSTDIR $0
FunctionEnd

Function OnClick_BrowseButton
  Pop $0

  Push $INSTDIR ; input string "C:\Program Files\ProgramName"
  Call GetParent
  Pop $R0 ; first part "C:\Program Files"

  Push $INSTDIR ; input string "C:\Program Files\ProgramName"
  Push "\" ; input chop char
  Call GetLastPart
  Pop $R1 ; last part "ProgramName"

  nsDialogs::SelectFolderDialog "��ѡ�� $R0 ��װ���ļ���:" "$R0"
  Pop $0
  ${If} $0 == "error" # returns 'error' if 'cancel' was pressed?
    Return
  ${EndIf}
  ${If} $0 != ""
    StrCpy $INSTDIR "$0\$R1"
    system::Call `user32::SetWindowText(i $Txt_Browser, t "$INSTDIR")`
  ${EndIf}
FunctionEnd
; Usage:
; Push "C:\Program Files\Directory\Whatever"
; Call GetParent
; Pop $R0 ; $R0 equal "C:\Program Files\Directory"
;�õ�ѡ��Ŀ¼����ƴ�Ӱ�װ��������
Function GetParent
  Exch $R0 ; input string
  Push $R1
  Push $R2
  Push $R3
  StrCpy $R1 0
  StrLen $R2 $R0
  loop:
    IntOp $R1 $R1 + 1
    IntCmp $R1 $R2 get 0 get
    StrCpy $R3 $R0 1 -$R1
    StrCmp $R3 "\" get
    Goto loop
  get:
    StrCpy $R0 $R0 -$R1
    Pop $R3
    Pop $R2
    Pop $R1
    Exch $R0 ; output string
FunctionEnd

; Usage:
; Push $INSTDIR ; input string "C:\Program Files\ProgramName"
; Push "\" ; input chop char
; Call GetLastPart
; Pop $R1 ; last part "ProgramName"
;��ȡѡ��Ŀ¼
Function GetLastPart
  Exch $0 ; chop char
  Exch
  Exch $1 ; input string
  Push $2
  Push $3
  StrCpy $2 0
  loop:
    IntOp $2 $2 - 1
    StrCpy $3 $1 1 $2
    StrCmp $3 "" 0 +3
      StrCpy $0 ""
      Goto exit2
    StrCmp $3 $0 exit1
    Goto loop
  exit1:
    IntOp $2 $2 + 1
    StrCpy $0 $1 "" $2
  exit2:
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output string
FunctionEnd

;��ϸ��װ�¼�
Function onClickDetailsPrint
    ${IF} $Bool_DetailsPrint == 1
        ShowWindow $WebImg ${SW_SHOW}
		ShowWindow $Txt_DetailsPrint ${SW_HIDE}
		IntOp $Bool_DetailsPrint $Bool_DetailsPrint - 1
		StrCpy $1 $Btn_DetailsPrint
		Call SkinBtn_DetailsPrint1
	${ELSE}
        ShowWindow $WebImg ${SW_HIDE}
        ShowWindow $Txt_DetailsPrint ${SW_SHOW}
		IntOp $Bool_DetailsPrint $Bool_DetailsPrint + 1
		StrCpy $1 $Btn_DetailsPrint
		Call SkinBtn_DetailsPrint2
	${EndIf}
FunctionEnd

Function NSD_TimerFun
    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::KillTimer $0
    !if 1   ;�Ƿ��ں�̨����,1��Ч
        GetFunctionAddress $0 InstallationMainFun
        BgWorker::CallAndWait
    !else
        Call InstallationMainFun
    !endif
FunctionEnd

Function OnClick_CheckWeibo
    ${IF} $Bool_Weibo == 1
        IntOp $Bool_Weibo $Bool_Weibo - 1
        StrCpy $1 $Ck_Weibo
        Call SkinBtn_UnChecked
    ${ELSE}
        IntOp $Bool_Weibo $Bool_Weibo + 1
        StrCpy $1 $Ck_Weibo
        Call SkinBtn_Checked
    ${EndIf}
FunctionEnd

;���������
Function onClickComplete

    ;�ж��Ƿ���������ݷ�ʽ
    ${If} $Bool_ShortCut == 1
      ;CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\test.exe"
    ${EndIf}
    ;�ж��Ƿ񿪻����г���
    ${If} $Bool_AutoRun == 1
      ;CreateShortCut "$QUICKLAUNCH\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXECUTE_NAME}"
      ;CreateShortCut "$SMSTARTUP\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_EXECUTE_NAME}"
    ${EndIf}
    ;�ж��Ƿ����վ
    ${If} $Bool_FinishPage == 1
        ExecShell open "http://www.pylife.net"
    ${EndIf}
    ;�ж��Ƿ��������г���
    ${If} $Bool_Weibo == 1
      ExecShell open "http://weibo.com/pylife"
      ShowWindow $HWNDPARENT ${SW_HIDE}
      GetFunctionAddress $0 onClickClose
      BgWorker::CallAndWait
		${ELSE}
		  ShowWindow $HWNDPARENT ${SW_HIDE}
      Call onClickClose
    ${EndIf}
FunctionEnd

Function InstallationMainFun


    SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;�ܲ���Ϊ��������ֵ
		SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 20 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 30 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 40 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 50 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 60 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 70 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 80 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0
    Sleep 1000
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0

    ShowWindow $Btn_Next ${SW_SHOW}
		ShowWindow $Btn_Install ${SW_HIDE}
		EnableWindow $Btn_Cancel 0


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
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Next
		StrCpy $1 $Btn_Next
		Call SkinBtn_Next
		GetFunctionAddress $3 onClickNext
    SkinBtn::onClick $1 $3
    
    	;ȡ��
	${NSD_CreateButton} 417 315 88 25 ""
	Pop $Btn_Cancel
	StrCpy $1 $Btn_Cancel
	Call SkinBtn_Cancel
	GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3
  
    ;�رհ�ť
  ${NSD_CreateButton} 490 8 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onCancel
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

Function InstallationPage
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

	${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С
	
	;����Ŀ¼�ؼ�����
	${NSD_CreateDirRequest} 26 79 358 25 "$INSTDIR"
 	Pop	$Txt_Browser
 	${NSD_OnChange} $Txt_Browser OnChange_DirRequest

 	${NSD_CreateBrowseButton} 400 79 88 25 ""
 	Pop	$Btn_Browser
 	StrCpy $1 $Btn_Browser
	Call SkinBtn_Browser
	GetFunctionAddress $3 OnClick_BrowseButton
  SkinBtn::onClick $1 $3

	

	;CheckBoxѡ����
	${NSD_CreateButton} 26 150 15 15 ""
	Pop $Ck_ShortCut
	StrCpy $1 $Ck_ShortCut
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckShortCut
    SkinBtn::onClick $1 $3
	StrCpy $Bool_ShortCut 1
    ${NSD_CreateLabel} 45 151 100 15 "��������ݷ�ʽ"
    Pop $Lbl_ShortCut
    SetCtlColors $Lbl_ShortCut ""  transparent ;�������͸��

    ${NSD_CreateButton} 26 180 15 15 ""
	Pop $Ck_AutoRun
	StrCpy $1 $Ck_AutoRun
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckAutoRun
    SkinBtn::onClick $1 $3
	StrCpy $Bool_AutoRun 1
    ${NSD_CreateLabel} 45 181 175 15 "�����Զ����г���"
    Pop $Lbl_AutoRun
    SetCtlColors $Lbl_AutoRun ""  transparent ;�������͸��

  ${NSD_CreateButton} 26 210 15 15 ""
	Pop $Ck_FinishPage
	StrCpy $1 $Ck_FinishPage
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckFinishPage
  SkinBtn::onClick $1 $3
	StrCpy $Bool_FinishPage 1
  ${NSD_CreateLabel} 45 211 300 15 "��װ��Ϻ���ò˵���վhttp://www.pylife.net"
  Pop $Lbl_FinishPage
  SetCtlColors $Lbl_FinishPage ""  transparent ;�������͸��

    ;��װ
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Install
		StrCpy $1 $Btn_Install
		Call SkinBtn_Install
		GetFunctionAddress $3 OnClick_Install
	  SkinBtn::onClick $1 $3

    	;ȡ��
		${NSD_CreateButton} 417 315 88 25 ""
		Pop $Btn_Cancel
		StrCpy $1 $Btn_Cancel
		Call SkinBtn_Cancel
		GetFunctionAddress $3 onCancel
	  SkinBtn::onClick $1 $3

    ;�رհ�ť
  ${NSD_CreateButton} 490 8 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3

  ;��������ͼ
	${NSD_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
  ${NSD_SetImage} $BGImage $PLUGINSDIR\select.bmp $ImageHandle


	GetFunctionAddress $0 onGUICallback
	WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
	nsDialogs::Show
	${NSD_FreeImage} $ImageHandle
FunctionEnd

;��װ����ҳ��
Function LoadingPage
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

	${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С

    ;Details����ı���
    StrCpy $UDetailsPrint "��ʼִ�а�װ$\r$\nhttp://www.eastmoney.com$\r$\n"
    nsDialogs::CreateControl EDIT "${__NSD_Text_STYLE}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN}" "${__NSD_Text_EXSTYLE}" 10 44 500 200 $UDetailsPrint
    Pop $Txt_DetailsPrint
    ShowWindow $Txt_DetailsPrint ${SW_HIDE}
    StrCpy $Bool_DetailsPrint 0


    ;������Ҫ˵��
    ${NSD_CreateLabel} 24 243 57 20 "���ڰ�װ"
    Pop $Lbl_Sumary
    SetCtlColors $Lbl_Sumary ""  transparent ;�������͸��

    ${NSD_CreateProgressBar} 24 265 474 7 ""
    Pop $PB_ProgressBar
    SkinProgress::Set $PB_ProgressBar "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"

    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::CreateTimer $0 1

    ;��һ��
    ${NSD_CreateButton} 320 315 88 25 ""
    Pop $Btn_Next
    StrCpy $1 $Btn_Next
    Call SkinBtn_Next
    GetFunctionAddress $3 onClickNext
    SkinBtn::onClick $1 $3
    ShowWindow $Btn_Next ${SW_HIDE}
    
    ;��װ
    ${NSD_CreateButton} 320 315 88 25 ""
		Pop $Btn_Install
		StrCpy $1 $Btn_Install
		Call SkinBtn_Install
		  EnableWindow $Btn_Install 0

    	;ȡ��
		${NSD_CreateButton} 417 315 88 25 ""
		Pop $Btn_Cancel
		StrCpy $1 $Btn_Cancel
		Call SkinBtn_Cancel
		GetFunctionAddress $3 onCancel
	  SkinBtn::onClick $1 $3
		  EnableWindow $Btn_Cancel 0
		  
    ;�رհ�ť
  ${NSD_CreateButton} 490 8 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onCancel
  SkinBtn::onClick $1 $3
  EnableWindow $Btn_Close 0

    System::Call `*(i,i,i,i)i(1,34,518,200).R0`
    System::Call `user32::MapDialogRect(i$HWNDPARENT,iR0)`
    System::Call `*$R0(i.s,i.s,i.s,i.s)`
    System::Free $R0
    FindWindow $R0 "#32770" "" $HWNDPARENT
    System::Call `user32::CreateWindowEx(i,t"STATIC",in,i${DEFAULT_STYLES}|${SS_BLACKRECT},i1,i34,i518,i200,iR0,i1100,in,in)i.R0`
    StrCpy $WebImg $R0
    WebCtrl::ShowWebInCtrl $WebImg "$PLUGINSDIR/index.htm"

    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\installation.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Function CompletePage
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

    ${NSW_SetWindowSize} $HWNDPARENT 520 350 ;�ı��Զ��崰���С
	${NSW_SetWindowSize} $0 520 350 ;�ı��Զ���Page��С

	${NSD_CreateButton} 255 163 15 15 ""
	Pop $Ck_Weibo
	StrCpy $1 $Ck_Weibo
	Call SkinBtn_Checked
	GetFunctionAddress $3 OnClick_CheckWeibo
    SkinBtn::onClick $1 $3
	StrCpy $Bool_Weibo 1
    ${NSD_CreateLabel} 273 163 300 15 "�ף���һ����,http://weibo.com/pylife"
    Pop $Lbl_Weibo
    SetCtlColors $Lbl_Weibo "" transparent ;�������͸��

	;�رհ�ť
  ${NSD_CreateButton} 495 10 15 15 ""
	Pop $Btn_Close
	StrCpy $1 $Btn_Close
	Call SkinBtn_Close
  GetFunctionAddress $3 onClickComplete
  SkinBtn::onClick $1 $3

  ;���
  ${NSD_CreateButton} 417 303 88 25 ""
	Pop $Btn_Complete
	StrCpy $1 $Btn_Complete
	Call SkinBtn_Complete
    GetFunctionAddress $2 onClickComplete
  SkinBtn::onClick $1 $2

	;��������ͼ
	${NSD_CreateBitmap} 0 0 100% 100% ""
  	Pop $BGImage
    ${NSD_SetImage} $BGImage $PLUGINSDIR\success.bmp $ImageHandle

	GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BGImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

;-------------------------------------------------------------------------------------------------------------

Section MainSetup
SectionEnd
