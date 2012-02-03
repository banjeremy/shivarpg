--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MainAI.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if ( this.bHandleInputs ( ) )
    then
        local cam = application.getCurrentUserActiveCamera ( )
        
        object.sendEvent ( cam, "SimpleCameraAI", "onTurnHead", nPointX, nPointY, nDeltaX, nDeltaY )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
