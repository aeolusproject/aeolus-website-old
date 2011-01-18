module NewsHelper
  def all_news
    [
      %Q(Packages for Aeolus Conductor are now available for Fedora 13, Fedora 14, and RHEL-6.  Click <a href="http://repos.fedorapeople.org/repos/aeolus/packages/">here</a> to get to the repositories.),
      %Q(Deltacloud Aggregator renamed to Aeolus Project),
    ]
  end

end

Webby::Helpers.register(NewsHelper)
