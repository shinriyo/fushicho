# Fushicho

**Phoenix scaffolding system**

## Instal

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. run install command `mix archive.install`

 ex) `mix archive.install https://github.com/shinriyo/fushicho/releases/download/v0.1.0/fushicho_new-0.1.0.ez`

## How to use

 1. create API

 ex) title and body
 `mix phoenix.gen.json Post posts title:string body:text`

 2. run fushicho

 initialie args is `--init`
 `mix fushicho --init`

 make Rect code args is singular
 `mix fushicho post`

## Contribution

  1. test is `mix test`

  `web/static/js/` folder is temporary create

  initialize is `--init`
  `mix fushicho --init`

  name is singular model.

  `mix fushicho name`

 2. build is `mix archive.build` ans install is `mix archive.install`

 ez file was created.
 ex) `fushicho-0.1.0.ez`

  `mix archive.install`
 ex) `mix archive.install fushicho-0.1.0.ez`

 3. uninstall is `mix archive.uinstall`

 varsion is required
 ex) `mix archive.uninstall fushicho-0.1.0`

## Licence

 MIT Licence
