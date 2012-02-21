---
title: Aeolus - Audrey
---
#Audrey#

* [Audrey Agent](#audrey_agent)
* [Configuration Server](#config_server)
* [Examples](#examples)
* [Get the source](#source)

Audrey is a system to aid in bootstrapping cloud guests with configuration data.

Audrey comprises two parts:

* Audrey Agent
* Configuration Server

The Audrey Agent is installed in the image of a cloud guest and serves as the bootstrap processor.  The Configuration Server runs stand-alone and contains all of the configuration information required by each launching cloud guest.  The Audrey Agent on the cloud guest contacts the Configuration Server to learn what configurations should be implemented on the guest.

.section-grouping

#Audrey Agent<a id="audrey_agent"></a>#

The Audrey Agent runs as soon as the cloud guest finishes booting.  The Agent picks up bootstrapping information from user-supplied data (for example, [user data in EC2](http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html#instancedata-user-data-retrieval)) and connects to the Configuration Server to retrieve configuration information.

##Audrey-enabled Images<a id="audrey_enabled_images"></a>##

Use [Image Factory](/imagefactory.html) to build an Audrey-enabled image.  Image Factory supports two methods of speficying packages to be installed in images:

###Image Factory Target Content<a id="image_factory_target_content"></a>###

    If you want to make sure that all images built by Image Factory contain the Audrey Agent, include the following XML in Image Factory's target content configuration file:

    <a id="example_image_factory_target_content"></a>
        <template_includes>
          <include target='all' os='all' version='all' arch='all'>
            <packages>
              <package name='aeolus-audrey-agent'/>
            </packages>
            <repositories>
              <repository name='aeolus-audrey'>
                <url>http://repos.fedorapeople.org/repos/aeolus/conductor/latest-release/fedora-15/x86_64/</url>
              </repository>
            </repositories>
          </include>
        </template_includes>

###Image Factory Build Template<a id="image_factory_build_template"></a>###

    If you want to build a single image through Image Factory with the Audrey Agent, use a template like the following:

    <a id="example_image_factory_build_template"></a>
        <template>
          <name>Fedora15-Audrey-Agent</name>
          <os>
            <name>Fedora</name>
            <version>15</version>
            <arch>x86_64</arch>
            <install type='iso'>
              <iso>http://download.devel.redhat.com/released/F-15/GOLD/Fedora/x86_64/iso/Fedora-15-x86_64-DVD.iso</iso>
            </install>
          </os>
          <repositories>
            <repository name='aeolusrepo'>
              <url>http://repos.fedorapeople.org/repos/aeolus/conductor/latest-release/fedora-15/x86_64/</url>
              <signed>False</signed>
            </repository>
          </repositories>
          <packages>
            <package name='aeolus-audrey-agent'/>
          </packages>
          <description>Fedora 15 With Audrey Agent</description>
        </template>

    Additional information for setting up the Audrey Agent can be found [here](http://aeolusproject.org/page/Audrey_Audrey-Start-Setup).

%br

.section-grouping

#Configuration Server<a id="config_server"></a>#

    The Configuration Server provides two services: it delivers configuration files and paramters to Audrey-enabled guests, and it can share configuration information between launching guests.

##Setup<a id="setup_config_server"></a>##

    When deploying a Configuration Server, you have to take a couple of items into consideration:

    * All of the launched instances for a particular cloud provider account must be able to access the Configuration Server over https.
    * Your [Conductor](/conductor.html) server must be able to access the Configuration Server over https.

  %p.note Currently, deploying Conductor and Configuration Server on the same host is not supported.
  :markdown
    There are four steps to setup a Configuration Server:<a id="setup_config_server_steps"></a>

    1. Build a Configuration Server image
    2. Launch the Configuration Server instance
    3. Run the Configuration Server setup script
    4. Update Conductor with the Configuration Server details

  :markdown
    ###1. Build a Configuration Server<a id="build_config_server"></a>###

    You can find a Configuration Server template XML file [here](https://raw.github.com/blomquisg/aeolus-templates/master/templates/audrey-configserver.f15.xml).  This file can be used with the Aeolus tool chain to [build and push](/make_template.html) the Configuration Server image to a cloud provider.

    The rest of the setup documentation will use [Amazon EC2](http://aws.amazon.com/ec2/) as the example cloud provider.

    ###2. Launch the Configuration Server<a id="launch_config_server"></a>###

  %p.note The Configuration Server cannot be launched directly from Conductor.  Instead, the Configuration Server instance must be launched from the cloud provider's console.
  :markdown
    After pushing the Configuration Server image to EC2 as an Amazon Machine Image (AMI), you can launch the AMI from the Amazon EC2 console.<a id="launch_config_server_steps"></a>

    1. Log into [EC2](https://console.aws.amazon.com/s3/home)
    2. Locate yournewly uploaded AMI (under the "EC2" tab, click the "AMIs" link in the left nav)
    3. Right-click the AMI and select "Launch instance"

    The Amazon EC2 console will walk through the steps to launch the AMI.  It is typically sufficient to accept all of the default selections.

    ###3. Setup the Configuration Server<a id="setup_config_server"></a>###

    Once the Configuration Server is running, log into Configuration Server and setup the Configuration Server service.

    From the Amazon EC2 console, locate the newly launched instance.  Grab the public DNS name and the key pair used wen launching the instance.

    Next, log into the instance using the public DNS name and the private key:

        $> ssh -i ${private_key} root@${ec2_public_dns_name}

    Once you are logged in, you can execute the Configuration setup script:

        #> aeolus-configserver-setup

    You can see sample output of the script [here](https://www.aeolusproject.org/redmine/projects/audrey/wiki/Configserver_Setup_Script_Output).

    ####Test the Configuration Server<a id="test_config_server"></a>####

    To test the Configuration Server you should point a web browser to:

        https://${ec2_public_dns_name}/version

    And you should see output similar to:

        <config-server>
          <application-version>0.4.5</application-version>
          <api-version>1</api-version>
        </config-server>

    ####Collect data for Conductor<a id="collect_conductor_data"></a>####

    Once the Configuration Server setup is complete, collect information from the script output to apply to Conductor:

    * The public DNS name of the Configuration Server instance (the ec2 public DNS name, in this example)
    * The Conductor Auth Key (see [line 27](https://www.aeolusproject.org/redmine/projects/audrey/wiki/Configserver_Setup_Script_Output) from the script output)
    * The Conductor Auth Secret (see [line 28](https://www.aeolusproject.org/redmine/projects/audrey/wiki/Configserver_Setup_Script_Output) from the script output)

    ###4. Update Conductor<a id="update_conductor"></a>###

    To update Conductor:<a id="update_conductor_steps"></a>

    1. [Log into Conductor](/first_login.html)
    2. Navigate to the cloud providers (Administer -> Cloud Providers)
    3. Select the cloud provider where the Configuration Server instance is running
    4. Select "Accounts"
    5. Select the cloud provider account where the Configuration Server instance is running
    6. Click the "[ Add ]" link to add a Configuration Server to the provider account
       <img width="700px" height="300px" src="https://www.aeolusproject.org/redmine/attachments/202/aeolus-provider-account-before.png"/>
    7. Enter the following information into the "Add Configserver" page:
       <img width="700px" heigth="300px" src="https://www.aeolusproject.org/redmine/attachments/204/aeolus-add-configserver.png"/>
        * Server Endpoint (URL): https://${ec2_public_dns_name}
        * Consumer Key: the [Conductor Auth Key](#collect_conductor_data)
        * Consumer Secret: the [Conductor Auth Secret](#collect_conductor_data)
    8. Click "Save"
      <br/><img width="700px" heigth="300px" src="https://www.aeolusproject.org/redmine/attachments/203/aeolus-provider-account-after.png"/>

%br

.section-grouping
  :markdown
    #Examples<a id="examples"></a>#

    All of the Audrey examples are kept in [our code repository](https://github.com/aeolusproject/audrey/tree/master/examples).

%br

.section-grouping

#Source Code<a id="source"></a>#

Our source code repo is hosted on [github](https://github.com/aeolusproject/audrey/).
