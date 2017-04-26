-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- On récupère les fichiers externes 
local grille = require("niveau")
local outils = require("outils")
local Sprites = require("Sprites")
local liste_murs = {}
local nombreMurs = 0
-- Point pour réglages
local point = {}
point.image = love.graphics.newImage("images/point.png")

-- Creation de la base de départ
local base = {}
base.x = 680
base.y = 560
base.image = love.graphics.newImage("images/base.png")
base.l = base.image:getWidth()
base.h = base.image:getHeight()

-- Creation de la plateforme de fin
local plateforme = {}
plateforme.x = 100
plateforme.y = 500
plateforme.vx = 180
plateforme.image = love.graphics.newImage("images/base.png")
plateforme.l = plateforme.image:getWidth()
plateforme.h = plateforme.image:getHeight()

local arrivee = {}
arrivee.x = plateforme.x
arrivee.y = plateforme.y
arrivee.l = plateforme.image:getWidth()
arrivee.h = 5

--local mur = {}
-- Fonction qui gère la création des murs
function Sprites.CreeMur(pX, pY) 
  
  nombreMurs = nombreMurs + 1
  mur = {}  
  mur.x = pX
  mur.y = pY
  mur.supprime = false
  mur.image = love.graphics.newImage("images/mur.png")
  mur.l = mur.image:getWidth()
  mur.h = mur.image:getHeight()
  mur.id = nombreMurs  
  
  table.insert(liste_murs, mur)  
end






-- Fonction qui gère les collisions entre le joueur et les plateformes


function collisions(joueur, plateforme)
  local sommetPlateforme = {}
  sommetPlateforme.x = plateforme.x
end



function love.load()
  
  
  
  love.window.setTitle("Jeu du pouce")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
    
  local ligne, colonne
  local bx, by = 0, 0
  for ligne = 1, 30 do
    bx = 0
    for colonne = 1, 40 do
      if grille[ligne][colonne] == 1 then
        Sprites.CreeMur(bx , by )
      end
      bx = bx + 20
    end
    by = by + 20
  end
  
  for n = 1, #liste_murs do
    local s = liste_murs[n]    
     -- print(s.id)
  end
  
 


end

function love.update(dt)
  
  if collide(Sprites.heros, base) then
    Sprites.heros.vy = 0
  elseif collide(Sprites.heros, arrivee) then
      Sprites.heros.vy = 0
      Sprites.heros.x = Sprites.heros.x + plateforme.vx
  else      
    Sprites.heros.vy = Sprites.heros.vy + 0.4 * dt
    Sprites.heros.y = Sprites.heros.y + Sprites.heros.vy
  end
  
  if love.keyboard.isDown("right") then
    Sprites.heros.x = Sprites.heros.x + 120 * dt
  end

  if love.keyboard.isDown("left") then
    Sprites.heros.x = Sprites.heros.x - 120 * dt
  end
  
  if love.keyboard.isDown("up") then
    Sprites.heros.y = Sprites.heros.y - 120 * dt
    Sprites.heros.vy = 0
  end

    
  
  plateforme.x = plateforme.x + ( plateforme.vx * dt )
  if plateforme.x > 127 or plateforme.x < 0 then
    plateforme.vx = - plateforme.vx
    if plateforme.x < 1 then
      plateforme.x = 1
  elseif plateforme.x > 126 then
    plateforme.x = 126
    end    
  end 

end

function love.draw()
  
  -- Dessin du héros
  love.graphics.draw(Sprites.heros.image, Sprites.heros.x, Sprites.heros.y, 0,1,1 )
  love.graphics.draw(point.image, Sprites.heros.x, Sprites.heros.y, 0,1,1)
  
  -- Dessin des plateformes
  love.graphics.draw(base.image, base.x, base.y, 0,1,1)
  love.graphics.draw(plateforme.image, plateforme.x, plateforme.y, 0,1,1)
  
  love.graphics.draw(point.image, base.x, base.y, 0,1,1)
  love.graphics.draw(point.image, plateforme.x, plateforme.y, 0,1,1)

  
  -- Dessin des murs
  local n  
  for n = 1, #liste_murs do
    local s = liste_murs[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 1, 1)
    
  end  
  
  for n = 1, #liste_murs do
    local s = liste_murs[n]    
      if collide(Sprites.heros,s) then
        love.graphics.print("Collision")
      end
  end
  
  sDebug = "Debug: \n" .. 
  
  love.graphics.print(sDebug, 0, 520)
  
end

function love.keypressed(key)
  
end
