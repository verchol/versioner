describe('semver test', ()=>{
  const assert = require('assert');
  it('test version', async ()=>{
    const semverRegex = require('semver-regex');
    assert(semverRegex().test('23.1.1+falfa'));

    let r = 'oleg 1.0.123 production 1.0.124'.match(semverRegex())
    console.log(r);
    r = semverRegex().exec(
      '1.2.3-alpha.10.beta.0+build.unicorn.rainbow')[0]
    console.log('exec '  + r);
    return r;
  })
  it('diff', async ()=>{
    const semverDiff = require('semver-diff');

    let diff = semverDiff('2.0.1-alpha', '1.3.1')
    console.log(diff);
    assert(diff, 'minor');
  })
  it('match digit', ()=>{
    let a = '1.2.3'.match(/\d+/);
    console.log(JSON.stringify(a));
  })
  it('build digit', async ()=>{
    debugger;
    const Versioner = require('./index');
    let v = new Versioner('2.0.3-alpha');
    assert.equal(v.addBuild(), '2.0.4-alpha');
    v = new Versioner('2.0.4-alpha');
    assert.equal(v.addBuild(), '2.0.5-alpha');
    v = new Versioner('2.0.22-alpha');
    assert.equal(v.addBuild(), '2.0.23-alpha');

  })
})
