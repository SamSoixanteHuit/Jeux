local outils = {}

function outils.inRange(nombre, min, max)
  return nombre >= math.min(min, max) and nombre <= math.max(min, max)
end


function outils.rangeIntersect(min0, max0, min1, max1)
  return math.max(min0, max0) >= math.min(min1, max1) and 
         math.min(min0, max0) <= math.max(min1, max1);
end


function outils.rectIntersect(r0, r1)
  return outils.rangeIntersect(r0.x, r0.x + r0.largeur, r1.x, r1.x + r1.largeur) and
         outils.rangeIntersect(r0.y, r0.y + r0.hauteur, r1.y, r1.y + r1.hauteur)
end      


-- Fonction qui gère les collisions entre le joueur et les murs
function collide(a1, a2)
 if (a1==a2) then return false end
 local dx = a1.x - a2.x
 local dy = a1.y - a2.y
 if (math.abs(dx) < a1.l + a2.l) then
  if (math.abs(dy) < a1.h + a2.h) then
   return true
  end
 end
 return false
end


return outils
   