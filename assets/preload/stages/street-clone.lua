local xx = 170;
local yy = 260;
local xx2 = 500;
local yy2 = 415;
local ofs = 20;
local followchars = true;

function onCreate()
	makeLuaSprite('streetbg', 'streetbg', -600, -300);
	addLuaSprite('streetbg', false);

	makeAnimatedLuaSprite('pissandshit', 'cloneback', -497, 258.65);
	addLuaSprite('pissandshit', true);
	addAnimationByPrefix('pissandshit', 'bop', 'clones back bop', 24, true);
	objectPlayAnimation('pissandshit', 'bop');
end

function onUpdate(elapsed)
	setProperty('gf.visible',false)

    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',1.1)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',1)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

-- Gameplay interactions
function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('pissandshit', 'bop', true);
	end
end
