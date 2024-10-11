Managing the contents
------------------------------

## Penflip is the Past

Contents.txt was an old listing that would be needed for any return to Penflip,
and was also useful for diffing.  I removed it so it wouldn't get stale.
To get the file list in a similar format, use

	ls -l */*|awk '{print $9}'|grep -v "_contents"|grep -v "images/"|grep -v "_title"|sort

recent.txt is also stale.  There's a script at top level to determine recency if I lose track (`sort.sh`).

## YAML is the Ever-Present

`recipes.yaml` is a similar but more complicated listing that is currently used by [my Jekyll website](//mcdemarco.net/recipes)
to establish the recipe order for the TOCs (tables of contents).  

(Please note that I [use a very old Jekyll](//mcdemarco.net/blog/2023/04/14/restyled/) to do this 
because newer Jekyll doesn't process raw markdown in collections.)

The `recipes.yaml` file is maintained manually, so needs some checking.

## Checking and Extras

To make sure everything is in the TOC, I used to compare the following word counts (and lists, if they disagreed);

	grep -h "^\# " */*.md | grep -v "Things To Cook" | sort | uniq | wc
	grep "  \- name:" _contents/recipes.yaml | sort | uniq | wc

The uniq was there for redirect files, which don't necessarily appear in the TOC.

To compare if they disagreed:

	grep -h "^\# " */*.md | grep -v "Things To Cook" | sort | uniq | sed 's/\# //' > titles.txt
	grep "  \- name:" _contents/recipes.yaml | sort | uniq | sed 's/  \- name: //'> tocNames.txt
	diff titles.txt tocNames.txt

### New Flags and Redirection

The previous diffing method was somewhat unreliable, so hidden and redirect files have now 
(circa Nov 2023) been indexed in `recipes.yaml` to facilitate diffing,
and because a lot of stuff in there is now annotated for use by jekyll/liquid scripting on my website.

To make sure everything is in the TOC, compare the following word counts (and lists, if they disagree);

	grep -h "^\# " */*.md | sort | wc
	grep "  \- name:" _contents/recipes.yaml | sort | wc

To compare if they disagree:

	grep -h "^\# " */*.md | sort | sed 's/\# //' > titles.txt
	grep "  \- name:" _contents/recipes.yaml | sort | sed 's/  \- name: //'> tocNames.txt
	diff titles.txt tocNames.txt

### Tags vs. Flags

I took out some of my original flags (quick, ip/instantPot/Instant Pot) for use as tags.
The ones I left are intended to be about the cookbook and/or temporal (favorites, new, redirect)
rather than about the recipe itself, just as the order of recipes in the TOC and `recipes.yaml`
is not about the recipe itself.

Tags are implemented with markdown link references.  These are mostly invisible (that is, never linked) at this point, 
because I hope to automate the creation of in-recipe tag lists eventually.  
Currently you can see some manual links in `fish/ipSalmon.md`, or online at 
[my website](//mcdemarco.net/recipes/fish/ipSalmon/).  

There is a script at the top level to gather tags (`tag.sh`)
and write them to `tags.yaml` here.  The Liquid that uses the both YAML files to make tag index pages is in my fork of Left
[here](https://github.com/mcdemarco/left/blob/website/_layouts/recipeTagIndex.html).  Note that new html targets need to be manually created for new tag (indicies) and added to `_includes/recipeIndices.html`.

For reference, an example of the Liquid that makes index pages for flags is [here](https://github.com/mcdemarco/left/blob/website/recipes/indices/favorites.html),
and some Liquid to just alphabetize the whole list is [here](https://github.com/mcdemarco/left/blob/website/recipes/indices/alphabetical.html).
