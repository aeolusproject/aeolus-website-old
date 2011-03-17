module OzSupportHelper
  def ozguests
    [
     { :name => "Fedora 7,8,9,10,11,12,13,14", :install => true, :customize => true, :icicle => true },
     { :name => "FedoraCore 1,2,3,4,5,6", :install => true, :customize => false, :icicle => false },
     { :name => "RHEL-6", :install => true, :customize => true, :icicle => true },
     { :name => "RHEL-5.{0,1,2,3,4,5,6}", :install => true, :customize => true, :icicle => true },
     { :name => "RHEL-4.{0,1,2,3,4,5,6,7,8}", :install => true, :customize => false, :icicle => false },
     { :name => "RHEL-3.{0,1,2,3,4,5,6,7,8,9}", :install => true, :customize => false, :icicle => false },
     { :name => "RHEL-2.1 GOLD, U1, U2, U3, U4, U5, U6", :install => true, :customize => false, :icicle => false },
     { :name => "OpenSUSE 11.{0,1,2,3}", :install => true, :customize => false, :icicle => true },
     { :name => "Ubuntu 6.10, 7.04, 7.10, 8.04, 8.10, 9.04, 9.10, 10.04, 10.10", :install => true, :customize => false, :icicle => false },
     { :name => "Windows 2000, XP, 2003, 7, 2008", :install => true, :customize => false, :icicle => false },
     { :name => "Red Hat Linux 7.0, 7.1, 7.2, 7.3, 8, 9", :install => true, :customize => false },
     { :name => "CentOS 3.{0,1,2,3,4,5,6,7,8,9}", :install => true, :customize => false, :icicle => false },
     { :name => "CentOS 4.{0,1,2,3,4,5,6,7,8,9}", :install => true, :customize => false, :icicle => false },
     { :name => "CentOS 5.{0,1,2,3,4,5,6}", :install => true, :customize => true, :icicle => true },
    ]
  end

  LABELS = { true => "yes", false => "no" }

  def support_indicator(value)
    text = LABELS[value] || "TBD"
    cls = value ? "supported" : "not-supported"
    "<td class=\"#{cls}\">#{text}</td>"
  end
end

Webby::Helpers.register(OzSupportHelper)
