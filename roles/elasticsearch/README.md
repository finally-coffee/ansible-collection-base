# `finallycoffee.base.elastiscsearch`

A simple ansible role which deploys a single-node elastic container to provide
an easy way to do some indexing.

## Usage

Per default, `/opt/elasticsearch/data` is used to persist data, it is
customizable by using either `elasticsearch_base_path` or `elasticsearch_data_path`.

As elasticsearch be can be quite memory heavy, the maximum amount of allowed RAM
can be configured using `elasticsearch_allocated_ram_mb`, defaulting to 512 (mb).

The cluster name and discovery type can be overridden using
`elasticsearch_config_cluster_name` (default: elastic) and
`elasticsearch_config_discovery_type` (default: single-node), should one
need a multi-node elasticsearch deployment.

Per default, no ports or networks are mapped, and explizit mapping using
either ports (`elasticsearch_container_ports`) or networks
(`elasticsearch_container_networks`) is required in order for other services
to use elastic.
