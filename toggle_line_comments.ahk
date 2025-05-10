; Simple script that assigns a hotkey to
; comment or uncomment a line inside a file
; intended for use with apps that allow for dynamic config changes
; e.g. EqualizerAPO with "Instant mode" on
; made by: Myster, ft. ChatGPT for the ToggleInclude function
; version: 2025-05-08

#SingleInstance Force
#Persistent
SendMode Input

; lines to toggle comments for
lines_list := ["Include: piano-switch-channels.txt", "Include: piano-speaker.txt", "Include: piano-microphone.txt"]

; files to choose from
files_list := ["A:\PlikiAplikacji\System\EqualizerAPO\config\config.txt"]

; [Win] + [F keys]
#F1::ToggleInclude(files_list[1], lines_list[1])
#F2::ToggleInclude(files_list[1], lines_list[2])
#F3::ToggleInclude(files_list[1], lines_list[3])
#F4::ToggleInclude(files_list[1], lines_list[4])
#F5::ToggleInclude(files_list[1], lines_list[5])
#F6::ToggleInclude(files_list[1], lines_list[6])
#F7::ToggleInclude(files_list[1], lines_list[7])
#F8::ToggleInclude(files_list[1], lines_list[8])
#F9::ToggleInclude(files_list[1], lines_list[9])
#F10::ToggleInclude(files_list[1], lines_list[10])
#F11::ToggleInclude(files_list[1], lines_list[11])
#F12::ToggleInclude(files_list[1], lines_list[12])
#F13::ToggleInclude(files_list[1], lines_list[13])
#F14::ToggleInclude(files_list[1], lines_list[14])
#F15::ToggleInclude(files_list[1], lines_list[15])
#F16::ToggleInclude(files_list[1], lines_list[16])
#F17::ToggleInclude(files_list[1], lines_list[17])
#F18::ToggleInclude(files_list[1], lines_list[18])
#F19::ToggleInclude(files_list[1], lines_list[19])
#F20::ToggleInclude(files_list[1], lines_list[20])
#F21::ToggleInclude(files_list[1], lines_list[21])
#F22::ToggleInclude(files_list[1], lines_list[22])
#F23::ToggleInclude(files_list[1], lines_list[23])
#F24::ToggleInclude(files_list[1], lines_list[24])

ToggleInclude(file, line) {
    if !(file and line)
        Return
    FileRead, file_data, %file%
    commented_line := "# " . line

    ; Toggle comment
    If InStr(file_data, commented_line)
        file_data := StrReplace(file_data, commented_line, line)
    Else If InStr(file_data, line)
        file_data := StrReplace(file_data, line, commented_line)

    ; Write modified content back to file
    FileDelete, %file%
    FileAppend, %file_data%, %file%

    ; Show tooltip with status
    If InStr(file_data, commented_line)
        Tooltip, %line% OFF
    Else If InStr(file_data, line)
        Tooltip, %line% ON
    Else
        Tooltip
    SetTimer, RemoveTooltip, -2000
    Return
}

RemoveTooltip:
    Tooltip
Return

