#!/bin/sh

ant -Dproject=samples -Denv=48_dev  clean-solution apply-patch zip
ant -Dproject=samples -Denv=48_prod clean-solution apply-patch zip
