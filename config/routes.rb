Appy::Core::Engine.routes.draw do
  scope :module => 'backend' do
    resources :apps do
      scope :module => 'ibeacon' do
        resources :ibeacons do
          resources :tracking_details, only: :destroy, to: 'tracking_details#destroy'
        end
      end
    end
  end
end
