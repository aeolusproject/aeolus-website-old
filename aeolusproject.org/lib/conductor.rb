module ConductorHelper
  def conductor_pages
    [
      { :href => 'conductor.html', :menu => 'Overview' },
      { :href => 'conductor-install.html', :menu => "Install" , :description => "Installation instructions" },
      { :href => 'conductor-use.html', :menu => 'Post-Install', :description => 'Post-installation End-to-End Usage Documentation' },
     { :href => 'conductor-contribute.html', :menu => 'Contribute', :description => "Contribute to Conductor development" },
    ]
  end

end

Webby::Helpers.register(ConductorHelper)
