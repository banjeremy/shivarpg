--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MainAI.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local r, g, b = light.getColor ( this.hDirectionalLigh1 ( ) )
    if (g == 0) then
        light.setColor ( this.hDirectionalLigh1 ( ), 0, .3, 0 )
    else
        light.setColor ( this.hDirectionalLigh1 ( ), 0, 0, .8 )
    end    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
