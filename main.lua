-- Cette ligne permet d'afficher des traces dans la console pendant l'execution
io.stdout:setvbuf('no')
--[[

local c = math.floor( balle.x / brique.largeur ) + 1
  local l = math.floor( balle.y / brique.hauteur ) + 1
  
  if l >= 1 and l <= #niveau and c >= 1 and c <= 15 then
    if niveau[l][c] == 1 then
      balle.vy = 0 - balle.vy
      niveau[l][c] = 0
    end
  end
  
  
  
  if balle.x > largeur - balle.rayon then
    balle.vx = 0 - balle.vx
    balle.x = largeur - balle.rayon
  end
  
  if balle.x < 0 + balle.rayon then
    balle.vx = 0 - balle.vx
    balle.x = 0 + balle.rayon
  end
  
  if balle.y < 0 + balle.rayon then
    balle.vy = 0 - balle.vy
    balle.y = 0 + balle.rayon
  end
  
  if balle.y > hauteur then
    balle.collee = true
  end
  
  local collisionYPadBalle = pad.y - ( pad.hauteur / 2 ) -- balle.rayon
  if balle.y > collisionYPadBalle then
    local distXBallePad = balle.x - pad.x
    if distXBallePad < pad.largeur and distXBallePad >= 0 then
      balle.vy = 0 - balle.vy
      balle.y = collisionYPadBalle
    end
  end
  ]]--  
 
 


require("niveau")
local Lander = {}
Lander.x = 0
Lander.y = 0
Lander.angle = 270
Lander.speed = 1
Lander.vx = 0
Lander.vy = 0
Lander.img = love.graphics.newImage("images/ongle_petit.png")
Lander.imgEngine = love.graphics.newImage("images/engine2.png")
Lander.engineOn = false

local base = {}
base.img = love.graphics.newImage("images/base.png")
base.x = 0
base.y = 0

local tunnel = love.graphics.newImage("images/tunnel_fin.png")



      

local bloc = {}
bloc.largeur = 20
bloc.hauteur = 20
bloc.x = 0
bloc.y = 0


--[[function dessinGrille()
  grille = {}
  local ligne, colonne
  for ligne = 1, 60 do
    grille[ligne] = {}
    for colonne = 1, 80 do
      grille[ligne][colonne] = 1
    end
  end
  
end]]--

  

function love.load()
  
  --dessinGrille()
  base.x = 60
  base.y = 560
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Lander.x = 740 --largeur - Lander.img:getWidth()
  Lander.y = 580 --hauteur - Lander.img:getHeight()
end

function love.update(dt) 
  
  
  --Lander.vy = Lander.vy + 0.1 * dt -- Force de la gravité
  Lander.y = Lander.y + Lander.vy -- Application de la gravité sur l'axe y
  
  if love.keyboard.isDown("right") then
    --Lander.angle = Lander.angle + (180 * dt)
    --if Lander.angle > 360 then Lander.angle = 0 end
    --Lander.vx = Lander.vx + ( 1 * dt )
    Lander.x = Lander.x + ( 60 * dt )
  end
  
  if love.keyboard.isDown("left") then
    --Lander.angle = Lander.angle - (180 * dt)
    --if Lander.angle < 0 then Lander.angle = 360 end
    --Lander.vx = Lander.vx - ( 1 * dt )
    Lander.x = Lander.x - ( 60 * dt )
  end
  
  if love.keyboard.isDown("up") then
    Lander.engineOn = true
    
    --[[local angle_radian = math.rad(Lander.angle)
    local force_x = math.cos(angle_radian) * ( Lander.speed * dt )
    local force_y = math.sin(angle_radian) * ( Lander.speed * dt )
    Lander.vx = Lander.vx + force_x
    Lander.vy = Lander.vy + force_y]]--
    Lander.vy = 0
    Lander.y = Lander.y - ( 60 * dt )
    
    
  else 
    Lander.engineOn = false
    
  end
  
  if math.abs(Lander.vy) > Lander.speed then
    if Lander.vy > 0 then
      Lander.vy = Lander.speed
    else
      Lander.vy = -(Lander.speed)
    end
  end

end

function love.draw()  
  love.graphics.draw(Lander.img, Lander.x, Lander.y, 
    math.rad(Lander.angle), 1, 1, Lander.img:getWidth()/2, Lander.img:getHeight()/2)
  
  if Lander.engineOn == true then
    love.graphics.draw(Lander.imgEngine, Lander.x, Lander.y, 
    math.rad(Lander.angle), 1, 1, Lander.imgEngine:getWidth()/2, Lander.imgEngine:getHeight()/2)     
  end
  
  love.graphics.draw(base.img, base.x, base.y)
  
  
  local ligne, colonne
  local bx, by = 0, 0
  for ligne = 1, 30 do
    bx = 0
    for colonne = 1, 40 do
      if grille[ligne][colonne] == 1 then
        love.graphics.rectangle("fill", bx, by, bloc.hauteur, bloc.largeur)
      end
      bx = bx + bloc.largeur
    end
    by = by + bloc.hauteur
  end
  
 
    
  
  
  sDebug = "Debug:"
  sDebug = sDebug.." angle= " .. tostring(Lander.angle)
  sDebug = sDebug .. " vitesse = " .. tostring((math.abs(Lander.vx) + math.abs(Lander.vy)) )
  --love.graphics.print(sDebug, 0, 0)
end