# Welcome!
This is where you can write the content for your front page.

The text here will be formatted according to markdown syntax and inserted into
a template, which you can find at `/templates/_default.html`.

### Templates
If there is a template with the same name as the `.md` file in the `content`
directory, then that template will be used to render that content.

If your content `.md` file is in a subdirectory of the `content` directory,
SimpleSites will look for a subdirectory with the same name in the `templates`
directory. If it finds one, it will look for a template there with the same
name as the content `.md` file. If there isn't one, it'll look for a
`_default.html` file in that subdirectory. If it finds neither, it'll look in
the directory above.

You can use this to have specific templates for different pages or different
sections of your site. For instance, you could have a `content/posts` directory
conaining blog posts, and a `templates/posts/_default.html` template which would
be applied to them.

If no other matching template is found, it'll use `templates/_default.html`.

### Code blocks
Double curly brackets in the template file can contain Lua code which will be
run. eg. `{ { "hello, " .. NAME .. "!" } }` (with no spaces between
the brackets) will be evaluated before it's inserted into the template. Don't
put code blocks in your content `.md` files, it causes horrible, subtle and
intermittent bugs.

One HTML page is rendered for every `.md` file in the `content` directory and
its subdirectories. Within whichever template is chosen to render the `.md`
file, the `.md` file is available inside code blocks as `content.auto`.

The text of the `.md` file is `content.auto.text`. `content.auto` has a few
other useful fields, like `content.auto.modified_time` or `content.auto.title`
(which is guessed either from the first #markdown header or else from the 
filename). Read the code to see all available fields, it should be Simple
enough.

Code blocks are evaluated and templates merged before markdown is parsed into
HTML. This means that you can include markdown in your templates, but you
shouldn't indent any HTML in your templates or it'll be treated as a code block.

### Styling
To change the style of your site, edit `static/style.css`.

## Markdown
You can use [Markdown](https://en.wikipedia.org/wiki/Markdown) to add formatting.
Look at the difference between `index.md` and `index.html` to see how markdown
renders into HTML.

Here's a quick overview of markdown:

# Headers start with a "#"

## Subheadings start with multiple "#"s

Leave one empty line to start a new paragraph, otherwise lines will run
together.

This is _italicised_, so is *this*.
**This** will be bold, so will __this__.
These will all be part of the same paragraph.

->This text will be centred.<-

[This](www.example.com) will be a link to example.com
So will [this][link1]. Look at the bottom of the markdown to see the
footnote-style link it references.

Images are very similar, but prefixed with a !
![My image text](static/image.png)
You can use inline _or_ reference style.

> This will be displayed in 
> blockquote style.


	This will be displayed in 'code' style, ie. with the exact formatting
	written here and displayed in a monospace font.
	That's because it's been indented by 1 tab.
    You can also start a code block by indenting 4 spaces.

`This is an inline code block. It's between backticks (not 'single quotes').`

* This
* Is
* A 
* Bullet
* List

1. This is a 
2. Numbered list

### HTML
You can use regular <abbr title="Hypertext Markup Language">HTML</abbr> in
markup wherever you like.


[link1]: www.example.com "On hover, this text will be displayed!"
