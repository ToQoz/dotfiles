hs.hotkey.bind({}, ';', function()
  hs.eventtap.keyStrokes(':')
end)

hs.hotkey.bind({'shift'}, ';', function()
  hs.eventtap.keyStrokes(';')
end)
