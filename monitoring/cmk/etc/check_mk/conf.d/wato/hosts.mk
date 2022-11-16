# Created by WATO
# encoding: utf-8

all_hosts += ['localhost', 'node01']

host_tags.update({'localhost': {'site': 'cmk', 'address_family': 'ip-v4-only', 'ip-v4': 'ip-v4', 'agent': 'cmk-agent', 'tcp': 'tcp', 'piggyback': 'auto-piggyback', 'snmp_ds': 'no-snmp', 'criticality': 'prod', 'networking': 'lan'}, 'node01': {'site': 'cmk', 'address_family': 'ip-v4-only', 'ip-v4': 'ip-v4', 'agent': 'cmk-agent', 'tcp': 'tcp', 'piggyback': 'auto-piggyback', 'snmp_ds': 'no-snmp', 'criticality': 'prod', 'networking': 'lan'}})

host_labels.update({})

# Host attributes (needed for WATO)
host_attributes.update(
{'localhost': {'meta_data': {'created_at': 1668604591.0, 'created_by': 'cmkadmin', 'updated_at': 1668606691.467924}}, 'node01': {'meta_data': {'created_at': 1668605248.0, 'created_by': 'cmkadmin', 'updated_at': 1668606691.468914}}})
