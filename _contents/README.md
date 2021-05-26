Contents.txt was an old listing that would be needed for any return to Penflip,
and was also useful for diffing.  I removed it so it wouldn't get stale.
To get the file list in a similar format, use

	ls -l */*|awk '{print $9}'|grep -v "_contents"|grep -v "images/"|grep -v "_title"|sort

recipes.yaml is a similar but more complicated listing that is currently used by the website
to establish the recipe order / tocs.

recent.txt is also stale.

