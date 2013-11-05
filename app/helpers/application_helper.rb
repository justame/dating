module ApplicationHelper
  def javascript_exists?(file_path)
    script = "#{Rails.root}/app/assets/javascripts/#{file_path}.js"
    extensions = %w(.coffee .erb .coffee.erb) + [""]
    
    extensions.inject(false) do |truth, extension|
      truth || File.exists?("#{script}#{extension}")
    end

  end
end
