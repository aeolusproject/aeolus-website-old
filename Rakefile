
docs_dir   = File.dirname(__FILE__) + '/docs'
images_dir = File.dirname(__FILE__) + '/images'
output_dir = File.dirname(__FILE__) + '/output'
bin_dir    = File.dirname(__FILE__) + '/bin'
markdown   = bin_dir + '/Markdown.pl'

task :default do
  FileUtils.mkdir_p( output_dir )
  Dir.chdir( docs_dir ) do
    Dir[ '*.mdown' ].each do |doc|
      `#{markdown} #{doc} > #{output_dir}/#{File.basename( doc, '.mdown')}.html`
    end
  end
  FileUtils.cp_r( images_dir, output_dir )
end

task :clean do
  FileUtils.rm_rf( output_dir )
end
