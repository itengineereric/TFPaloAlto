resource "panos_virtual_router" "default" {
    name = "default"
    static_dist = 10
    interfaces = [
        panos_ethernet_interface.e1.name,
        panos_ethernet_interface.e2.name,
    ]

    lifecycle {
        create_before_destroy = true
    }
}

resource "panos_ethernet_interface" "e1" {
    vsys = "vsys1"
    name = "ethernet1/1"
    mode = "layer3"

    lifecycle {
        create_before_destroy = true
    }
}

resource "panos_ethernet_interface" "e2" {
    vsys = "vsys1"
    name = "ethernet1/2"
    mode = "layer3"

    lifecycle {
        create_before_destroy = true
    }
}



resource "panos_ethernet_interface" "Secured" {
    name = "ethernet1/2"
    vsys = "vsys1"
    mode = "layer3"
    static_ips = ["10.10.0.1/24"]
    comment = "Configure internal network"
    lifecycle {
        create_before_destroy = true
    }
}

resource "panos_ethernet_interface" "public" {
    name = "ethernet1/1"
    vsys = "vsys1"
    mode = "layer3"
    enable_dhcp = true
    create_dhcp_default_route = true
    dhcp_default_route_metric = 10

    lifecycle {
        create_before_destroy = true
    }
}