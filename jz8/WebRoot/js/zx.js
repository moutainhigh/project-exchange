
document.writeln("<span id=\"divPageLoadTime\"><\/span>");
document.writeln("<script language=\"javascript\" type=\"text\/javascript\"> ");
document.writeln("    var endT=new Date();var endTime=endT.getTime();var spTime=(endTime-beginTime);");
document.writeln("divPageLoadTime.innerHTML=\'Processed in \'+spTime+\'ms\';");
document.writeln("    <\/script>");
