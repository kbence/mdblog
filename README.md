# MDBlog

This project aims to create a simple Markdown based blog engine which has no further depencencies (no cache, no database) and can be edited through VCS commits and deployed as a whole.

It's written in **CoffeeScript**, uses **Jade** as the template engine and **Less** to make CSS creation fun.

## Requirements

This software requires at least **Node.js** v0.10 or newer installed (a version with the recent bugfixes is highly advised).

There are no other dependencies (besides the Node modules described in `package.json`) as the whole idea is to provide an easy-to-edit blog which fits into programmers' usual workflow without depending on other services (like databases, caches, etc).

## Installation

### Installation using Node v0.10+ and npm

You can simply check out and run the application with the following commands:

    git clone https://github.com/kbence/mdblog.git
    cd mdblog
    npm install --production
    npm run app

By default it binds to port 8080. To change this behavior, just set an alternative port with the `PORT` environment variable:

    PORT=1234 npm run app

### Deploying with Heroku

Heroku supports Node, so it automatically finds the correct build pack and deploys it.

    git clone https://github.com/kbence/mdblog.git
    cd mdblog
    heroku create
    git push heroku master

### Running with Docker

You can build and run your own Docker image, or you can use the automatically generated one from Docker Hub.

#### Using the pre-built image

The following command will download and run the latest image built from master:

    docker run --rm -p 8080:8080 kbence/mdblog

You can even mount your own blog posts into the image; althought this is not the preferred way to use `MDBlog`:

    docker run --rm -p 8080:8080 -v /path/to/blog/posts:/app/posts kbence/mdblog

#### Building Docker image

    sudo docker build -t my-blog .
    sudo docker run --rm -p 8080:8080 my-blog

## Creating posts

It is advised to fork the repository on GitHub and start committing your blog posts (the best is if you even make it publicly available, so you can accept pull requests from others, but that's your decision).

Just put your blog posts into $MDBLOG/posts in a file with the format: `$YEAR-$MONTH-$DAY_$SOMETITLE.md` and write them in simple Internet Message/Markdown format (you don't need CRLF's to separate the lines though), for example:

```markdown
Title: My first post

# My first post

...
```

And that's it! Enjoy!
