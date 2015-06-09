require "CiderDebugger";-- 

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local physics = require( "physics" )
physics.start()
physics.setDrawMode( "hybrid" )
physics.setGravity( 0, 0 )
display.setStatusBar( display.HiddenStatusBar )
physics.setVelocityIterations( 400 )
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- We need this to make the object draggable.
local gameUI = require("gameUI")

require("Deck")

local Player1 = Deck:new(1)
local Player2 = Deck:new(2)
local Croupier = Deck:new(3)

Player1:showCard('trefle', 1)
Player2:showCard('coeur', 4)

Croupier:showCardAt('carreau',8, 0, 0)




--Main






--Player2:showCard('trefle', 1)
--Croupier:showCard('trefle', 1)
--local Player1 = Deck:new(
--local Player2 = Deck:new()
--local Croupier = Deck:new()





















--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

display.newText( "drag any object into the box", centerX, 20, native.systemFontBold, 20 )

display.setDefault( "anchorX", 0.0 )	-- default to TopLeft anchor point for new objects
display.setDefault( "anchorY", 0.0 )

local box_spec = { upper_left = { x = 64, y = 128 },
					lower_right = { x = 264, y = 328 },
					width = 0,
					height = 0 }

box_spec.width = ( box_spec.lower_right.x - box_spec.upper_left.x )
box_spec.height = ( box_spec.lower_right.y - box_spec.upper_left.y )

local box = display.newRect( box_spec.upper_left.x,
								box_spec.upper_left.y,
								box_spec.width,
								box_spec.height )
box.strokeWidth = 2
display.setDefault( "anchorX", 0.5 )	-- restore anchor points for new objects to center anchor point
display.setDefault( "anchorY", 0.5 )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Begin
local ground = display.newImage( "ground.png", 160, 445 )
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Do Not edit unless you know what you do
local hit_label = {}

local cleanup_at_start_of_gameloop = function()

	for i in pairs(hit_label)
	do
		display.remove( hit_label[i] )
	end

	hit_label = {}

end

local label_all_hits = function( hits )

	for i,v in ipairs(hits)
	do
		hit_label[i] = display.newText( tostring( i ), v.x, v.y, native.systemFontBold, 15 )
	end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local gameloop = function(event) 

	cleanup_at_start_of_gameloop()

	local hits = physics.queryRegion( box_spec.upper_left.x,
										box_spec.upper_left.y,
										box_spec.lower_right.x,
										box_spec.lower_right.y )

	if hits then

		label_all_hits( hits )

		box:setStrokeColor( 192/255, 192/255, 192/255 )
		box:setFillColor( 1, 1, 1, 92/255 )

	else

		box:setStrokeColor( 0.5, 0.5, 0.5 )
		box:setFillColor( 1, 1, 1, 64/255 )

	end

end

Runtime:addEventListener("enterFrame", gameloop)