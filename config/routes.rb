Appy::Core::Engine.routes.draw do
  scope :module => 'backend' do
    resources :apps do
      scope :module => 'ibeacon' do
        resources :ibeacons do
          resources :details, only: :destroy, to: 'details#destroy'
        end
      end
    end
  end
end
