module OzHelper
  def oz_pages
    [
      { :href => 'oz.html', :menu => 'Overview' },
      { :href => 'oz-contribute.html', :menu => "Contribute", :description => "Contribute to oz development" },
    ]
  end

end

Webby::Helpers.register(OzHelper)
