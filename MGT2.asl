state("Mad Games Tycoon 2")
{
  long money : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x2EC, 0x180;
  float dayTimer : "mono-2.0-bdwgc.dll", 0x3A1C68, 0x5C, 0x2EC, 0x1E4;
}

// Only for debugging reasons
// update
// {
//   print("current money is : " + (current.money));
// }

startup
{
  vars.splits = 0;
}

start {
  if(current.dayTimer > 0 && old.dayTimer == 0) {
    vars.splits = 0;
    return true;
  }
}

split
{
  switch(vars.splits) {
    case 0:
      if(current.money > 1000000) {
        vars.splits++;
        return true;
      }
      break;
    case 1:
      if(current.money > 5000000) {
        vars.splits++;
        return true;
      }
      break;
    case 2:
      if(current.money > 10000000) {
        vars.splits++;
        return true;
      }
      break;
    case 3:
      if(current.money > 25000000) {
        vars.splits++;
        return true;
      }
      break;
    case 4:
      if(current.money > 50000000) {
        vars.splits++;
        return true;
      }
      break;
  }
}