Scriptname RFAB_PapyrusFunctions hidden

function SetPlayerKnowsEnch(Enchantment ench, bool knows) global native

float function GetMagicSlowdown() global native 
{
- Возвращает силу замедления времени
}

function ScriptDamage(Actor akVictim, Actor akAttacker, float damage, string type = "none", bool applyCap = true) global native 
{
- применяет к akVictim скриптовый урон от имени akAttacker, учитывающий сопротивление цели и сложность игры, а также эффект бесплотности и tgm
- type указывает тип урона, доступные типы урона
- "", "none", "pure" - не сопротивляется ни о что
- "magic" - учитывает только сопротивление магии
- "physical" - учитывает броню согласно fArmorScalingFactor
- "fire" - учитывает сопротивление огню и сопротивление магии
- "frost" - учитывает сопротивление холоду и сопротивление магии
- "shock", "electric" - учитывает сопротивление электричеству и сопротивление магии
- "poison" - учитывает сопротивление яду и сопротивление магии
- "disease" - учитывает сопротивление болезням и сопротивление магии
- к перечисленным типам урона, начиная с "fire", можно дописать "pure" (например, "purefire" или "firepure"), тогда урон будет игнорировать сопротивление магии
- строчные и заглавные буквы в типах урона не влияют на выполнение скрипта
- в случае неправильного указания типа урона будет нанесет чистый урон и в консоль выведется соответствующее предупреждение
- applyCap заставляет применить кап сопротивлений или брони согласно fPlayerMaxResistance или fMaxArmorRating
}

function StopSound(int soundID) global native

function SetGlobalTimeMultiplier(float multiplier) global native
{
- Ставит множитель времени
}

function SetCameraDefaultSettings() global native
{
- Ставит настройки камеры от третьего лица в исходное положение
}
function SetCamera3rdPerson() global native
{
- Ставит камеру в положение от третьего лица
}
function SetCamera1stPerson() global native
{
- Ставит камеру в положение от первого лица
}
function LookAtYourself() global native
{
- Перемещает камеру на самого себя
- После использования НЕОБХОДИМО использовать SetCamera1stPerson, SetCamera3rdPerson или SetCameraDefaultSettings
}

Function SuppressHUDNotifications(bool suppress) global native
{
	
}
function SetOutfitAndRefresh(Actor akActor, Outfit akOutfit) global native
{
	
}
Actor Function CopyActor(Actor akActor) global native

Function ShowQuestNotification(string asText) global
	UI.InvokeString("HUD Menu", "_global.QuestNotification.AnimLetter.ShowQuestUpdate", asText)
EndFunction

function ResetVendorContainer(actor akRef) global native
{
- Позволяет обновить ассортимент продажи указанного торговца
}


function ResetContainer(objectreference akRef)  global native
{
- Позволяет обновить инвентарь НПС или содержимое контейнера
}


function RollDice(objectreference object) global native
{
- 
}

float function GetActorNumericMagickaRegen(actor akTarget) global native
{
- Возвращает числовую регенерацию жизни НПС (не процентную)
}

float function GetActorNumericStaminaRegen(actor akTarget) global native
{
- Возвращает числовую регенерацию жизни НПС (не процентную)
}

float function GetActorNumericHealthRegen(actor akTarget) global native
{
- Возвращает числовую регенерацию выносливости НПС (не процентную)
}

string[] function GetActiveEffectsTotalInfo(actor akTarget, string[] keywordStringFilter, string splitString) global native
{
- Сканирует все активные (без статуса Inactive) эффекты на цели, фильтрует их по кейвордам, указанным в keywordStringFilter, и выдает информацию по ним в виде строки с разделителем splitString
- Информация содержит имя эффекта, магнитуду, область, длительность и прошедшую длительность
- Пример: Восстановление здоровья|3|0|20|5
- Соответствует зелью восстановления здоровья с магнитудой 3, длительностью 20 секунд через 5 секунд после использования зелья
}


;float function GetActiveEffectDuration(activemagiceffect magicEffect) global native

activemagiceffect[] function GetActiveEffectsFromActor(actor akTarget) global native
{
- Возвращает массив всех активных эффектов (без статуса Inactive) на НПС
}

float function GetActorAlpha(actor akTarget)  global native
{
- Возвращает прозрачность НПС
}

int function GetTotalItemValue(form item) global native
{
- Возвращает полную стоимость предмета с учетом зачарования
}

bool function IsCommandedActor(Actor akTarget) global native
{ 
- Возвращает, есть ли у НПС командир
}

bool function IsSummonedActor(Actor akTarget) global native
{ 
- Возвращает, был ли призван НПС
}

float function GetTotalWeaponDamage(Actor akSource, bool bLeftHand = false) global native
{ 
- Возвращает текущий урон указаного актора с учетом всех модификаторов
- bLeftHand = false для правой рук
- bLeftHand = true для левой руки
}

Function InterruptCast(Actor akTarger, bool bRestoreMagicka = true) global native
{
- Отменяет каст заклинания указаному актору
- bRestoreMagicka = true мана за отмененный каст вернется
}

int Function GetCombatState(Actor akActor) global native
{
	Возвращает статус боя цели: 1 - вне боя, 2 - цель ищут, 3 - цель в бою
	Та же функция, что и в виджете
}

string Function GetNthSymbol(string asString, int aiIndex) global native

string Function GetLastSymbol(string asString) global native

string Function ToUpperCase(string asString) global native

string Function ToLowerCase(string asString) global native