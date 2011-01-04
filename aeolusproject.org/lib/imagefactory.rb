module ImageFactoryHelper
  def imagefactory_pages
    [
      { :href => 'imagefactory.html', :menu => 'Overview' },
    ]
  end

end

Webby::Helpers.register(ImageFactoryHelper)
