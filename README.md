Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-graylog2.png?branch=master)](http://travis-ci.org/realityforge/chef-graylog2)

A cookbook that installs the xymon monitoring software.

Requirements
============

Platform:

* Ubuntu


Attributes
==========

* `node["xymon"]["servers"]` - An array of ip addressed of the server side component, default [].

Usage
=====

To use this cookbook, set the attributes above on the node via a role or the node object itself. In a role.rb:

    "xymon" => {
      "servers" => [ "127.0.0.1" ]
    }

