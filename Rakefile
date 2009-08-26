
docs_dir   = File.dirname(__FILE__) + '/docs'
images_dir = File.dirname(__FILE__) + '/images'
styles_dir = File.dirname(__FILE__) + '/styles'
output_dir = File.dirname(__FILE__) + '/output'
bin_dir    = File.dirname(__FILE__) + '/bin'
skin       = File.dirname(__FILE__) + '/skin/skin.html.tmpl'
markdown   = bin_dir + '/Markdown.pl'

task :default do
  FileUtils.mkdir_p( output_dir )
  Dir.chdir( docs_dir ) do
    Dir[ '*.mdown' ].each do |doc|
      html = `#{markdown} #{doc}`
      output = File.read( skin ) 
      output.sub!( /\$REPLACE\$/, html )
      File.open( "#{output_dir}/#{File.basename(doc, '.mdown')}.html", 'w' ) {|f| f << output }
    end
  end
  FileUtils.cp_r( images_dir, output_dir )
  FileUtils.cp_r( styles_dir, output_dir )
end

task :clean do
  FileUtils.rm_rf( output_dir )
end
