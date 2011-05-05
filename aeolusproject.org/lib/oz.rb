module OzHelper
  def oz_pages
    [
      { :href => 'oz.html', :menu => 'Overview' },
      { :href => 'oz-download.html', :menu => "Downloads", :description => "Downloads" },
      { :href => 'oz-examples.html', :menu => "Examples", :description => "Examples" },
      { :href => 'oz-architecture.html', :menu => "Architecture", :description => "Architecture" },
      { :href => 'oz-advanced.html', :menu => "Advanced", :description => "Advanced usage" },
      { :href => 'oz-install.html', :menu => "oz-install", :description => "oz-install man page" },
      { :href => 'oz-customize.html', :menu => "oz-customize", :description => "oz-customize man page" },
      { :href => 'oz-generate-icicle.html', :menu => "oz-generate-icicle", :description => "oz-generate-icicle man page" },
      { :href => 'oz-cleanup-cache.html', :menu => "oz-cleanup-cache", :description => "oz-cleanup-cache man page" },
    ]
  end

end

Webby::Helpers.register(OzHelper)
