class DayZTool: WorkbenchPlugin
{
	void RunCustomCommand(string cmd){
		Print(cmd);
		Workbench.RunCmd(cmd);
	}
	
	override void Configure() 
	{
		Workbench.ScriptDialog("Mission directory","", this);
	}
	
	[ButtonAttribute("OK")]
	void DialogOk()
	{
	}
};

[WorkbenchPluginAttribute("DayZ Restart Client/Server", "Just for testing", "ctrl+1", "", {"ScriptEditor"})]
class StartClientServerDayzTool: DayZTool
{
	[Attribute("P:/StartDebugAll.bat", "fileeditbox", "Path to missions dir", "")]
	string RestartCmd;
	
	override void Run()
	{
		RunCustomCommand(RestartCmd);
	}
}

[WorkbenchPluginAttribute("DayZ Kill Client/Server", "Just for testing", "ctrl+2", "", {"ScriptEditor"})]
class KillClientServerDayzTool: DayZTool
{
	[Attribute("P:/StopDebugAll.bat", "fileeditbox", "Path to missions dir", "")]
	string StopCmd;
	
	override void Run()
	{
		RunCustomCommand(StopCmd);
	}
}

[WorkbenchPluginAttribute("DayZ Run Client", "Just for testing", "ctrl+3", "", {"ScriptEditor"})]
class RunDayzClientTool: DayZTool
{
	[Attribute("P:/StartDebugClient.bat", "fileeditbox", "Path to missions dir", "")]
	string RunClientCmd;
	
	override void Run()
	{
		RunCustomCommand(RunClientCmd);
	}
}

[WorkbenchPluginAttribute("DayZ Run Server", "Just for testing", "ctrl+4", "", {"ScriptEditor"})]
class RunDayzServerTool: DayZTool
{
	[Attribute("P:/StartDebugServer.bat", "fileeditbox", "Path to missions dir", "")]
	string RunServerCmd;
	
	override void Run()
	{
		RunCustomCommand(RunServerCmd);
	}
}