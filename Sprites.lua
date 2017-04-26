local Sprites = {}


-- Creation du joueur
Sprites.heros = {}
Sprites.heros.x = 700
Sprites.heros.y = 540
Sprites.heros.vy = 0
Sprites.heros.image = love.graphics.newImage("images/heros.png")
Sprites.heros.l = Sprites.heros.image:getWidth()
Sprites.heros.h = Sprites.heros.image:getHeight()

-- Creation de sa hitbox pour savoir s'il repose sur une plateforme
Sprites.heros.hitBox = {}
Sprites.heros.hitBox.x = 0
Sprites.heros.hitBox.y = 0
Sprites.heros.hitBox.image = love.graphics.newImage("images/hitbox.png")
Sprites.heros.hitBox.l = Sprites.heros.image:getWidth()
Sprites.heros.hitBox.h = Sprites.heros.image:getHeight()






return Sprites