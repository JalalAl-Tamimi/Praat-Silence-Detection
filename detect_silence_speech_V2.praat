##### Script to detect silence and speech portions
##### Version 1: uses Pitch cc, double pass, and then intensity. All is adapted to speaker
## 29 October 2024: Version 2: Uses the latest update in Praat's pitch analysis
## Requires version 6.4 or above!

beginPause: "Detecting silence and speech"
comment: "Where are your sound files?"
sentence: "directory1", ""
comment: "Duration threshold?"
positive: "duration_silence", "0.1"
positive: "duration_speech", "0.1"
clicked = endPause: "OK", 1


if directory1$ = ""
	directory1$ = chooseDirectory$("Select your directory of sound files and TextGrids")
endif

Create Strings as file list: "list", "'directory1$'/*.wav"

numberOfFiles = Get number of strings


for i from 1 to numberOfFiles
	select Strings list
   	fileName$ = Get string: i

	Read from file: "'directory1$'/'fileName$'"
	name$ = selected$ ("Sound")
	noprogress To Pitch (raw cross-correlation): 0.005, 50, 800, 15, "yes", 0.03, 0.45, 0.01, 0.35, 0.14
	q1_f0 = Get quantile: 0, 0, 0.05, "Hertz"
	q3_f0 = Get quantile: 0, 0, 0.95, "Hertz"
	Remove
	selectObject: "Sound 'name$'"
	To Intensity: q1_f0, 0.005, "yes"
	q1_Int = Get quantile: 0, 0, 0.05
	q3_Int = Get quantile: 0, 0, 0.95
	intensitySD = Get standard deviation: 0, 0
	silenceThreshold = (q3_Int - q1_Int) - (intensitySD/2)
	silenceThreshold = - silenceThreshold
	Remove
	selectObject: "Sound 'name$'"
	textgrid = To TextGrid (silences): q1_f0, 0.005, silenceThreshold, duration_silence, duration_speech, "xxx", ""
	Write to text file: directory1$ + "/" + "'name$'" + ".TextGrid"
	Remove
	selectObject: "Sound 'name$'"
	Remove
endfor
echo Finished:)
