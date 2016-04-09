Pod::Spec.new do |s|

  s.name = "Services"
  s.version = "0.1.0"

  s.summary = "A bootstrap project for your next swift networking framework"

  s.homepage = "https://github.com/tiagomartinho/services"
  s.license  = "MIT"
  s.authors = { "Tiago Martinho" => "t.martinho@live.com.pt" }

  s.source = { :git => "https://github.com/tiagomartinho/services.git", :tag => "#{s.version}"}

  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = "services/Services/*.{swift}"

  s.dependency 'Alamofire', '~> 3.0'
  s.dependency 'SwiftyJSON', '~> 2.3.2'
end
