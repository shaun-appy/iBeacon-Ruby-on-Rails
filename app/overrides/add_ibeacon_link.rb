Deface::Override.new(:virtual_path => "shared/navigation_menu/_guests",
                     :name => "add_ibeacon_link",
                     :insert_after => "[data-appy-hook='nav_guests_middle']",
                     :partial => "overrides/ibeacon_link",
                     :namespaced => true)
