# Thingful GROW Node OpenAPI Specification
[![Build Status](https://travis-ci.org/growobservatory/ThingfulNode.svg?branch=master)](https://travis-ci.org/growobservatory/ThingfulNode)

## Links

- Documentation(ReDoc): https://growobservatory.github.io/ThingfulNode/
- SwaggerUI: https://growobservatory.github.io/ThingfulNode/swagger-ui/
- Look full spec:
    + JSON https://growobservatory.github.io/ThingfulNode/swagger.json
    + YAML https://growobservatory.github.io/ThingfulNode/swagger.yaml
- Preview spec version for branch `[branch]`: https://growobservatory.github.io/ThingfulNode/preview/[branch]

## Working on specification
### Install

1. Install [Node JS](https://nodejs.org/)
2. Clone repo and `cd`
    + Run `npm install`

### Install using Docker
1. Install [Docker](https://docs.docker.com/engine/installation/)
2. Build the Docker images
```
docker build -t thingful/grow-docs .
```
3. Run the image
```
docker run --name thingful-grow-docs -v `pwd`:/src/app -p 3000:3000 -p 5000:5000 -d thingful/grow-docs
```
Shortcuts are available for make users. Run
```
make help
```
to see the available commands.

### Usage

1. Run `npm start`
2. Checkout console output to see where local server is started. You can use all [links](#links) (except `preview`) by replacing https://growobservatory.github.io/ThingfulNode/ with url from the message: `Server started <url>`
3. Make changes using your favorite editor or `swagger-editor` (look for URL in console output)
4. All changes are immediately propagated to your local server, moreover all documentation pages will be automagically refreshed in a browser after each change
**TIP:** you can open `swagger-editor`, documentation and `swagger-ui` in parallel
5. Once you finish with the changes you can run tests using: `npm test`
6. Share you changes with the rest of the world by pushing to GitHub :smile:
