# Sitemap
### Authors: Ryan McGowan & Alex Notwell

## How to read this document
This page is for internal reference only. It describes what pages/operations
should be availabale from within the application.

The following is an ordered list structure of the following form

* `path` = `Nice Name`
	`Description`
	* `path` = `Some subpage of Nice Name`
		`Description`

Where `path` is some path off of the apps root, (e.g. '/some/where' -&gt;
'bits-books.ryanmcg.com/some/where'), `Nice Name` is some pretty name for that
page, and `Description` should be a short paragraph describing the page.

Nested entries are used to indicate subpages but require no special cases.

Besides the sitemap there is a description of templates at the bottom of the
page.

## The Sitemap

* / = Home Page
	Uses basic template with searchbar in center.

## Templates

#### Basic

	+------------------------------------------+
	| {Logo} Bits & Books     Login // Register|
	+------------------------------------------+
	|                                          |
	|             {Content}                    |
	|                                          |
	+------------------------------------------+

