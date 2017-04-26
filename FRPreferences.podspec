Pod::Spec.new do |s|
  s.name         = 'FRPreferences'
  s.version      = '1.0.10'
  s.summary      = "In-App Preferences controls built easily"
  s.homepage         = "https://github.com/FouadRaheb/FRPreferences"
  s.license          = 'GPL'
  s.authors          = { "Fouad Raheb" => "fouad.raheb@gmail.com" }
  s.social_media_url = "https://twitter.com/FouadRaheb"
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/FouadRaheb/FRPreferences.git", :tag => s.version.to_s }
  s.source_files = 'FRPreferences/*.{h,m}', 'FRPreferences/**/*.{h,m}'
  s.requires_arc = true
end