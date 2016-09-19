# requirements
require 'serverspec'
require 'net/http'
set :backend, :exec

# which ports are listening
describe 'ports are listened' do
  it 'nginx, jenkins and tomcat ports' do
   expect(port(8080)).to be_listening
   expect(port(9090)).to be_listening
   expect(port(9091)).to be_listening
  end
end

# jobs check
describe command('ls /var/lib/jenkins/jobs') do
	its(:stdout) { should match /deploy/ }
	its(:stdout) { should match /build/ }
end

# check if jenkins curl
describe 'jenkins' do
  it 'Everything Good' do
     url = URI("http://127.0.0.1:9090/mnt-lab/")
     status_response = Net::HTTP.get_response(url)
     expect status_response.kind_of? Net::HTTPSuccess
  end
end

# check 22 port 
describe port('22') do
  it { should be_listening }
end
