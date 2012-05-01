# -*- encoding: utf-8 -*-
$TEST = true

lib_dir  = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift lib_dir, File.dirname(__FILE__)

require 'simple/spawn'
ASSETS = File.join(File.dirname(__FILE__), 'assets')
