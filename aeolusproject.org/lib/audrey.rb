module AudreyHelper
  def audrey_pages
    [
      { :href => 'audrey.html', :menu => 'Overview' },
    ]
  end

end

Webby::Helpers.register(AudreyHelper)
