require "CiderDebugger";-- 

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local physics = require( "physics" )
physics.start()
physics.setDrawMode( "hybrid" )
physics.setGravity( 0, 0 )
--display.setStatusBar( display.HiddenStatusBar )
physics.setVelocityIterations( 400 )

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- We need this to make the object draggable.
local gameUI = require("gameUI")

require("Deck")
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--display.newText( "drag any object into the box", centerX, 20, native.systemFontBold, 20 )

display.setDefault( "anchorX", 0.0 )	-- default to TopLeft anchor point for new objects
display.setDefault( "anchorY", 0.0 )

local box_spec = { upper_left = { x = 100, y = 128 },
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

function showBackground()
    
     local cardPath = "BG.png"
    if(cardPath == nil) then
        return "Can't find background"
    end
    
    local crate1 = display.newImage( cardPath, 0, 0)
    crate1.isFixedRotation = 1
    physics.addBody( crate1 , "static",{ density=1, friction=1, bounce=0, radius=0 } )
    
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


    local Player1 = Deck:new(1)
    local Player2 = Deck:new(2)
    local Croupier = Deck:new(3)

    showBackground()



    --Croupier:showCard('carreau',8, 0, 0)

    --Main
    Player2:showCard('trefle', 5, 0, 0)
    Croupier:showCard('trefle', 9, 300, 300)
    local Player1 = Deck:new()
    local Player2 = Deck:new()
    local Croupier = Deck:new()

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local gameloop = function(event) 







end

Runtime:addEventListener("enterFrame", gameloop)