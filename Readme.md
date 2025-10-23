This is a fork of [MarcelineVQ version](https://github.com/MarcelineVQ/CallOfElements)

# Features
* Supports dropping all totems with 1 click if [nampower](https://gitea.com/avitasia/nampower) mod is installed. If not, you have to click the button 4 times.
* Shows when a totem is out of range. If you have [superWoW](https://github.com/balakethelock/SuperWoW) mod installed it will work on all totems, if not it will only work on totems that give you a buff.
* Option to show reminder to recall totems when they are all out of range. Only works for totems that give you a buff if superWoW is not installed.
* Totemic Recall button included with dedicated key binding. Off by default, toggle on in settings.
* Right click any anchor button to quickly switch set or access config dialog.
* Ctrl-clicking a totem not in current set will drop and move it to current set.
* SuperWow only: Config option to re-drop active totems if they're more then 20y away.
* Bug fixes: Timers will reset if a totem is destroyed. Improved performance by fixing a bug that made buttons update to frequently.

# CallOfElements for vanilla WOW

This is an All-In-One Shaman class addon for World Of Warcraft.
Currently, it features a complete totem module to simplify totem usage
and increase your efficiency in party and in PVP.
Yet to come are a healing module and some miscellanous options that
help with different tasks.

The totem module provides you with customizable frames that hold all
of your totems separated by element and work just like a standard action bars. 
In addition, each totem has its own timer that displays how long the totem 
will still be active. When there are only 10 or 5 seconds left or when
the totem expires, a notification is shown in the screen center.
Furthermore you are able to create your own totem sets which hold a totem
of each element that can be cast using only one command or button. 
There is also one predefined set for each class that is automatically 
activated in pvp when you target a hostile player of the corresponding class. 

# Commands

`/coe` or `/coe config` - Shows the configuration dialog
`/coe list` or `/coe help` - Shows list of all commands
`/coe nextset` - Switches to the next custom totem set or the default set
`/coe priorset` - Switches to the prior custom totem set or the default set
`/coe set <name>` - Switches to set with the specified name. <name> is case-sensitive
`/coe restartset` - Next time you throw the active set, it recasts all totems
`/coe reset` - Resets all timers and the active set
`/coe resetframes` - Returns all element bars to the screen center
`/coe resetordering` - Resets the ordering of your totem bars
`/coe reload` - Reloads all totems and sets

The following commands only work as macros dragged to your action bars:
`/coe throwset <name?>`- Throws the active totem set or named set if specificed
`/coe forcethrowset <name?>` - Will refresh existing totems regardless of settings
`/coe advised` - Throws the next advised totem

# Basic install instructions

- Extract the archive
- Copy "CallOfElements" folder into your "\<WOW FOLDER>/Interface/Addons/" directory
