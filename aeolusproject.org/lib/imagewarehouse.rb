module ImageWarehouseHelper
  def imagewarehouse_pages
    [
      { :href => 'imagewarehouse.html', :menu => 'Overview' },
      { :href => 'imagewarehouse-contribute.html', :menu => "Contribute", :description => "Contribute" },
    ]
  end

end

Webby::Helpers.register(ImageWarehouseHelper)
