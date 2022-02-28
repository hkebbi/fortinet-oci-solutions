
*_Note: This will deploy FortiGate-HA by default in "me-jeddah" Region & FG-v.7.0.5..**

However, you can replace the region name in the: "Region" and the "VM_IMAGE_OCID" variable fields with required region name (During Step .5 above):
Example"  "uk-london-1" / "eu-frankfurt-1" / "me-jeddah-1" / "eu-amsterdam-1"

## For new hub VCN Folder:
1. This will create New VCN, New IGW, 4 new Subnets, new 4 RTs, new NSG and Two new FG A/P inside VCN with all required config.

* Port-1 /28 : mgmt (out-of-band management). For API-Call and SDN Connectors.  

* Port-2 /24 : WAN (untrust). Towards IGW.

* Port-3 /28 : LAN (Trust). Towards VCN and LPG.

* Port-4 /28 : HeartBeat (HB).Between FG A/P.


