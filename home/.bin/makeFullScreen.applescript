on run argv
  (*
    Toggle an application from full screen to non full screen (or the reverse).
    Parameters:
      1: application name(ie, Chrome)
      2: boolean (true/false).
         When true ensure that the application is in full screen mode (if not, make it so)
         When false ensure that the application is NOT in full screen mode (if not, make it so)
  *)
  set theapp to item 1 of argv
	if item 2 of argv is "false"
    set toggleOnFull to true
	else
    set toggleOnFull to false
	end if

  tell application theapp
    activate
    delay 2
    (* 
      Initially from http://stackoverflow.com/questions/8215501/applescript-use-lion-fullscreen
    *)
    set isfullscreen to false
    tell application "System Events" to tell process theapp
      set isfullscreen to value of attribute "AXFullScreen" of window 1
    end tell
    --display dialog "var " & isfullscreen

    if isfullscreen is toggleOnFull then
      tell application "System Events" to keystroke "f" using { command down, control down }
      delay 2
    end if
  end tell
end run