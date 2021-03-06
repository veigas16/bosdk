# Copyright (c) 2010 Shane Emmons
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
include Java
Dir.glob("#{ENV["BOE_JAVA_LIB"]}/**/*.jar").each{|jar| require jar}
include_class "com.crystaldecisions.sdk.framework.CrystalEnterprise"

require 'bosdk/enterprise_session'
require 'bosdk/info_object'
require 'bosdk/webi_report_engine'
require 'bosdk/webi_instance'

module BOSDK
  # A closure over EnterpriseSession
  def BOSDK.connect(cms, username, password, options = Hash.new, &block)
    session = EnterpriseSession.new(cms, username, password, options)
    yield session
    session.disconnect
  end
end
