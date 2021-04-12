state("Mad Games Tycoon 2")
{
  long money : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x2EC, 0x180;
  float dayTimer : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x2EC, 0x1E4;
  float devPoints_Gesamt : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x308, 0x30, 0x10, 0x20C;
  bool isPlayerGame : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x308, 0x30, 0x10, 0xCC;
}

// Only for debugging reasons
// update
// {
//   print("current money is : " + (current.money) + " and splits is " + vars.splits);
// }

startup
{
  settings.Add("autostart", true, "Automatically start the run");
  settings.SetToolTip("autostart", "Starts the run after the \"this game is in early access\" message is clicked away.");

  settings.Add("finish_first_game", true, "Finish first game");
  settings.SetToolTip("finish_first_game", "Splits after the developer has worked through all points of his first game.");

  settings.Add("50_mil_category", false, "Get 50 million category");
  settings.SetToolTip("50_mil_category", "Splits after your studio has 1, 5, 10, 25 and 50 million dollar.");
  // These will come later
  // settings.Add("split_after_1mil", false, "Split after getting 1 Million", "50_mil_category");
  // settings.Add("split_after_1mil", false, "Split after getting 5 Million", "50_mil_category");
  // settings.Add("split_after_1mil", false, "Split after getting 10 Million", "50_mil_category");
  // settings.Add("split_after_1mil", false, "Split after getting 25 Million", "50_mil_category");
}

init
{
  vars.splits = 0;
}

start {
  if(settings["autostart"] && current.dayTimer > 0 && old.dayTimer == 0) {
    vars.splits = 0;
    return true;
  }
}

split
{
  if(settings["finish_first_game"] && current.devPoints_Gesamt == 0 && current.isPlayerGame) {
    return true;
  }

  if(settings["50_mil_category"]) {
    if(vars.splits == 0) {
      if(current.money > 1000000) {
        vars.splits++;
        return true;
      } 
    } else if(vars.splits == 1) {
      if(current.money > 5000000) {
        vars.splits++;
        return true;
      } 
    } else if(vars.splits == 2) {
      if(current.money > 10000000) {
        vars.splits++;
        return true;
      } 
    } else if(vars.splits == 3) {
      if(current.money > 25000000) {
        vars.splits++;
        return true;
      } 
    } else if(vars.splits == 4) {
      if(current.money > 50000000) {
        vars.splits++;
        return true;
      } 
    }
  }
}