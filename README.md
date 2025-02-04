# dla-fixer

Drive letters of removable media are heavily inconsitent on windows machines.
Not adhering to a specific order of plug-out and plug-in may alter the resulting drive letter.
Since most programs address a drive by its assigned letter, failure may occur.

This short script changes the letter of a connected drive according to its label.
Configure the drive label and the expected drive letter in the config.json and either run this script periodically or before critical operations, where correct drive letters are necessary.