local outils = {}

-- Fonction qui définit si un nom est dans un éventail de nombres
function outils.inRange(nombre, min, max)
  return nombre >= math.min(min, max) and nombre <= math.max(min, max)
end

-- Fonction qui définit si deux éventails se superposent
function outils.rangeIntersect(min0, max0, min1, max1)
  return math.max(min0, max0) >= math.min(min1, max1) and 
         math.min(min0, max0) <= math.max(min1, max1);
end

-- Fonction qui définit si deux rectangles se chevauchent
function outils.rectIntersect(r0, r1)
  return outils.rangeIntersect(r0.x, r0.x + r0.l, r1.x, r1.x + r1.l) and
         outils.rangeIntersect(r0.y, r0.y + r0.h, r1.y, r1.y + r1.h)
end      

-- Fonction qui détermine s'il y a collision entre les objects rectangulaires (joueurs, murs, hitboxes)
function outils.collision(rect1, rect2)
 if (rectrect1==rect2) then return false end
 local dx = rect1.x - rect2.x
 local dy = rect1.y - rect2.y
 if (math.abs(dx) < (rect1.l + rect2.l) / 2 ) then
  if (math.abs(dy) < (rect1.h + rect2.h) / 2 ) then
   return true
  end
 end
 return false
end
-- FIN --





return outils
   