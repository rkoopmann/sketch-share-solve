local gfx <const> = playdate.graphics

class("Title").extends(gfx.sprite)

function Title:init()
	Title.super.init(self)

	self.image = gfx.image.new(400, 240, gfx.kColorClear)
	self:setImage(self.image)
	self:setCenter(0, 0)
	self:setZIndex(5)
end

function Title:enter(opened)
	self.sidebarOpened = opened
	self:redraw()
	self:add()
end

function Title:leave()
	self:remove()
end

function Title:setSidebarOpened(opened)
	self.sidebarOpened = opened
	self:redraw()
end

function Title:redraw()
	self.image:clear(gfx.kColorClear)
	gfx.lockFocus(self.image)
	do
		gfx.setColor(gfx.kColorBlack)
		local width = gfx.getTextSize("DIY Grid")
		gfx.drawText("DIY Grid", 400 - width - 20, 20)
	end
	gfx.unlockFocus()
	self:markDirty()
end
