module ProjectHelper
  def project_pages
    [
      { :href => 'conductor.html', :menu => 'Conductor', :key => 'conductor', :description => 'Multiple cloud web UI' },
      { :href => 'oz.html', :menu => 'Oz', :key => 'oz', :description => 'Automated virtual machine installer' },
      { :href => "imagefactory.html" , :menu => 'ImageFactory', :key => 'imagefactory', :description => 'Daemon with a QMF interface for building cloud images' },
      { :href => "imagewarehouse.html" , :menu => 'Image Warehouse', :key => 'imagewarehouse', :description => 'Daemon to move cloud images from cloud to cloud' },
      { :href => "audrey.html" , :menu => 'Audrey', :key => 'audrey', :description => 'A set of tools to do run-time configuration of cloud instances' }
    ]
  end

end

Webby::Helpers.register(ProjectHelper)
