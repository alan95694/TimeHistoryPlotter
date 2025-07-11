function outputDateTimeFormatInfo(app)
% 
% 
% 


disp(' ')
disp(' ')
disp('Basic building blocks of formats:')
disp('yyyy		4-digit year					2025')
disp('yy		    2-digit year					25')
disp('MMMM		Full month name					June')
disp('MMM		    Abbreviated month name			Jun')
disp('MM		    2-digit month number			06')
disp('M			1- or 2-digit month number		6')
disp('dd		    2-digit day						09')
disp('d			1- or 2-digit day				9')
disp('EEEE		Full weekday name				Monday')
disp('EEE		    Abbreviated weekday name		Mon')
disp('HH		    2-digit hour (24-hour clock)	08, 14')
disp('H			1- or 2-digit hour (24-hour)	8, 14')
disp('hh		    2-digit hour (12-hour clock)	08, 02')
disp('h			1- or 2-digit hour (12-hour)	8, 2')
disp('mm		    2-digit minute					03')
disp('m			1- or 2-digit minute			3')
disp('ss		    2-digit second					09')
disp('s			1- or 2-digit second			9')
disp('SSS		    Milliseconds (3-digit)			123')
disp('a			AM/PM marker					AM or PM')
disp('Z			Time zone offset				+0000, -0400')
disp('''text''	    Literal text (use single quotes)	''at'' → at')


disp(' ')
disp(' ')
disp('Examples: ')
disp('''yyyy-MM-dd''	            2025-06-23')
disp('''MM/dd/yyyy HH:mm''	        06/23/2025 13:45')
disp('''MMM dd, yyyy''	            Jun 23, 2025')
disp('''EEEE, MMMM d, yyyy''	    Monday, June 23, 2025')
disp('''hh:mm:ss a''	            01:45:00 PM')
disp('''yyyy-MM-dd''T''HH:mm:ss''	    2025-06-23T13:45:00')
disp(' ')
disp(' ')


end













