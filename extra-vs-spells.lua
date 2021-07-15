local _, T = ...

function table_print (tt, indent, done)
    done = done or {}
    indent = indent or 0
    if type(tt) == "table" then
      local sb = {}
      for key, value in pairs (tt) do
        table.insert(sb, string.rep (" ", indent)) -- indent it
        if type (value) == "table" and not done [value] then
          done [value] = true
          table.insert(sb, key .. " = {\n");
          table.insert(sb, table_print (value, indent + 2, done))
          table.insert(sb, string.rep (" ", indent)) -- indent it
          table.insert(sb, "}\n");
        elseif "number" == type(key) then
          table.insert(sb, string.format("\"%s\"\n", tostring(value)))
        else
          table.insert(sb, string.format(
              "%s = \"%s\"\n", tostring (key), tostring(value)))
         end
      end
      return table.concat(sb)
    else
      return tt .. "\n"
    end
end

function to_string( tbl )
    if  "nil"       == type( tbl ) then
        return tostring(nil)
    elseif  "table" == type( tbl ) then
        return table_print(tbl)
    elseif  "string" == type( tbl ) then
        return tbl
    else
        return tostring(tbl)
    end
end

T.MoreSpells = {
    [305]={type="nuke", target="enemy-back" ,damageATK=120},
    [315]={type="aura", target=1, damageATK1=150, duration=2, modDamageDealt=-30},
    [326]={type="nuke", target="cleave", damageATK=25},
    [327]={type="aura", target="all-other-allies", duration=3, plusDamageDealtATK=20},
    [328]={type="nuke", target=0, damageATK=30},
    [329]={type="aura", target=4, modDamageTaken=-50, duration=3},
    [330]={type="aura", target=4, duration=2, plusDamageDealtATK=25},
    [331]={type="aura", target="all-allies", plusDamageDealtATK=23, duration=3},
    [333]={type="aura", target=4, duration=3, modDamageDealt=40},
    [334]={type="nuke", target=0, damageATK=90},
    [335]={type="nuke", target="enemy-back", damageATK=40},
    [336]={type="heal", target=3, healATK=80},
    [337]={type="aura", target=1, duration=4, damageATK1=200, damageATK=40, noFirstTick=true},
    [338]={type="nuke", target=0, damageATK=50},
    [339]={type="nuke", target="all-enemies", damageATK=120, firstTurn=3},
    [345]={type="aura", target="all-allies" , duration=3 , modDamageTaken=-30},
    [346]={type="aura", target=0, duration=2, damageATK1=30, modDamageDealt=-1},
    [349]={type="nuke", target="all-enemies", damageATK=8},
}

if VenturePlan ~= nil then 
    for k,v in pairs(T.MoreSpells) do
        VenturePlan.KnownSpells[k] = v
    end
else 
    message("You are running an undoctored version of VenturePlan. Instructions on how to make this addon work are at https://github.com/hythloday/VenturePlanSoDMissions")
end

