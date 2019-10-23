

Pod::Spec.new do |spec|

  spec.name         = "PushBots"
  spec.version      = "1.0.0"
  spec.summary      = "PushBots is a widget helps you in 
		       registering to push notification"
  spec.license      = "MIT"
  spec.homepage     = "https://github.com/Bathant/PushBots"
  spec.author       = { "bathant hegazy" => "bathanthegazy94@gmail.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/Bathant/PushBots.git", :tag => 		  		"1.0.0" }
  spec.swift_version = "5.0" 
  spec.source_files  = "PushNotficationSDK/**/*.{h,swift}"
end
