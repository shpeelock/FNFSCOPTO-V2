function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Attack Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ATTACKNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Attack Note' then
		characterPlayAnim('boyfriend', 'attack', true);
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('dad', 'hit', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
		playSound('BFATTACK', 0.6);
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Attack Note' then
		cameraShake('camGame', 0.01, 0.2)
		setProperty('health', getProperty('health')-0.8);
		playSound('BFHIT', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
	end
end