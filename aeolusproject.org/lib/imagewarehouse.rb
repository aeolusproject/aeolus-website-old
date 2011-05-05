module ImageWarehouseHelper
  def imagewarehouse_pages
    [
      { :href => 'imagewarehouse.html', :menu => 'Overview' },
    ]
  end

end

Webby::Helpers.register(ImageWarehouseHelper)
