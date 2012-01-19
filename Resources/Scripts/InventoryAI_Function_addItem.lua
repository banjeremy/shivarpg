--------------------------------------------------------------------------------
--  Function......... : addItem
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function InventoryAI.addItem ( item, quantity )
--------------------------------------------------------------------------------
    if ( this.currentItemCount ( ) + quantity > this.maxItemCount ( ) ) then
        log.message ( "inventory too full" )
        return
    end

    local holdCount = hashtable.get ( this.htItems ( ), item )
    if ( holdCount == nil ) then
        holdCount = 0
        hashtable.add ( this.htItems ( ), item, quantity )
    else 
        hashtable.set ( this.htItems ( ), item, holdCount + quantity )       
    end

    log.message ( "added " .. quantity .. " " .. item .. "(s) to items: " .. holdCount  + quantity)
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
