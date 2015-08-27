# MDBlog

This simple project aims to create a simple Markdown based blog engine which has no further depencencies (no cache, no database) and can be edited through VCS commits and deployed as a whole.

It's written in **CoffeeScript**, uses **Jade** as the template engine and **Less** to make CSS creation fun.

## Requirements

This piece of software requires at least **Node.js** v0.10 or newer installed (a version with the recent bugfixes is highly advised).

## Installation

Installation

    git clone https://github.com/kbence/mdblog.git
    cd mdblog
    npm install --production
    npm run app

By default it binds to port 8080. To change this behavior, just set an alternative port with the `PORT` environment variable:

    PORT=1234 npm run app

## Creating posts

It is advised to fork the repository on GitHub and start committing your blog posts (the best is if you even make it publicly available, so you can accept pull requests from others, but that's your decision).

Just put your blog posts into $MDBLOG/posts in a file with the format: `$YEAR-$MONTH-$DAY_$SOMETITLE.md` and write them in simple Internet Message/Markdown format (you don't need CRLF's to separate the lines though), for example:

```markdown
Title: My first post

# My first post

...
```

And that's it! Enjoy!
