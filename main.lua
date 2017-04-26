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
local zones = require("zones")


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
  
  for n = 1, #Sprites.liste_murs do
    local s = Sprites.liste_murs[n]    
     -- print(s.id)
  end
end

function love.update(dt)
  
  Sprites.heros.hitBox.x = Sprites.heros.x
  Sprites.heros.hitBox.y = Sprites.heros.y + Sprites.heros.h - Sprites.heros.hitBox.h
  
  if outils.rectIntersect(Sprites.heros.hitBox, Sprites.base.hitBox) then
    Sprites.heros.vy = 0
  elseif outils.rectIntersect(Sprites.heros.hitBox, Sprites.plateforme.hitBox) then
      Sprites.heros.vy = 0
      Sprites.heros.x = Sprites.heros.x + Sprites.plateforme.vx
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
  
  Sprites.plateforme.x = Sprites.plateforme.x + ( Sprites.plateforme.vx * dt )
  if Sprites.plateforme.x > 127 or Sprites.plateforme.x < 0 then
    Sprites.plateforme.vx = - Sprites.plateforme.vx
    if Sprites.plateforme.x < 1 then
      Sprites.plateforme.x = 1
  elseif Sprites.plateforme.x > 126 then
    Sprites.plateforme.x = 126
    end    
  end 

end

function love.draw()
  
  -- Dessin du héros
  love.graphics.draw(Sprites.heros.image, Sprites.heros.x, Sprites.heros.y, 0,1,1 )
  love.graphics.draw(Sprites.point.image, Sprites.heros.x, Sprites.heros.y, 0,1,1)
  
  -- Dessin des plateformes
  love.graphics.draw(Sprites.base.image, Sprites.base.x, Sprites.base.y, 0,1,1)
  love.graphics.draw(Sprites.plateforme.image, Sprites.plateforme.x, Sprites.plateforme.y, 0,1,1)
  
  love.graphics.draw(Sprites.point.image, Sprites.base.x, Sprites.base.y, 0,1,1)
  love.graphics.draw(Sprites.point.image, Sprites.plateforme.x, Sprites.plateforme.y, 0,1,1)

  
  -- Dessin des murs
  local n  
  for n = 1, #Sprites.liste_murs do
    local s = Sprites.liste_murs[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 1, 1)
    
  end  
  
  for n = 1, #Sprites.liste_murs do
    local s = Sprites.liste_murs[n]    
      if outils.collision(Sprites.heros,s) then
        love.graphics.print("Collision")
      end
  end
  
  sDebug = "Debug: \n" .. "Héros x: " .. Sprites.heros.hitBox.x .. "\n" .. "Héros y: " .. Sprites.heros.hitBox.y
  sDebug = sDebug .. "\n" .. "Base x: " .. Sprites.base.hitBox.x .. "\n" .. "Base y: " .. Sprites.base.hitBox.y
  love.graphics.print(sDebug, 0, 520)
  
end

function love.keypressed(key)
  
end
