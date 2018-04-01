const semverRegex = require('semver-regex');
const semDiff     = require('semver-diff');
const _           = require('lodash');
const assert      = require('assert');
const debug = require('debug')('Versioner')

class Versioner{
  static versionFormatError (version) {
     assert.fail(`invalid version format ${version}, follow semvar pattern`);
  }
  constructor(version){
   let valid = this.validate(version);
   if (!valid) Versioner.versionFormatError(version);
   let v = this.parseVersion(version);
   this.version = v;
  }
  parseVersion(version){
    return version;
  }
  validate(v){
      (_.isUndefined(v)) ? v = this.version : v
      return semverRegex().test(v);
  }
  addBuild(v, num=1){
    if (!v) v = this.version;
    this.validate(v);
    assert(v.length, 1);
    let versionArray  =  _.split(v, '.');
    debug(`splitted digit ${versionArray}`);
    let lastDigit = _.last(versionArray);

    let digit = ((buildDigit)=>{

      buildDigit = buildDigit.match(/\d+/);
       buildDigit = _.toInteger(buildDigit);
       buildDigit++;

      return buildDigit;
    })(lastDigit);

    digit = lastDigit.toString().replace(/\d+/, digit);
    versionArray[versionArray.length - 1] = digit;
    debug(`digits ${versionArray} new digits ${versionArray.join('.')}`);
    return versionArray.join('.');

  }
}

module.exports = Versioner;
