# encoding: utf-8
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))
require 'bosdk'

module BOSDK
  describe BOSDK do
    specify "#connect wraps EnterpriseSession#new in a closure" do
      es = mock("EnterpriseSession").as_null_object
      EnterpriseSession.should_receive(:new).once.with('cms', 'Administrator', '').and_return(es)
      es.should_receive(:disconnect).once.with.and_return

      BOSDK.connect('cms', 'Administrator', '') do |session|
        session.should == es
      end
    end
  end
end