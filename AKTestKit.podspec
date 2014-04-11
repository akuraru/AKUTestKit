
Pod::Spec.new do |s|
  s.name         = "AKUTestKit"
  s.version      = "0.0.2"
  s.summary      = "library that wraps the delegate and datesource of UITableView"
  s.homepage     = "https://github.com/akuraru/#{s.name}"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "akuraru" => "akuraru@gmail.com" }
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "#{s.homepage}.git", :tag => s.version }
  s.source_files  = "#{s.name}/**/*.{h,m}"
  s.requires_arc = true
end
