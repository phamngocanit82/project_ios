# Uncomment the next line to define a global platform for your project
install! 'cocoapods', :warn_for_unused_master_specs_repo => false
platform :ios, '13.0'
target 'project_ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
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
