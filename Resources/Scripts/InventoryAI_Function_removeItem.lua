--------------------------------------------------------------------------------
--  Function......... : removeItem
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function InventoryAI.removeItem ( item, quantity )
--------------------------------------------------------------------------------
	
    local holdCount = hashtable.get ( this.htItems ( ), item )
    if ( holdCount == nil or holdCount - quantity < 0 ) then
        log.message ( "There are not enough " .. item .. "(s) to remove that quantity." )
    else 
        hashtable.set ( this.htItems ( ), item, hashtable.get( this.htItems ( ), item ) - quantity )
        log.message ( "removed " .. quantity .. " " .. item .. "(s) from items: " .. holdCount - quantity )
    end
    	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
