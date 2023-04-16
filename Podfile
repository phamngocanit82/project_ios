# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'project_ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for project_ios
  #swit
  pod 'Firebase/Database’
  pod 'Firebase/Messaging'
  pod 'FacebookCore'
  pod 'FacebookLogin'
  pod 'InstagramKit'
  pod 'SDWebImage'
  pod 'SQLCipher'
  pod 'SSZipArchive'
  pod 'TouchJSON'
  pod 'GDataXML-HTML'
  pod 'AESCrypt'
  pod 'CryptoSwift'
  pod 'NSHash'
  pod 'Alamofire'
  pod 'NVActivityIndicatorView'
  pod 'Alamofire'
  pod 'SwiftLint'
  pod 'Kingfisher'
  pod 'Realm'
  #object c
  pod 'SDWebImage'
  pod 'DGActivityIndicatorView'
  #object c
  target 'project_iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'project_iosUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                 end
            end
     end
  end
end
