local Sprites = {}

-- Creation du joueur
Sprites.heros = {}
Sprites.heros.x = 700
Sprites.heros.y = 540
Sprites.heros.vy = 0
Sprites.heros.image = love.graphics.newImage("images/heros.png")
Sprites.heros.l = Sprites.heros.image:getWidth()
Sprites.heros.h = Sprites.heros.image:getHeight()

-- Creation de la hitbox du joueur
Sprites.heros.hitBox = {}
Sprites.heros.hitBox.x = 0
Sprites.heros.hitBox.y = 0
Sprites.heros.hitBox.image = love.graphics.newImage("images/hitbox.png")
Sprites.heros.hitBox.l = Sprites.heros.image:getWidth()
Sprites.heros.hitBox.h = Sprites.heros.hitBox.image:getHeight()

-- Creation de la base de départ
Sprites.base = {}
Sprites.base.x = 680
Sprites.base.y = 560
Sprites.base.image = love.graphics.newImage("images/base.png")
Sprites.base.l = Sprites.base.image:getWidth()
Sprites.base.h = Sprites.base.image:getHeight()

-- Création de la hitbox de la base de départ
Sprites.base.hitBox = {}
Sprites.base.hitBox.x = Sprites.base.x
Sprites.base.hitBox.y = Sprites.base.y
Sprites.base.hitBox.image = love.graphics.newImage("images/hitbox.png")
Sprites.base.hitBox.l = Sprites.base.hitBox.image:getWidth()
Sprites.base.hitBox.h = Sprites.base.hitBox.image:getHeight()

-- Creation de la plateforme de fin
Sprites.plateforme = {}
Sprites.plateforme.x = 100
Sprites.plateforme.y = 500
Sprites.plateforme.vx = 180
Sprites.plateforme.image = love.graphics.newImage("images/base.png")
Sprites.plateforme.l = Sprites.plateforme.image:getWidth()
Sprites.plateforme.h = Sprites.plateforme.image:getHeight()

-- Création de la hitbox de la plateforme de fin
Sprites.plateforme.hitBox = {}
Sprites.plateforme.hitBox.x = 0
Sprites.plateforme.hitBox.y = 0
Sprites.plateforme.hitBox.image = love.graphics.newImage("images/hitbox.png")
Sprites.plateforme.hitBox.l = Sprites.plateforme.hitBox.image:getWidth()
Sprites.plateforme.hitBox.h = Sprites.plateforme.hitBox.image:getHeight()

-- Point pour réglages
Sprites.point = {}
Sprites.point.image = love.graphics.newImage("images/point.png")

-- Table contenant tous les murs du jeu
Sprites.liste_murs = {}

-- Fonction qui gère la création des murs
function Sprites.CreeMur(pX, pY) 
  
  mur = {}  
  mur.x = pX
  mur.y = pY
  mur.supprime = false
  mur.image = love.graphics.newImage("images/mur.png")
  mur.l = mur.image:getWidth()
  mur.h = mur.image:getHeight()
    
  table.insert(Sprites.liste_murs, mur)
  
end
--


return Sprites