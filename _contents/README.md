Contents.txt is an old listing that would be needed for any return to Penflip,
and is also useful for diffing.  To get the file list in the same format, use

	ls -l */*|awk '{print $9}'|grep -v "_contents"|grep -v "images/"|grep -v "_title"|sort

To sort Contents.txt:

	cat _contents/Contents.txt|sort

recipes.yaml is a similar listing that is used by the website.
