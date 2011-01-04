module NewsHelper
  def all_news
    [
      %Q(Packages for Aeolus Conductor are now available for Fedora 13, Fedora 14, and RHEL-6.  See http://repos.fedorapeople.org/repos/deltacloud/appliance/),
      %Q(Deltacloud Aggregator renamed to Aeolus Project),
    ]
  end

end

Webby::Helpers.register(NewsHelper)
