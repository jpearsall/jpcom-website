---
title: "🛠️ Dr Strangebuild Part 1"
summary: "How I learned to stop worrying and love automation."
date: 2024-09-04T19:14:38-06:00
draft: false
toc: true
images:
tags:
  - gitops
  - career
  - automation
---

# Dr. Strangebuild

> How I learned to stop worrying and love automation.

## Introduction

Few things induce a Shrek-esque incredulity quite like having to deal with 
proprietary file formats. This is especially frustrating when I am trying to 
quantify my achievements in a resume. Markdown is Good Enough&trade; for many 
purposes and I was absolutely certain that it would serve me well here as well.

## Workflow

### Create Your Resume

For application hints of this consult [Examples/Resume](#Resume).

| Element Equivalent | Resume Element                |
|--------------------|-------------------------------|
| Heading Level 1    | Name at the top               |
| Heading Level 3    | Section headers               |
| Heading Level 4    | Communication links           |
| Heading Level 5    | Job header                    |
| Paragraph          | Introduction, job description |
| Unordered List     | Job accomplishments           |

### Convert to Desired Formats

For hints on the automated build process, consult [Examples/Build](#Build)

Our build process uses [Pandoc](https://github.com/jgm/pandoc/) and [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf) 
to convert from Markdown to HTML (via pandoc) and HTML (via wkhtmltopdf). You 
can optionally convert to a Microsoft Word document via pandoc although that 
is beyond the scope of this post. Please consult with the [reference repo](https://github.com/sdsawtelle/markdown-resume) 
for more information.

Assuming you have named your resume `resume.md` and the stylesheet as 
`resume-styling.css` you can do the conversions via the GNU/Linux command-line 
via the following. This assumes that both Pandoc and wkhtmltopdf are installed.

⚠️ Note that the HTML document is required to convert to PDF, although you 
could likely use pipes and input redirection to not require an intermediate 
file.

⚠️ The `resume-styling.css` needs to be in the same directory as the generated 
`resume.html` for conversion to PDF to work properly.

**Convert to HTML**

`pandoc --css=resume-styling.css -s -f markdown+smart -o resume.html resume.md`

**Convert to PDF**

`wkhtmltopdf --enable-local-file-access resume.html resume.pdf`

## Examples

### Resume

For example purposes this is named `readme.md`.

```markdown
# Sanguine Strangebuild, PhD
#### **[me@strangebuild.de](mailto:me@strangebuild.de)** – **[+49 30-23125000](tel:+493023125000)**

Leveraging GitOps and automated build workflows to prevent armageddon.

### PROFESSIONAL EXPERIENCE

##### Automation Wizard – Cyberspace – Internet Land – 2024 to Present

Found ways to free frustrated contributors from the rigor of manual process.

- Automated workflows to process a Markdown resume into open and proprietary formats.
- Consumed a prodigious amount of Obstler Schnapps.

### ADDITIONAL EXPERIENCE

##### Automation Padawan – Galactic Empire – Imperial City, Coruscant – 2000 to 2024
```

### Build

⚠️ Note that I use [Drone CI](https://www.drone.io/) as my CI tool.

```yaml
---
kind: pipeline
type: kubernetes
name: default

steps:
  - name: build
    image: ghcr.io/surnet/alpine-wkhtmltopdf:3.19.0-0.12.6-full
    commands:
      - apk add --no-cache pandoc
      - mkdir target
      - pandoc --css=resume-styling.css -s -f markdown+smart -o target/resume.html resume.md
      - cp resume-testing.css target/
      - wkhtmltopdf --enable-local-file-access target/resume.html target/resume.pdf
  - name: publish
    image: plugins/gitea-release
    environment:
      DRONE_REPO_OWNER: itsmejwp
    settings:
      api_key:
        from_secret: GITEA_API_KEY
      base_url: https://my.local.git.host.example
      files: target/*
      draft: true
      title: ${DRONE_COMMIT_SHA:0:8}
    when:
      event:
        - tag
    depends_on:
      - build
```

### Stylesheet

For example purposes this is named `resume-styling.css`.

```css
/* name at the top */
h1 {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 3em;
    border-bottom: 1px solid #444;
    text-align: center;
}

/* section headers */
h3 {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 1.5em;
    border-bottom: 1px dashed #444;
    text-align: center;
}

/* communication links */
h4 {
    font-family: "Times New Roman", Times, serif;
    text-align: center;
    margin-top: -1em;
}

/* job header */
h5 {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 1.1em;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
}
```

## References

- [The Simplest Markdown Resume Workflow](https://sdsawtelle.github.io/blog/output/simple-markdown-resume-with-pandoc-and-wkhtmltopdf.html)
- [The Markdown Resume](https://mszep.github.io/pandoc_resume/)
- [normalize.css](https://github.com/necolas/normalize.css)
- [alpine-wkhtmltopdf container](https://github.com/surnet/docker-wkhtmltopdf/pkgs/container/alpine-wkhtmltopdf)