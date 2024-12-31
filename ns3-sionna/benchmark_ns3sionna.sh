#!/bin/bash

cd ../../

# some info about the machine
hostname
lscpu | grep "Model name"

NUM_RES=16
NUM_STAS=32

echo "Test stationary / high load"

./ns3 run "scratch/ns3-sionna/performance-sionna --channel=1 --sim_max_stas=${NUM_STAS} --mobile_scenario=false --mobile_speed=0.0 --udp_pkt_interval=20 --caching=true --mode=3 --sub_mode=${NUM_RES}"

echo "Test low mobility / low load"

./ns3 run "scratch/ns3-sionna/performance-sionna --channel=1 --sim_max_stas=${NUM_STAS} --mobile_scenario=true --mobile_speed=1.0 --udp_pkt_interval=1000 --caching=true --mode=3 --sub_mode=${NUM_RES}"

echo "Test high mobility / higher load"

./ns3 run "scratch/ns3-sionna/performance-sionna --channel=1 --sim_max_stas=${NUM_STAS} --mobile_scenario=true --mobile_speed=7.0 --udp_pkt_interval=20 --caching=true --mode=3 --sub_mode=${NUM_RES}"
