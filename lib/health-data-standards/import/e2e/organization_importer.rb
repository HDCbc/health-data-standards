module HealthDataStandards
  module Import
    module E2E
      class OrganizationImporter < SectionImporter
        include Singleton

        def initialize

        end

        def extract_organization(org_element)
          #STDERR.puts "ORG_ELEMENT: "+org_element.to_s
          return unless org_element
          org = Organization.new
          org.name = org_element.at_xpath("./cda:name | ./cda:representedOrganization/cda:name").try(:text)
          org.addresses = org_element.xpath("./cda:addr").map { |addr| import_address(addr) }
          org.telecoms = org_element.xpath("./cda:telecom").map { |tele| import_telecom(tele) }
          org
        end

      end
    end
  end
end