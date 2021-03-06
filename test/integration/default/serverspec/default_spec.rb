#
# Author:: Noah Kantrowitz <noah@coderanger.net>
#
# Copyright 2014, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'Configuration' do
  describe file('/etc/rundeck') do
    it { should be_a_directory }
  end

  describe file('/etc/rundeck/admin.aclpolicy') do
    it { should be_a_file }
  end

  describe file('/etc/rundeck/apitoken.aclpolicy') do
    it { should be_a_file }
  end

  describe file('/etc/rundeck/framework.properties') do
    it { should be_a_file }
  end
end

describe 'Service' do
  describe file('/etc/service/rundeck') do
    it { should be_a_directory }
  end

  describe port(4440) do
    it { should be_listening }
  end
end
