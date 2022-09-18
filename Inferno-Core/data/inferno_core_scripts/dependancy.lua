mods.inferno={}



mods.inferno.vter=function(cvec)
  local i=-1 --so the first returned value is indexed at zero
  local n=cvec:size()
  return function ()
      i=i+1
      if i<n then return cvec[i] end
  end
end

mods.inferno.repair=function()
  for system in mods.inferno.vter(Hyperspace.ships.player.vSystemList) do
    system.healthState.first=system.healthState.second
  end
end

script.on_load(
function()
  --Creating a global variable with our addon's information,
  --so that dependancies can be checked when the game loads
  _G["INFERNO_CORE_INFO"]={
      version="0.5",--No idea what number to put here
      }
  if _G["FORGEMASTER_INFO"] then
    Hyperspace.ErrorMessage("Forgemaster was patched before Inferno-Core! Please re-patch your mods, and make sure to put Inferno-Core first!")
  end

  if _G["TCC_INFO"] then
    Hyperspace.ErrorMessage("Trash Compactor Collection was patched before Inferno-Core! Please re-patch your mods, and make sure to put Inferno-Core first!")
  end
end
)
