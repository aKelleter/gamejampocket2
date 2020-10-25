-- update: 25/10/2020 21:05
function getCoord(x,y,r,an)
  coord={}
  coord.x = x + math.sin(an) * r
  coord.y = y + math.cos(an) * r
  coord.lx = x + math.sin(an-48) * r
  coord.ly = y + math.cos(an-48) * r
  return coord
end
function drawRadar(width,height,rayon,color,time)
  delay(time)
  r = rayon
  for i=1,360,1 do
    an = math.rad(i) -- angle
    x = width/2
    y = height/2
    
    c = getCoord(x,y,r,an)
    point(c.x,c.y,color)
    if i>45 and i<360 then
      line(x,y,c.lx,c.ly,color)
    end
    c = getCoord(x,y,r+10,an)
    point(c.x,c.y,color)
    if i>45 and i<360 then
      line(x,y,c.lx,c.ly,color)
    end
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
function wait(time)
  delay(time)
  render()
end
function drawTarget(color)
  line(80,0,80,20,color) --tp
  line(80,140,80,160,color) --bt
  line(0,80,20,80,color) --lt
  line(140,80,160,80,color) --rt
  line(80,70,80,90,color) --ctv
  line(70,80,90,80,color) --cth
end
function drawFrame(color)
  line(0,0,160,0,color) --tp
  line(0,159,160,159,color) --bt
  line(1,1,1,160,color) --lt
  line(160,0,160,160,color) --lt
end

function draw()
  ray=10
  wi=160
  he=160
  col=11

  drawFrame(col)
  drawTarget(col)
  drawRadar(wi,he,ray,col,16)
  --[[clear()
  palette(10,"ff0000")
  drawFrame(10)
  drawTarget(10)
  drawRadar(wi,he,ray,10,16)
  render()
  ]]
end

