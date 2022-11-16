#!/usr/bin/env python3
# encoding: utf-8

import logging
import sys

if not sys.executable.startswith('/omd'):
    sys.stdout.write("ERROR: Only executable with sites python\n")
    sys.exit(2)

sys.path.pop(0)
import cmk.utils.log
import cmk.utils.debug
from cmk.utils.exceptions import MKTerminate
from cmk.utils.type_defs import LATEST_SERIAL

import cmk.base.utils
import cmk.base.config as config
from cmk.utils.log import console
import cmk.base.checking as checking
import cmk.base.check_api as check_api
import cmk.base.ip_lookup as ip_lookup

import cmk.base.plugins.agent_based.check_mk
import cmk.base.plugins.agent_based.checkpoint_vpn_tunnels
import cmk.base.plugins.agent_based.cmk_site_statistics
import cmk.base.plugins.agent_based.cpu_utilization_os
import cmk.base.plugins.agent_based.datapower_tcp
import cmk.base.plugins.agent_based.dell_hw_info
import cmk.base.plugins.agent_based.docker_container_cpu
import cmk.base.plugins.agent_based.docker_container_cpu_cgroupv2
import cmk.base.plugins.agent_based.docker_container_mem
import cmk.base.plugins.agent_based.docker_container_mem_cgroupv2
import cmk.base.plugins.agent_based.docker_node_info
import cmk.base.plugins.agent_based.esx_vsphere_hostsystem_section
import cmk.base.plugins.agent_based.esx_vsphere_systeminfo
import cmk.base.plugins.agent_based.fritz
import cmk.base.plugins.agent_based.hp_proliant_mem
import cmk.base.plugins.agent_based.hp_proliant_systeminfo
import cmk.base.plugins.agent_based.hr_mem
import cmk.base.plugins.agent_based.inentory_ipmi_firmware
import cmk.base.plugins.agent_based.infoblox_osinfo
import cmk.base.plugins.agent_based.infoblox_systeminfo
import cmk.base.plugins.agent_based.inv_checkmk
import cmk.base.plugins.agent_based.inv_cisco_vlans
import cmk.base.plugins.agent_based.inv_esx_vsphere_hostsystem
import cmk.base.plugins.agent_based.inv_if
import cmk.base.plugins.agent_based.inv_oracle_tablespaces
import cmk.base.plugins.agent_based.inventory_dmidecode
import cmk.base.plugins.agent_based.inventory_docker_node_network
import cmk.base.plugins.agent_based.inventory_esx_vsphere_clusters
import cmk.base.plugins.agent_based.inventory_esx_vsphere_virtual_machines
import cmk.base.plugins.agent_based.inventory_k8s_endpoint_info
import cmk.base.plugins.agent_based.inventory_k8s_ingress_info
import cmk.base.plugins.agent_based.juniper_info
import cmk.base.plugins.agent_based.k8s_endpoint_info
import cmk.base.plugins.agent_based.k8s_ingress_infos
import cmk.base.plugins.agent_based.k8s_nodes
import cmk.base.plugins.agent_based.k8s_pod_container
import cmk.base.plugins.agent_based.livestatus_status
import cmk.base.plugins.agent_based.lnx_if
import cmk.base.plugins.agent_based.lxc_container_cpu
import cmk.base.plugins.agent_based.lxc_container_cpu_cgroupv2
import cmk.base.plugins.agent_based.mem
import cmk.base.plugins.agent_based.mem_used
import cmk.base.plugins.agent_based.mem_used_sections
import cmk.base.plugins.agent_based.omd_apache
import cmk.base.plugins.agent_based.omd_info
import cmk.base.plugins.agent_based.omd_status
import cmk.base.plugins.agent_based.oracle_tablespaces
import cmk.base.plugins.agent_based.quantum_storage
import cmk.base.plugins.agent_based.snmp_extended_info
import cmk.base.plugins.agent_based.snmp_info
import cmk.base.plugins.agent_based.snmp_os
import cmk.base.plugins.agent_based.snmp_uptime
import cmk.base.plugins.agent_based.tcp_conn_stats
import cmk.base.plugins.agent_based.uptime
import cmk.base.plugins.agent_based.winperf_if
import cmk.base.plugins.agent_based.winperf_tcp_conn
cmk.base.utils.register_sigint_handler()

# very simple commandline parsing: only -v (once or twice) and -d are supported

cmk.utils.log.setup_console_logging()
logger = logging.getLogger("cmk.base")

# TODO: This is not really good parsing, because it not cares about syntax like e.g. "-nv".
#       The later regular argument parsing is handling this correctly. Try to clean this up.
cmk.utils.log.logger.setLevel(cmk.utils.log.verbosity_to_log_level(len([ a for a in sys.argv if a in [ "-v", "--verbose"] ])))

if '-d' in sys.argv:
    cmk.utils.debug.enable()

config.load_checks(check_api.get_check_api_context, [
    '/omd/sites/cmk/share/check_mk/checks/allnet_ip_sensoric',
    '/omd/sites/cmk/share/check_mk/checks/aruba_wlc_aps',
    '/omd/sites/cmk/share/check_mk/checks/citrix_controller',
    '/omd/sites/cmk/share/check_mk/checks/citrix_state',
    '/omd/sites/cmk/share/check_mk/checks/docker_node_info',
    '/omd/sites/cmk/share/check_mk/checks/fireeye_sys_status',
    '/omd/sites/cmk/share/check_mk/checks/hp_proliant_da_phydrv',
    '/omd/sites/cmk/share/check_mk/checks/ibm_mq_channels',
    '/omd/sites/cmk/share/check_mk/checks/ibm_mq_managers',
    '/omd/sites/cmk/share/check_mk/checks/ibm_mq_queues',
    '/omd/sites/cmk/share/check_mk/checks/k8s_ingress_infos',
    '/omd/sites/cmk/share/check_mk/checks/k8s_pod_container',
    '/omd/sites/cmk/share/check_mk/checks/k8s_roles',
    '/omd/sites/cmk/share/check_mk/checks/lparstat_aix',
    '/omd/sites/cmk/share/check_mk/checks/mkeventd_status',
    '/omd/sites/cmk/share/check_mk/checks/mounts',
    '/omd/sites/cmk/share/check_mk/checks/mssql_versions',
    '/omd/sites/cmk/share/check_mk/checks/netapp_api_disk',
    '/omd/sites/cmk/share/check_mk/checks/netapp_api_info',
    '/omd/sites/cmk/share/check_mk/checks/omd_apache',
    '/omd/sites/cmk/share/check_mk/checks/oracle_dataguard_stats',
    '/omd/sites/cmk/share/check_mk/checks/oracle_instance',
    '/omd/sites/cmk/share/check_mk/checks/oracle_performance',
    '/omd/sites/cmk/share/check_mk/checks/oracle_recovery_area',
    '/omd/sites/cmk/share/check_mk/checks/perle_chassis',
    '/omd/sites/cmk/share/check_mk/checks/perle_chassis_slots',
    '/omd/sites/cmk/share/check_mk/checks/perle_psmu',
    '/omd/sites/cmk/share/check_mk/checks/postfix_mailq',
    '/omd/sites/cmk/share/check_mk/checks/postfix_mailq_status',
    '/omd/sites/cmk/share/check_mk/checks/suseconnect',
])
config.load_packed_config(serial=LATEST_SERIAL)
config.ipaddresses = {'localhost': '127.0.0.1'}

config.ipv6addresses = {}

try:
    sys.exit(checking.do_check('localhost', None))
except MKTerminate:
    out.output('<Interrupted>\n', stream=sys.stderr)
    sys.exit(1)
except SystemExit as e:
    sys.exit(e.code)
except Exception as e:
    import traceback, pprint
    sys.stdout.write("UNKNOWN - Exception in precompiled check: %s (details in long output)\n" % e)
    sys.stdout.write("Traceback: %s\n" % traceback.format_exc())

    sys.exit(3)
