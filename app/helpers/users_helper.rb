module UsersHelper

	def useless_info
		require 'yaml'

		information = File.new('config/useless.yml', 'r')
		useless = YAML.load(information.read)

		inform = rand(321)
		"#{useless[inform]}"
	end

	def flash_helper

    f_names = [:notice, :warning, :message]
    fl = ''

    for name in f_names
      if flash[name]
        fl = flash[name]
      end
    flash[name] = nil;
		end
		return fl
	end
end
