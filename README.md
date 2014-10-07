getdata-008
===========

###Assignment for course getdata-008


There is only one script called "run_analysis.R" which is explained both in the comments inside the scripts and also in the file "CodeBook.md".

The script can be run when the zip file is in the same directory. The expected zip file is called "UCI HAR Dataset.zip".

Alternatively a single line of the script can be uncommented to donwload the file again before processing.
The script performs step by step the required operations and it produces the required file at the end.

Please note that "CodeBook.md" explains the code transformations performed in the script to clean up the data.

There is little to explain about the nature of the values.

These are measurements about various features observed while a number of subjects were performing some form of physical activity.

These features are each related to a specific signal and a relevant variable and, sometimes, a particular direction.

The focus of this exercise is on features using variable "mean()" or "std()".

No specific requirement is on the directional features so they are maintained as distinct when available. 

Also all different features related to each signal are kept distinct for further analysis.
