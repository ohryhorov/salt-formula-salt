#!/bin/sh
{%- from "salt/map.jinja" import minion with context %}

{%- if minion.ca is defined %}
{%- if minion.initial_data is defined %}
mkdir -p /etc/pki/pki_ca.bak
mkdir -p /etc/pki/ca
mv /etc/pki/ca/* /etc/pki/pki_ca.bak
scp -r backupninja@{{ minion.initial_data.source }}:/srv/backupninja/{{ minion.initial_data.host }}/etc/pki/ca/ca.0/* /etc/pki/ca
{%- endif %}
{%- endif %}