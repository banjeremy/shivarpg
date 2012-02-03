--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SimpleCameraAI.onEnterFrame (  )
--------------------------------------------------------------------------------
	
    local o         = this.getObject ( )        
    local dynObject = this.hDynObject ( )
    local dt        = application.getLastFrameTime ( )
    
    if ( dynObject ~= nil )
    then
        -- Turn head
        --
        local rh = math.interpolate ( this.nCurAngleH ( ), this.nDstAngleH ( ), 20 * dt )
        local rv = math.interpolate ( this.nCurAngleV ( ), this.nDstAngleV ( ), 20 * dt )
        
        this.nCurAngleH ( rh )
        this.nCurAngleV ( rv )
                        
        object.setRotation  ( o, 0, rh, 0, object.kGlobalSpace )
        object.rotate       ( o, rv, 0, 0, object.kLocalSpace  )
            
        -- Place the camera at the dynObject position, with a little offset.
        --
        object.matchTranslation ( o, dynObject, object.kGlobalSpace )
        object.translate        ( o, 0, 2.5, 0, object.kGlobalSpace )

        -- Add forces if needed
        --
        local oXx, oXy, oXz = object.getXAxis ( o, object.kGlobalSpace )
        local oYx, oYy, oYz = object.getYAxis ( o, object.kGlobalSpace )
        local oZx, oZy, oZz = object.getZAxis ( o, object.kGlobalSpace )
        local  fx,  fy,  fz = 0, 0, 0
        
        if      ( this.bMoveForward    ( ) ) then fx, fy, fz = math.vectorSubtract ( fx, fy, fz, oZx, oZy, oZz )
        elseif  ( this.bMoveBackward  ( ) ) then fx, fy, fz = math.vectorAdd      ( fx, fy, fz, oZx, oZy, oZz ) 
        end

        if      ( this.bStrafeRight  ( ) ) then fx, fy, fz = math.vectorAdd      ( fx, fy, fz, oXx, oXy, oXz )
        elseif  ( this.bStrafeLeft   ( ) ) then fx, fy, fz = math.vectorSubtract ( fx, fy, fz, oXx, oXy, oXz ) 
        end
        
        fx, fy, fz = math.vectorNormalize   ( fx, 0, fz )
        fx, fy, fz = math.vectorScale       ( fx, 0, fz, 5000 )
        
        dynamics.addForce ( dynObject, fx, fy, fz, object.kGlobalSpace )
        
        -- Gravity
        --
        dynamics.addForce ( dynObject, 0, -2000, 0, object.kGlobalSpace )
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
