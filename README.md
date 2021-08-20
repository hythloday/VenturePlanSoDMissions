# Addon sites

* [WowInterface](https://www.wowinterface.com/downloads/info26117-VenturePlanSoDMissions.html)

# #ActiBlizzWalkout

Full support and solidarity for the workers at Blizzard.

![I stand in solidarity with the workers of Activision Blizzard King and their demands](https://pbs.twimg.com/media/E7zWaEEVIBQfhas?format=jpg&name=900x900)

If you email me proof of a donation to any of their nominated charities (Black Girls CODE, Futures without Violence, Girls Who Code, RAINN, Women in Animation, Women in Games International) I'll match it.

# Legal stuff

VenturePlan does not expose any of its data to other addons, so to have this addon work, you will need to change it to do so. Note that VenturePlan does not have a a licence that permits you to alter its source code, and while it is legal to tinker with source code you're allowed to run in my jurisdiction, it may not be legal in yours. Consult a lawyer if you are worried. Obviously I don't encourage you to do so if it's not legal for you. In any case you should absolutely not redistribute the changes you've made.

In the US, see e.g. [Galoob v. Nintendo](https://www.lexisnexis.com/community/casebrief/p/casebrief-lewis-galoob-toys-inc-v-nintendo-of-am-inc), which found that you have the right to modify copyrighted software for personal use.

# Getting it running

To expose VenturePlan's internal data you will need to edit its source code. First, ensure that you are on the latest version, `4.16a`. Then open up `_retail_/Interface/AddOns/VenturePlan/vs.lua` in a text editor, and insert the line `_G[_] = T` in the first blank space. It should look like this when you're done:

![Notepad preview of changed file](img/notepad.png)

This makes the internal data of the addon (`T`) available to other addons (by putting it in the global table, `_G`, which every addon has available to it). In general you shouldn't be messing with addons like this, because it's a great way of getting hacked, but in this case there's no way around it. _caveat emptor_

# Hotfixing the Code for Renown Level 62 and Above

At renown level 62, you will gain your 21st companion. VenturePlan is coded to handle a maximum to 20 companions. You will start seeing errors about `self.info` being `nil`. To fix this, edit the file `_retail_/Interface/AddOns/VenturePlan/Widgets.lua`: change line 1960 (in version `4.16a`) from `for i=1,20 do` to `for i=1,99 do`. This will add support up to 99 companions.

After completing this change, the code should look like this:

```lua
s.companions = {}
for i=1,99 do
    t = CreateObject("FollowerListButton", f, false)
    t:SetPoint("TOPLEFT", ((i-1)%4)*76+14, -math.floor((i-1)/4)*72-130)
    s.companions[i] = t
end
```

# Contributing

If you have updates to the spell list you'd like to include (see `extra-vs-spells.lua`), please open a PR and I'll add them.

A helpful step in doing so is, if you find a missions that's mispredicted, run:

`/dump C_Garrison.GetMissionDeploymentInfo(CovenantMissionFrame:GetMissionPage().missionInfo.missionID)`

while you're looking at the mission.

## Contributors and thanks

Many thanks to:

* Neurotoxin001
* pyuuwz
* czullo
* bkifft
* flow0284
* zealvurte
* Jegethy
* siweia
* LostTemple1990
* epiktetov
* FlipperPA
* cremor

for contributions and support, as well as to the original author for a great addon.
