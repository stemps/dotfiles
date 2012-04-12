tell application "System Events"
  if UI elements enabled then
    set FrontApplication to (get name of every process whose frontmost is true) as string
    tell process FrontApplication
      click button 2 of window 1
      --button 2 is the green "zoom" button for all applications
      --window 1 is always the frontmost window.
    end tell
  else
    tell application "System Preferences"
      activate
      set current pane to pane "com.apple.preference.universalaccess"
      display dialog "UI element scripting is not enabled. Check 'Enable access for assistive devices'"
    end tell
  end if
end tell

