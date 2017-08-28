function [ average_volts, fix_array ] = voltageFilter( volts1, volts2, volts3 )
% VOLTAGEFILTER Returns adjusted averages for the voltage readings on an 
% array of voltometers and an array describing which sensors have problems

%  Find defective voltometers:  where all three readings are the same
defective = volts1 == volts2 & volts2 == volts3;

% finds random noise:  i.e. when a voltage reading is less than 1
noise = volts1 < 1;

% whenever a sensor has random noise, all times have random noise, and
% whenever this happens, all such voltage readings must be set to zero
volts1(noise) = 0;
volts2(noise) = 0;
volts3(noise) = 0;

% a spike is defined as a reading that is greater than 3 times the average
% reading at a given time
spike1 = volts1 > 3*mean(mean(volts1));
spike2 = volts2 > 3*mean(mean(volts2));
spike3 = volts3 > 3*mean(mean(volts3));

% all spikes should be set to zero, as they were machine error
volts1(spike1) = 0;
volts2(spike2) = 0;
volts3(spike3) = 0;

average_volts = (volts1 + volts2 + volts3) ./ 3;
fixed_average = sum(sum(average_volts))/sum(sum(average_volts ~= 0));

% All elements in the average array corresponding to spikes or defective
% voltometers should be set to the adjusted average
had_spike = spike1 | spike2 | spike3;
problem = defective | had_spike;
average_volts(problem) = fixed_average;

% 0s represent normal sensors, 1s represent sensors that had a spike, and 2s
% represent defective sensors
fix_array = zeros(size(volts1));
fix_array(defective) = 2;
fix_array(had_spike) = 1;
end