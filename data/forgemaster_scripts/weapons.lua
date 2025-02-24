mods.inferno.weapon_functions:append({
  function(weapon,projectile)
    if weapon.name=="'Multiplicity' Barrage Laser" then
      local projectile_number=(weapon.numShots-weapon.queuedProjectiles:size())%weapon.numShots --modulus for when weapon fires fast enough to queue mroe shots
        if projectile_number<=5 then --projectiles that aim towards the targetted system, change visual here when possible

        elseif projectile_number<=12 then --make seven projectiles hit a random system
          local sys_list=Hyperspace.ships.enemy.vSystemList
          local system_target=sys_list[Hyperspace.random32()%sys_list:size()]
          projectile.target=system_target.location
        else  --make the rest hit a random room
          projectile.target=Hyperspace.ships.enemy:GetRandomRoomCenter()
        end
        projectile.entryAngle=-1 --Sets it to randomize on entry
    end
  end,

  function(weapon,projectile)
    if weapon.name=="Charge Sniper" then
      local boost=weapon.queuedProjectiles:size()
      projectile.damage.iDamage=projectile.damage.iDamage+(2*boost)
      projectile.damage.iShieldPiercing=projectile.damage.iShieldPiercing+boost
      projectile.speed_magnitude=projectile.speed_magnitude*(1+(boost/2))
      projectile.breachChance=math.floor(2.5*(boost+1))
      for i=1,boost do
        weapon.queuedProjectiles[i-1]:Kill()
      end
    end
  end,
})
