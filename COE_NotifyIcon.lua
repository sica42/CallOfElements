---@class COE
---@field notify_icon NotifyIcon
COE = COE or {}

if COE.NotifyIcon then return end

---@class NotifyIcon
---@field show fun( texture: string, config_mode: boolean? )
---@field config_show fun()
---@field hide fun( texture: string? )

local M = {}

function M.new()
	---@type "SHOW"|"HOLD"|"HIDE"|"DONE"|"CONFIG"
	local state ="DONE"
	local elapsed_time = 0
	local icon_frame
	local isShowing = false
	local drag_pos = {}

	local function on_update()
		local elapsed = arg1

		local iconAlpha = COE_Config:GetSaved( COEOPT_NOTIFYICONALPHA )
		elapsed_time = elapsed_time + elapsed

		if state == "SHOW" then
			local scale = elapsed_time / 0.4
			local alpha = iconAlpha * (elapsed_time / 0.4)

			if scale >= 1 then
				scale = 1
				alpha = iconAlpha
				state = "HOLD"
			end
			icon_frame.inner:SetScale( scale )
			icon_frame.inner:SetAlpha( math.min( alpha, iconAlpha ) )
		elseif state == "HOLD" then
			if elapsed_time >= COE_Config:GetSaved( COEOPT_NOTIFYICONDURATION ) then
				elapsed_time = 0
				state = "HIDE"
			end
		elseif state == "HIDE" then
			local scale = 1 + (0 - 1) * (elapsed_time / 0.4)
			local alpha = iconAlpha + (0 - iconAlpha) * (elapsed_time / 0.4)
			if alpha <= 0 then
				alpha = 0
				scale = 0
				state = "DONE"
				icon_frame:Hide()
			end
			icon_frame.inner:SetScale( scale )
			icon_frame.inner:SetAlpha( alpha )
		end
	end

	local function on_drag_start()
		local x,y = icon_frame:GetCenter()
		drag_pos = { x = x, y = y }
		icon_frame:StartMoving()
	end

	local function on_drag_stop()
		icon_frame:StopMovingOrSizing()

		local x, y = icon_frame:GetCenter()
		local dx = x - drag_pos.x
		local dy = y - drag_pos.y

		COEFramePositions[ "NotifyIcon" ].x = COEFramePositions[ "NotifyIcon" ].x + dx
		COEFramePositions[ "NotifyIcon" ].y = COEFramePositions[ "NotifyIcon" ].y + dy
	end

	local function create_frame()
		---@class Frame
		local frame = CreateFrame( "Frame", nil, UIParent )
		frame:Hide()

		frame.inner = CreateFrame( "Frame", nil, frame )
		frame.inner:SetPoint( "Center", frame, "Center" )

		frame.icon = frame.inner:CreateTexture( nil, "ARTWORK" )
		frame.icon:SetAllPoints( frame.inner )

		frame:SetScript( "OnUpdate", on_update )
		frame:SetScript( "OnDragStart", on_drag_start )
		frame:SetScript( "OnDragStop", on_drag_stop )

		return frame
	end


	local function show( texture, config_mode )
		if not icon_frame then
			icon_frame = create_frame()
		end

		if (state == "HOLD" or state == "SHOW") and icon_frame.icon:GetTexture() == texture and not config_mode then
			return
		end

		local size = COE_Config:GetSaved( COEOPT_NOTIFYICONSIZE )
		if COEFramePositions[ "NotifyIcon" ] then
			icon_frame:ClearAllPoints()
			icon_frame:SetPoint( "Center", UIParent, "Center", COEFramePositions[ "NotifyIcon" ].x, COEFramePositions[ "NotifyIcon" ].y - (size / 2) )
		else
			icon_frame:SetPoint( "Center", UIParent, "Center", 0, 280 - (size / 2) )
			COEFramePositions[ "NotifyIcon" ] = { x = 0, y = 280 }
		end

		icon_frame:SetWidth( size )
		icon_frame:SetHeight( size )
		icon_frame.inner:SetWidth( size )
		icon_frame.inner:SetHeight( size )
		icon_frame.icon:SetTexture( texture )
		elapsed_time = 0

		if config_mode then
			state = "CONFIG"
			icon_frame.inner:SetAlpha( COE_Config:GetSaved( COEOPT_NOTIFYICONALPHA ) )
			icon_frame.inner:SetScale( 1 )

			icon_frame:SetMovable( true )
			icon_frame:RegisterForDrag( "LeftButton" )
			icon_frame:EnableMouse( true )
		else
			state = "SHOW"
			icon_frame:SetMovable( false )
			icon_frame:RegisterForDrag( nil )
			icon_frame:EnableMouse( false )
		end

		icon_frame:Show()
	end

	local function hide( texture )
		if state ~= "DONE" then
			if not texture or texture == icon_frame.icon:GetTexture() then
				elapsed_time = 0
				state = "HIDE"
			end
		end
	end

	local function config_show()
		if IsControlKeyDown() then
			COE:Message("Notification icon position reset.")
			COEFramePositions[ "NotifyIcon" ] = { x = 0, y = 280 }
			isShowing = false
		end

		if isShowing then
			this:SetText( COEUI_STRINGS[ "COE_OptionNotifyIconShow" ] )
			isShowing = false
			hide()
		else
			this:SetText( COEUI_STRINGS[ "COE_OptionNotifyIconHide" ] )
			isShowing = true
			show( COE[ "Shields" ][ "Water" ], true );
		end
	end

	---@type NotifyIcon
	return {
		show = show,
		config_show = config_show,
		hide = hide,
	}
end

COE.NotifyIcon = M

return M
