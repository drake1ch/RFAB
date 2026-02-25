Scriptname REQ_TemperedEquipment extends ActiveMagicEffect
{This script will temper the armor of the affected actor when it is first initialized}

Keyword[] Property Keywords Auto
{the keywords that should be tempered}
String[] Property quality Auto
{the quality tier that should be used for the keyword with the same index, as defined in datastorage}
REQ_TemperingData Property datastorage Auto
{the quest alias that contains all relevant data for tempering}
GlobalVariable Property Version_Installed Auto
{the global containing the version stamp of the esp}
GlobalVariable Property Version_Active Auto
{the global containing the version stamp of the savegame}


