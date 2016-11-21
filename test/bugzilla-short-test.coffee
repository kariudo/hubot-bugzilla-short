chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'bugzilla-short', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/bugzilla-short')(@robot)

  it 'registers a hear listener for bug and bz', ->
    expect(@robot.hear).to.have.been.calledWith(/\b(?:(?:bug)|(?:bz)) ?(\d+)\b/i)
