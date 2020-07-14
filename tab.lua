CANCEL_DELAY_SECONDS = 0.15
tabKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function ()
  sendTab = false
end)
delayedEnable = hs.timer.delayed.new(0, function () tabHotKey:enable() end)
function tabDown (event)
  if not TabState == true then
    TabState = true
    print("tabDown")
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.fn, true):post()
    sendTab = true
    tabKeyTimer:start() -- start tabkey timer.
  else
  end
end
function tabUp (event)
  if TabState == false then
    return -- don't do anything
    -- this disables key repeat
  end
  TabState = false
  print("tabUp")
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.fn, false):post()
    if sendTab then
      tabHotKey:disable()
      hs.timer.doAfter(0, function ()
	      print("sending tab")
	      hs.eventtap.keyStroke({}, 'tab')
	      delayedEnable:start()
      end)
    end
    tabKeyTimer:stop()
end

tabHotKey = hs.hotkey.new('', hs.keycodes.map.tab, tabDown, tabUp, nil)
tabHotKey:enable()
