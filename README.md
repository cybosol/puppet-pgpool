pgpool.
======

Puppet module for installing and configuring pgpool. 

pgpool version is set to II-91.

It uses "hiera" to pull server list and a erb template for configuration. 
Currently I have set the config to load balance only. Feel free to extend 
as required.

Install instructions.
====================
Download the module to your modules directory and change the name to 
"pgpool"


Supported Platforms.
===================
RedHat / Centos.
(More platforms will be added soon.)

Prerequisite.
============
* Postgres yum repository added to node's yum configuration.
* Hiera. (though you can replace it by directly setting the server list or
   by getting it from ENC or setting it as a class parameter and pass the 
   server list while calling the class.)

License.
=======
Please check "LICENSE" file for license information.


Copyright (C) 2013 Enterprise Integrated Solutions (Cybosol), Dammam, KSA

   http://www.cybosol.com/
