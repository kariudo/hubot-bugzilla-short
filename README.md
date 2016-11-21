# hubot-bugzilla-short

A hubot script to return short links to bugzilla bugs when mentioned

See [`src/bugzilla-short.coffee`](src/bugzilla-short.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-bugzilla-short --save`

Then add **hubot-bugzilla-short** to your `external-scripts.json`:

```json
["hubot-bugzilla-short"]
```

## Sample Interaction

```
user1>> did you see bug 1234
hubot>> :bug: http://bit.ly/xxxxxxxx
```
