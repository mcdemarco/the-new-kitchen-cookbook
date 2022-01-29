Managing the contents
------------------------------

## Penflip is the Past

Contents.txt was an old listing that would be needed for any return to Penflip,
and was also useful for diffing.  I removed it so it wouldn't get stale.
To get the file list in a similar format, use

	ls -l */*|awk '{print $9}'|grep -v "_contents"|grep -v "images/"|grep -v "_title"|sort

recent.txt is also stale.

## YAML is the Ever-Present

recipes.yaml is a similar but more complicated listing that is currently used by the website
to establish the recipe order / tocs.

To make sure everything is in the toc, compare the following word counts (and lists, if they disagree);

	grep -h "^\# " */*.md | grep -v "Things To Cook" | sort | uniq | wc
	grep "  \- name:" _contents/recipes.yaml | sort | uniq | wc

The uniq is there for redirect files, which don't necessarily appear in the TOC.

To compare if they disagree:

	grep -h "^\# " */*.md | grep -v "Things To Cook" | sort | uniq | sed 's/\# //' > titles.txt
	grep "  \- name:" _contents/recipes.yaml | sort | uniq | sed 's/  \- name: //'> tocNames.txt
	diff titles.txt tocNames.txt

