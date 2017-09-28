#! /usr/bin/env bash
export TAGINFO=`git describe --long --tags --first-parent`
export TIMESTAMP=`date +"%Y%m%d-%H%M%S"`
# This is approximately the same as GUMBALLS_SESSION
export SESSIONLOGDIR=${TAGINFO}_$TIMESTAMP

export STAGENAME=f5-openstack-agent_mitaka-unit
sudo -E cd /home/jenkins/f5-openstack-agent && \
docker run -u jenkins -v `pwd`:/home/jenkins/f5-openstack-agent \
docker-registry.pdbld.f5net.com/openstack-test-agentunitrunner-prod/mitaka \
$STAGENAME $SESSIONLOGDIR
mkdir -p ${COVERAGERESULTS}-unit
mv .coverage ${COVERAGERESULTS}-unit