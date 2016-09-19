module Appy
  module Backend
    module Ibeacon
      class IbeaconsController < ApplicationController

        expose(:app) { Appy::App.find(params[:app_id]) }
        expose(:ibeacon, model: Appy::Ibeacon::Tracking)
        expose(:ibeacons) { Appy::Sorter.new(Appy::Ibeacon::Tracking, app, search_results_for(params[:q], Appy::Ibeacon::Tracking.all, Appy::Ibeacon::Tracking::SEARCH_FIELDS)).sort(params) }
        expose(:trackingDetails) { Appy::Sorter.new(Appy::Ibeacon::TrackingDetail.where(tracking_id: ibeacon), app, search_results_for(params[:q], Appy::Ibeacon::TrackingDetail.where(tracking_id: ibeacon), Appy::Ibeacon::TrackingDetail::SEARCH_FIELDS)).sort(params) }

        def create
          if ibeacon.save
            flash.notice = "Created"
            redirect_to app_ibeacons_path(app)
          else
            flash.now.alert = "Can't create"
            render 'new'
          end
        end

        def update
          if ibeacon.save
            flash.notice = "iBeacon id #{ibeacon.id} was updated"
            redirect_to edit_app_ibeacon_path(app, ibeacon)
          else
            flash.now.alert = "Something went wrong, can't update"
            render 'edit'
          end
        end

        def destroy
          if ibeacon.destroy
            flash.notice = "Deleted"
          else
            flash.now.alert = "Something went wrong can't delete!"
          end
          redirect_to app_ibeacons_path(app)
        end

        private
          def ibeacon_params
            params.require(:ibeacon).permit(:id, :name, :message)
          end
      end
    end
  end
end
