require("objects/object")
require("util/resources")

Enemy = class("Entity", Object)

function Entity:__init(self)
    self.__init(self)
    self.health = 100;
    self.attackdamage = 1;
end

function Entity:attack(target)
    --attack animation / sounds
    target:damage(self.attackdamage)
end

function Entity:damage(dmg)
    self.health = self.health - dmg
end
