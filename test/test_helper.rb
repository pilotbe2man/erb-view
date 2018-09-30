$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start

require 'erb/view'

require 'minitest/autorun'
require 'minitest/rg'
require 'pry'
