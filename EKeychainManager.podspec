Pod::Spec.new do |spec|

  spec.name         = "EKeychainManager"
  spec.version      = "0.0.1"
  spec.summary      = "A Manager to keychain with the objetive to storage tokens from applications into keychain without increasing the amount of busines rules or code in general to do this."

  spec.description  = <<-DESC
  This cocoapods will help you to manage a token in keychain
                   DESC


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "Lucas" => "lucasmirsoa@icloud.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.platform     = :ios

  #  When using multiple platforms
  spec.ios.deployment_target = "10.3"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/Evino/ekeychain.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"

end
