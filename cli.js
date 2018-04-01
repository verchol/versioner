#!/usr/bin/env

 const  minimist = require('minimist');
 const  _ = require('lodash');
 const Versioner  = require('./index');
 const assert = require('assert');
 const debug = require('debug')('cli');

let args = minimist(process.argv.slice(2));
//,{'unknown': (opt)=>{ console.log(opt)}});
let verbs = _.get(args, "_");

debug(verbs, args);
_.forEach(verbs, (v)=>{
  if (v === "validate"){
    let version = _.get(args, "version");
    assert(version);
    debug(`i am about to validate version ${_.get(args, "version")}`)
    let v = new Versioner(version)
    assert(v.validate());

  }
  if (v === "increment"){
    let version = _.get(args, "version");
    assert(version);
    debug(`i am about to increment version ${_.get(args, "version")}`)
    let v = new Versioner(version)
    let newVer = v.addBuild();
    console.log(newVer);
  }
})
//console.log(JSON.stringify(args));
