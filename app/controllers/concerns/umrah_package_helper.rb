module UmrahPackageHelper

  def get_full_package_name(package)
    "#{package.title}  #{package.rooms_per_pax} pax/rooms"
  end

end
