--------------------------------------------------------------------------------
--  State............ : idle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SimpleCameraAI.idle_onLoop ( )
--------------------------------------------------------------------------------
	
    if ( this.bMoveForward( ) == true ) then
        object.translate( this.hSimpleCamera ( ), 0, 0, -.1, object.kLocalSpace )
    end
    if ( this.bMoveBackward ( ) == true ) then
        object.translate( this.hSimpleCamera ( ), 0, 0, .1, object.kLocalSpace )
    end
    if ( this.bRotateLeft ( ) == true ) then
        object.rotate ( this.hSimpleCamera ( ), 0, 3, 0, object.kLocalSpace )
    end
    if ( this.bRotateRight ( ) == true ) then
        object.rotate ( this.hSimpleCamera ( ), 0, -3, 0, object.kLocalSpace )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
