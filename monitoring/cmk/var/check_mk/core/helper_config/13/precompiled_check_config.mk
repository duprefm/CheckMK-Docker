��       }�(�mkeventd_enabled���management_bulkwalk_hosts�]�}�(�id��$59d84cde-ee3a-4f8d-8bec-fce35a2b0d15��value���	condition�}��options�}��description��.All management boards use SNMPv2 and bulk walk�sua�periodic_discovery�]�}�(h�$95a56ffc-f17e-44e7-a162-be656f19bedf�h}�(�severity_unmonitored�K�severity_vanished�K �check_interval�G@^      uh}�h
}�h�+Perform every two hours a service discovery�sua�
tag_config�}�(�aux_tags�]��
tag_groups�]�(}�(h�criticality��title��Criticality��tags�]�(}�(h�prod�h!�Productive system�h]�u}�(h�critical�h!�Business critical�h]�u}�(h�test�h!�Test system�h]�u}�(h�offline�h!�Do not monitor this host�h]�ueu}�(h�
networking�h!�Networking Segment�h#]�(}�(h�lan�h!�Local network (low latency)�h]�u}�(h�wan�h!�WAN (high latency)�h]�u}�(h�dmz�h!� DMZ (low latency, secure access)�h]�ueueu�active_checks�}��cmk_inv�]�(}�(h�$7ba2ac2a-5a49-47ce-bc3c-1630fb191c7f�h}��status_data_inventory��sh}��host_labels�}��cmk/docker_object��node�ssu}�(h�$b4b151f9-c7cc-4127-87a6-9539931fcd73�h}�hL�sh}�hN}��cmk/check_mk_server��yes�ssu}�(h�$2527cb37-e9da-4a15-a7d9-80825a7f6661�h}�hL�sh}�hN}��cmk/kubernetes�hXssues�custom_checks�]�}�(h�$ac9f8092-67c2-4a17-a350-28f78033e3b5�h}�(�service_description��CheckBackupError��	freshness�}�(�interval�K
�state�K�output��#Check result did not arrive in time�uuh}�h
}�h�Check-Backup-Error�sua�	all_hosts�]�(�	localhost��node01�e�	host_tags�}�(hq}�(�site��cmk��address_family��
ip-v4-only��ip-v4�hz�agent��	cmk-agent��tcp�h}�	piggyback��auto-piggyback��snmp_ds��no-snmp�h h&h6h:uhr}�(hvhwhxhyhzhzh{h|h}h}h~hh�h�h h&h6h:uu�
host_paths�}�(hq�/wato/hosts.mk�hrh�u�
snmp_hosts�]�}�(h}�hs}��snmp�h�ssh�ua�	tcp_hosts�]�(}�(h}�hs}�h}h}ssh�u}�(h}�hs}�h�h�ssh�u}�(h}�hs}�(�ping�}��$ne��ping�sh{}�h��no-agent�sush�ue�bulkwalk_hosts�]�}�(h�$b92a5406-1d57-4f1d-953d-225b111239e5�h�h}�hs}�(h�h�h�}��$ne��snmp-v1�sush
}�h�2Hosts with the tag "snmp-v1" must not use bulkwalk�sua�
only_hosts�]�}�(h�$10843c55-11ea-4eb2-bfbc-bce65cd2ae22�h�h}�hs}�h }�h�h2sssh
}�h�+Do not monitor hosts with the tag "offline"�sua�extra_host_conf�}��notification_options�]�}�(h�$814bf932-6341-4f96-983d-283525b5416d�h�d,r,f,s�h}�uas�host_attributes�}�(hq}��	meta_data�}�(�
created_at�GA��8��  �
created_by��cmkadmin��
updated_at�GA��:���xushr}�h�}�(h�GA��9P   h�h�h�GA��:���usu�ping_levels�]�}�(h�$0365b634-30bf-40a3-8516-08e86051508e�h}�(�loss�G@T      G@Y      ���packets�K�timeout�K�rta�G@�p     G@�p     ��uh}�hs}�h6h>ssh
}�h�4Allow longer round trip times when pinging WAN hosts�sua�host_check_commands�]�}�(h�$24da4ccd-0d1b-40e3-af87-0097df8668f2�h�service��Docker container status���h}�hN}�hP�	container�ssh
}�h�SMake all docker container host states base on the "Docker container status" service�sua�use_new_descriptions_for�]�(�
aix_memory��barracuda_mailqueues��brocade_sys_mem��casa_cpu_temp��	cisco_mem��cisco_mem_asa��cisco_mem_asa64��cmciii_psm_current��cmciii_temp��cmciii_lcp_airin��cmciii_lcp_airout��cmciii_lcp_water��cmk_inventory��db2_mem��df��	df_netapp��df_netapp32��docker_container_mem��enterasys_temp��esx_vsphere_datastores�� esx_vsphere_hostsystem_mem_usage��(esx_vsphere_hostsystem_mem_usage_cluster��etherbox_temp��fortigate_memory��fortigate_memory_base��fortigate_node_memory��hr_fs��hr_mem��http��huawei_switch_mem��
hyperv_vms��ibm_svc_mdiskgrp��ibm_svc_system��ibm_svc_systemstats_cache�� ibm_svc_systemstats_disk_latency��ibm_svc_systemstats_diskio��ibm_svc_systemstats_iops��innovaphone_mem��innovaphone_temp��juniper_mem��juniper_screenos_mem��juniper_trpz_mem��liebert_bat_temp��logwatch��logwatch_groups��mem_used��mem_win��	mknotifyd��mknotifyd_connection��mssql_backup��mssql_blocked_sessions��mssql_counters_cache_hits��mssql_counters_file_sizes��mssql_counters_locks��mssql_counters_locks_per_batch��mssql_counters_pageactivity��mssql_counters_sqlstats��mssql_counters_transactions��mssql_databases��mssql_datafiles��mssql_tablespaces��mssql_transactionlogs��mssql_versions��netscaler_mem��nullmailer_mailq��nvidia_temp��postfix_mailq��ps��qmail_stats��raritan_emx��raritan_pdu_inlet��services��solaris_mem��sophos_memory��statgrab_mem��
tplink_mem��ups_bat_temp��vms_diskstat_df��wmic_process��zfsget�e�enable_rulebased_notifications���notification_rules�]�}�(�allow_disable���contact_all���contact_all_with_email���contact_object��h�4Notify all contacts of a host/service via HTML email��disabled���notify_plugin��mail�}���ua�host_service_levels�]��service_service_levels�]��inventory_df_rules�]�}�(h�$b0ee8a51-703c-47e4-aec4-76430281604d�h}�(�ignore_fs_types�]�(�tmpfs��nfs��smbfs��cifs��iso9660�e�never_ignore_mountpoints�]��~.*/omd/sites/[^/]+/tmp$�auh}�hN}�hWhXssuau.