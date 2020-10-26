-- update: 26/10/2020 14:13
function getCoord(x,y,r,an)
  coord={}
  coord.x = x + math.sin(an) * r
  coord.y = y + math.cos(an) * r
  return coord
end
function drawRadar(width,height,rayon,color,time)
  delay(time)
  r = rayon
  x = width/2
  y = height/2
  alpha(0.5)
  
  for i=1,360,1 do
    an = math.rad(i) -- angle
    c = getCoord(x,y,r,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+10,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+20,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+30,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+40,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+50,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+60,an)
    point(c.x,c.y,color)
    c = getCoord(x,y,r+70,an)
    point(c.x,c.y,color)
    render()
  end
end
function drawRay(width,height,rayon,color,time)
  delay(time)
  r = rayon
  x = width/2
  y = height/2
  alpha(0.3)
  
  for i=1,720,1 do
    an = math.rad(i) -- angle
    c = getCoord(x,y,r,an)
    line(x,y,c.x,c.y,color)
    if i>15 then
      an = math.rad(i-15) -- angle
      d = getCoord(x,y,r,an)
      line(x,y,d.x,d.y,0)
    end
    if i==360 then
      alpha(1)
      drawTarget(color)
      alpha(0.5)
    end
    render()
  end
end
function wait(time)
  delay(time)
  render()
end
function drawTarget(color)
  line(80,0,80,10,color) --tp
  line(80,150,80,160,color) --bt
  line(0,80,10,80,color) --lt
  line(150,80,160,80,color) --rt
  line(80,77,80,83,color) --ctv
  line(77,80,83,80,color) --cth
end
function drawFrame(color)
  line(0,0,160,0,color) --tp
  line(0,159,160,159,color) --bt
  line(0,1,0,160,color) --lt
  line(159,0,159,160,color) --rt
end
-- draw
function draw()
  -- Drawing --
  clear()
  ray=10
  wi=160
  he=160
  col=11

  drawFrame(col)
  drawTarget(col)
  drawRadar(wi,he,ray,col,16)
  drawRay(wi,he,ray+70,col,16)
  --[[clear()
  palette(10,"ff0000")
  drawFrame(10)
  drawTarget(10)
  drawRadar(wi,he,ray,10,16)
  render()
  ]]
end
