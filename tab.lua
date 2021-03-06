CANCEL_DELAY_SECONDS = 0.15
tabKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function ()
  sendTab = false
end)
delayedEnable = hs.timer.delayed.new(0, function () tabHotKey:enable() end) -- there is a nominal delay after doing hs.hotkey:enable(), but setting it to 0 seems to suffice
function tabDown (event)
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.fn, true):post()
    sendTab = true
    tabKeyTimer:start() -- start tabkey timer.
end
function tabUp (event)
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.fn, false):post()
    if sendTab then
      tabHotKey:disable() -- temporarily disable so we can send an actual tab
      hs.timer.doAfter(0, function () -- there is a nominal delay after doing hs.hotkey:disable(), but setting it to 0 seems to suffice
	      hs.eventtap.keyStroke({}, 'tab', 0)
	      delayedEnable:start()
      end)
    end
    tabKeyTimer:stop()
end

tabHotKey = hs.hotkey.new('', hs.keycodes.map.tab, tabDown, tabUp, nil)
tabHotKey:enable()
