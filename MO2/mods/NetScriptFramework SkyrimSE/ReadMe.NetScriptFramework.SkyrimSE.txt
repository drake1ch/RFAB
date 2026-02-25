This is the .NET framework for Skyrim SE (https://www.nexusmods.com/skyrimspecialedition/mods/21294)

1. Requirements
DLL Plugin Loader - https://www.nexusmods.com/skyrimspecialedition/mods/10546
or
SSE Engine Fixes skse64 Preloader - https://www.nexusmods.com/skyrimspecialedition/mods/17230

2. Installation
Extract contents of the ZIP to /Data/ directory or use a mod manager. Mod managers that use virtual file system are supported.

3. Uninstallation
Partial uninstallation - remove the file /Data/DLLPlugins/NetScriptFramework.Runtime.dll, after doing so the framework and none of its plugins will be loaded by game
Full uninstallation - remove the file mentioned above and delete /Data/NetScriptFramework/ directory or use your mod manager to uninstall

4. Troubleshooting
If you run into any errors or issues check /Data/NetScriptFramework/NetScriptFramework.log.txt file. If the file is empty then the framework was never loaded at all, in that case create a new file called binkw64.log in your main Skyrim SE directory (where SkyrimSE.exe is) and run the game again then check that file. If you encounter an issue you can't solve ask your question in the nexus page of the mod.
