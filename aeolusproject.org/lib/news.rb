module NewsHelper
  def all_news
    [
      %Q(Oz version 0.1.0 is released.  Tarballs and packages are available from <a href="oz-download.html">here</a>.),
      %Q(Packages for Aeolus Conductor are now available for Fedora 13, Fedora 14, and RHEL-6.  Click <a href="http://repos.fedorapeople.org/repos/aeolus/packages/">here</a> to get to the repositories.),
      %Q(Deltacloud Aggregator renamed to Aeolus Project),
    ]
  end

end

Webby::Helpers.register(NewsHelper)
