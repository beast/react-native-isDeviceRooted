/**
 * @providesModule RNIsDeviceRooted
 * @flow
 */
'use strict';

var NativeRNIsDeviceRooted = require('NativeModules').RNIsDeviceRooted;

/**
 * High-level docs for the RNIsDeviceRooted iOS API can be written here.
 */

var RNIsDeviceRooted = {
  test: function() {
    NativeRNIsDeviceRooted.test();
  }
};

module.exports = RNIsDeviceRooted;
