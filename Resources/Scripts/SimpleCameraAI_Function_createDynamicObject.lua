--------------------------------------------------------------------------------
--  Function......... : createDynamicObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SimpleCameraAI.createDynamicObject ( )
--------------------------------------------------------------------------------
	
    local s = object.getScene ( this.getObject ( ) )
    
    if ( s ~= nil )
    then
        local dynObject = scene.createRuntimeObject ( s, "FPVDummy" )
        
        if ( dynObject ~= nil )
        then
            this.hDynObject ( dynObject )
        
            -- Place the object at the startup position
            --
            local startPoint = scene.getTaggedObject ( s, "FPVStart" )
        
            if ( startPoint ~= nil )
            then
                object.matchTranslation ( dynObject, startPoint, object.kGlobalSpace )
            else
                log.error ( "Object with tag \"FPVStart\" not found. Aborting." )
            end
        
            -- Setup dynamics
            --
            if ( dynamics.createSphereBody ( dynObject, 0.25 ) )
            then
                dynamics.enableDynamics         ( dynObject, true )
                dynamics.enableCollisions       ( dynObject, true )
                dynamics.enableGravity          ( dynObject, true )
                dynamics.setLinearDampingEx     ( dynObject, 5.00, 0, 5.00 )
                dynamics.setAngularDamping      ( dynObject, 5.00 )
                --dynamics.setLinearSpeedLimit    ( dynObject, 5.00 )
                dynamics.setMass                ( dynObject,   80 )                
            end
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
