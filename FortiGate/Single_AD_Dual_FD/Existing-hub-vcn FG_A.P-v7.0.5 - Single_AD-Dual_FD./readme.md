

*_Note: This will deploy FortiGate-HA by default in "me-jeddah" Region & FG-v.7.2.0..**

However, you can replace the region name in the: "Region" and the "VM_IMAGE_OCID" variable fields with required region name (During Step .5 above):
Example"  "uk-london-1" / "eu-frankfurt-1" / "me-jeddah-1" / "eu-amsterdam-1"

## FG A.P v.7.2.0:

This is used for existing VCN and existing IGW.
<br /> 
Copy/paste VCN-OCID "Vcn_id" during terraform deployment on the OCI Stack.
<br /> 
This will create 4 new: 4 subnets, Two new RTs (Hb & Trust), new NSG and FG A/P inside existing VCN.
<br /> 
Create after deployment Two RTs ( unTrust and Managment) that points to existing IGW (0.0.0.0/0 --> IGW) on OCI RT.
<br /> 

* Port-1 /28 : mgmt (out-of-band management). For API-Call and SDN Connectors.  

* Port-2 /24 : WAN (untrust). Towards IGW.

* Port-3 /28 : LAN (Trust). Towards VCN and LPG.

* Port-4 /28 : HeartBeat (HB).Between FG A/P.


