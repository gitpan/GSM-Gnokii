#!/usr/bin/perl

use strict;
$^W = 1;

use Test::More;

eval "use Test::Pod::Coverage tests => 1";
plan skip_all => "Test::Pod::Coverage required for testing POD Coverage" if $@;
pod_coverage_ok ("GSM::Gnokii", "GSM::Gnokii is covered");
