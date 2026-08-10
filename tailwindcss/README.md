Tailwind CSS CLI ([minidocks/tailwindcss](https://hub.docker.com/r/minidocks/tailwindcss))
==========================================================================================

[Tailwind CSS](https://tailwindcss.com) is a utility-first CSS framework. This
image contains its command line interface, so you can build your stylesheet
without installing Node.js or Tailwind on your machine.

    docker run --rm -v "$PWD:/app" -w /app minidocks/tailwindcss -i src/app.css -o dist/app.css

The generated file belongs to you, not to `root` -- the user is taken from the
owner of the working directory.

Usage
-----

A minimal input file:

```css
@import "tailwindcss";
```

Build it once, or minified for production:

    docker run --rm -v "$PWD:/app" -w /app minidocks/tailwindcss -i src/app.css -o dist/app.css
    docker run --rm -v "$PWD:/app" -w /app minidocks/tailwindcss -i src/app.css -o dist/app.css --minify

The image runs `tailwindcss` for you when the first argument is an option, so
both forms work:

    docker run --rm ... minidocks/tailwindcss -i src/app.css -o dist/app.css
    docker run --rm ... minidocks/tailwindcss tailwindcss build -i src/app.css -o dist/app.css

### Watching

Tailwind stops watching when its standard input is closed, so either keep stdin
open with `-i`, or use `--watch=always`:

    docker run --rm -it -v "$PWD:/app" -w /app minidocks/tailwindcss -i src/app.css -o dist/app.css --watch
    docker run -d -v "$PWD:/app" -w /app minidocks/tailwindcss -i src/app.css -o dist/app.css --watch=always

On bind mounts that do not deliver file system events (macOS, Windows, some
network shares) add `--poll`.

### Compose

```yaml
services:
  css:
    image: minidocks/tailwindcss
    volumes:
      - .:/app
    working_dir: /app
    command: -i src/app.css -o dist/app.css --watch=always
```

Plugins
-------

[`@tailwindcss/typography`](https://github.com/tailwindlabs/tailwindcss-typography)
and [`@tailwindcss/forms`](https://github.com/tailwindlabs/tailwindcss-forms)
are included and can be enabled from your CSS:

```css
@import "tailwindcss";
@plugin "@tailwindcss/typography";
```

Anything installed in your project's `node_modules` is found as well, so
project-local plugins work without changing the image:

    npm install @tailwindcss/aspect-ratio

To bake another plugin into an image, install it into `$TAILWIND_HOME` and link
it into `$NODE_PATH`:

```dockerfile
FROM minidocks/tailwindcss

RUN npm install --prefix "$TAILWIND_HOME" --no-package-lock daisyui \
    && ln -sf "$TAILWIND_HOME"/node_modules/* /node_modules/ \
    && clean
```

How the packages are laid out
-----------------------------

`@import` and `@plugin` are resolved the way Node resolves modules -- by walking
up from the CSS file and looking into every `node_modules` directory on the way.
The Tailwind packages therefore are not installed globally, but in
`$TAILWIND_HOME` (`/usr/local/lib/tailwindcss`) and linked into `$NODE_PATH`
(`/node_modules`), which is the last directory of that walk. That is why they
are found from any working directory, while a plugin in your project still takes
precedence.

Tags
----

 Tag         | Size
 ---         | ----
 latest, 4   | ![](https://img.shields.io/docker/image-size/minidocks/tailwindcss/latest?style=flat-square&logo=docker&label=size)
 4           | ![](https://img.shields.io/docker/image-size/minidocks/tailwindcss/4?style=flat-square&logo=docker&label=size)

Both tags track the latest Tailwind CSS 4 release; the image is rebuilt daily.

Everything from the [base image](https://github.com/minidocks/base) -- user
mapping, SSH, `wait-for`, timezone handling -- is available here as well.
