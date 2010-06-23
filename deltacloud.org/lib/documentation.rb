module DocumentationHelper
  def documentation_pages
    [
      { :href => 'documentation.html', :menu => 'Overview' },
      { :href => "api.html" , :menu => 'REST API', :description => 'REST API definition' },
      { :href => "drivers.html" , :menu => 'Drivers', :description => 'Currently-supported drivers' },
      { :href => "framework.html" , :menu => 'Framework', :description => 'Framework for writing additional drivers' },
      { :href => "client-ruby.html" , :menu => 'Ruby Client', :description => 'Ruby client' },
      { :href => "image-builder.html" , :menu => 'Image Builder', :description => 'Image Builder' },
    ]
  end

end

Webby::Helpers.register(DocumentationHelper)
