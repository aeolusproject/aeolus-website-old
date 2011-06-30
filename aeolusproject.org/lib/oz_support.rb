module OzSupportHelper
  def ozguestsfull
    [
     { :name => "CentOS 5.x", :install => true, :customize => true, :icicle => true },
     { :name => "Fedora 7 - 15", :install => true, :customize => true, :icicle => true },
     { :name => "OpenSUSE 11.x", :install => true, :customize => true, :icicle => true },
     # Had to be moved out of this array, and into the content page itself, so it could be visually styled correctly 
     #{ :name => "RHEL 5.x, 6.x", :install => true, :customize => true, :icicle => true },
    ]
  end

  def ozguestspartial
    [
     { :name => "CentOS 3.x, 4.x", :install => true, :customize => false, :icicle => false },
     { :name => "Debian 5, 6", :install => true, :customize => false, :icicle => false },
     { :name => "Fedora Core 1 - 6", :install => true, :customize => false, :icicle => false },
     { :name => "Red Hat Linux 7 - 9", :install => true, :customize => false },
     { :name => "RHEL 2.x, 3.x, 4.x <br /><em>(4.9 installs via repo not cdrom/ISO)</em>", :install => true, :customize => false, :icicle => false },
     { :name => "Ubuntu 6.06 - 11.04", :install => true, :customize => false, :icicle => false },
     # Had to be moved out of this array, and into the content page itself, so it could be visually styled correctly
     #{ :name => "Windows 2000, XP, 2003, 7, 2008", :install => true, :customize => false, :icicle => false },
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
