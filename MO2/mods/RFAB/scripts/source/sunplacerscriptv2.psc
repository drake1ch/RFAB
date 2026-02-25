Scriptname SunPlacerScriptV2 extends ObjectReference  

Spell Property SolFirestorm auto
Hazard Property Sol Auto
Hazard Property FireHazard Auto
Hazard Property FireHazardBig Auto
;Light property sollight auto
Int property delay auto
Objectreference sun
Objectreference Fire1
Objectreference Fire2
Objectreference Fire3
Objectreference Fire1b
Objectreference Fire2b
Objectreference Fire3b

Event Oninit()
sun = Self.placeatme(Sol)
Fire1 = Self.placeatme(FireHazard, 1, false, true)
Fire2 = Self.placeatme(FireHazard, 1, false, true)
Fire3 = Self.placeatme(FireHazard, 1, false, true)

int x1 = utility.randomint(-500, 500)
int x2 = utility.randomint(-500, 500)
int x3 = utility.randomint(-500, 500)

int y1 = utility.randomint(-500, 500)
int y2 = utility.randomint(-500, 500)
int y3 = utility.randomint(-500, 500)

Fire1.moveto(self, x1, y1, 0)
Fire2.moveto(self, x2, y2, 0)
Fire3.moveto(self, x3, y3, 0)
Fire1.enable()
Fire2.enable()
Fire3.enable()

Fire1b = Self.placeatme(FireHazardBig, 1, false, true)
Fire2b = Self.placeatme(FireHazardBig, 1, false, true)
Fire3b = Self.placeatme(FireHazardBig, 1, false, true)

int x1b = utility.randomint(-500, 500)
int x2b = utility.randomint(-500, 500)
int x3b = utility.randomint(-500, 500)

int y1b = utility.randomint(-500, 500)
int y2b = utility.randomint(-500, 500)
int y3b = utility.randomint(-500, 500)

Fire1b.moveto(self, x1b, y1b, 0)
Fire2b.moveto(self, x2b, y2b, 0)
Fire3b.moveto(self, x3b, y3b, 0)
Fire1b.enable()
Fire2b.enable()
Fire3b.enable()


registerforsingleupdate(delay)
Endevent

Event onupdate()
Fire1.disable()
Fire2.disable()
Fire3.disable()
Fire1b.disable()
Fire2b.disable()
Fire3b.disable()
Sun.disable()
Self.moveto(self, 0, 0, 250)
solfirestorm.cast(self)
self.disable()
endevent

