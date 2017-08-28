function [] = spySpeak(transcript, hotwords, maleSpies, femaleSpies)

fhTranscript = fopen(transcript,'r');
fhHot = fopen(hotwords,'r');
fhMale = fopen(maleSpies,'r');
fhFemale = fopen(femaleSpies,'r');

report = strtok(transcript,'-CONVO.txt');
fhReport = fopen([report '-REPORT.txt'],'w');

end