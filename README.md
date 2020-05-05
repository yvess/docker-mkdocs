# MkDocs Docker Image

Mkdocs Image with extra extensions:
- fontawesome icons
- markdown-vidify (video)
- mermaid (diagrams, flowcharts)

## sample setup

Directory structure:

```
my doc/
├── mkdocs.yml
├── Makefile
├── content/
│   ├── index.md
│   ├── content1.md
└── html/ (generated)
```

Create a `mkdocs.yml` file, change to your liking.

```yaml
# mkdocs.yml
site_name: my doc
docs_dir: content
theme: material
markdown_extensions:
    - smarty
    - codehilite
    - fenced_code
    - def_list
    - admonition
    - nl2br
    - fontawesome_markdown
    - attr_list
    - markdown_vidify:
        autoplay: False
        controls: True
        loop: False
dev_addr: 0.0.0.0:8111
site_dir: html
use_directory_urls: true
plugins:
    - search:
        lang: ['en']
    - markdownmermaid
extra_javascript:
    - https://unpkg.com/mermaid@8.4.8/dist/mermaid.min.js
extra_css:
    - https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
    - /_css/style.css
```

Add a `Makefile`.

```make
# Makefile

serve:
    (sleep 4; command -v sensible-browser > /dev/null && sensible-browser http://localhost:8111 || open http://localhost:8111) & 
    docker run -it --rm -v $(PWD):/mkdocs -p 8111:8111 yvess/mkdocs:0.5 serve

build:
    @docker run --rm -v $(PWD):/mkdocs --user="$$(id -u):$$(id -g)" yvess/mkdocs:0.5 build

open:
    command -v sensible-browser > /dev/null && sensible-browser html/index.html || open  html/index.html
```

### `make build`

For deployment of the html folder to static hosting.

### `make`

For local content checking / editing. Creates a http server on <http://localhost:8111>. 


## sample content

### syntax

[Markdown Syntax](https://daringfireball.net/projects/markdown/syntax)

### extensions

#### mermaid

flowcharts, diagrams [mermaid](https://mermaid-js.github.io/mermaid/#/) plugin

in markdown:

```html
<pre class="mermaid">
stateDiagram
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]
</pre>
```

Output:
```
<pre class="mermaid">
stateDiagram
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]
</pre>
```

#### defintion list

```markdown
title 
: **Name**
<hello@world.com>
```

Titel 
: **Name**
<hello@world.com>

see [definition_lists](https://python-markdown.github.io/extensions/definition_lists/)

#### warning / note

```markdown
!!! note
    "Don't try this at home"
```

!!! note
    "Don't try this at home"

- see also [admonitions](https://python-markdown.github.io/extensions/admonition/)
- see also [types](https://docutils.sourceforge.io/docs/ref/rst/directives.html#specific-admonitions)

#### video

in markdown:

```markdown
![my video](/videos/myvideo.mp4)
```

Output:

```html
<video controls="controls" src="/videos/myvideo.mp4"></video>
```

#### fontawesome

in markdown:

```markdown
:fa-file-o: [my.pdf](my.pdf)
```

Output:

```html
<i class="fa fa-file-o"></i> <a href="mypdf.pdf">mypdf.pdf</a>
```

