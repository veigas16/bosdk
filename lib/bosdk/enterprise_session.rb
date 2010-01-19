module BOSDK
  # Creates a wrapper around the Business Objects Java SDK
  class EnterpriseSession
    # The underlying IEnterpriseSession
    attr_reader :session

    # The underlying IInfoStore
    attr_reader :infostore

    # Creates a new EnterpriseSession object, connecting to the specified CMS.
    #  EnterpriseSession.new('cms', 'Administrator', '')
    #
    # Automatically calls disconnect when cleaned up.
    def initialize(cms, username, password)
      @session = CrystalEnterprise.getSessionMgr.logon(username, password, cms, 'secEnterprise')
      @infostore = @session.getService('', 'InfoStore')
      @connected = true

      at_exit { disconnect }
    end

    # Returned true/false if connected to the CMS.
    def connected?
      return @connected
    end

    # Disconnects from the CMS is connected.
    def disconnect
      @session.logoff if connected?
      @session = nil
      @connected = false
      nil
    end

    # Queries the InfoStore with the provided statement.
    def query(stmt)
      @infostore.query(stmt)
    end
  end
end