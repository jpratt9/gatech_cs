cd 'C:\Users\Billy\Downloads\torrents\Season 3';
% Get all PDF files in the current folder
files = dir('*.mkv');
% Loop through each
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, rest] = strtok(files(id).name,'.');
    name = strtok(rest(2:end),'.');

          % If numeric, rename
          movefile(files(id).name, sprintf('%s.mkv', name));

end
cd 'C:\Users\Billy\Google Drive\cs1371\independent work'