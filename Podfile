# Uncomment the next line to define a global platform for your project
 #platform :ios, '13.0'
post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
target 'GitMate' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GitMate
  pod 'Alamofire'
  pod 'Kingfisher', '~> 7.0'
  pod 'lottie-ios', '~>3.2.3'
  pod 'SkeletonView'
  pod 'SwinjectStoryboard'
  pod 'CombineCocoa'
  pod 'CombineDataSources'
  target 'GitMateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GitMateUITests' do
    # Pods for testing
  end

end
