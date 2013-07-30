module MicropostsHelper
  def random_image
    blacklist = [".", ".."]
    file_names = Dir.entries('public/background')
    blacklist.each do |blacklsited|
      file_names.delete(blacklsited)
    end
    "background/#{file_names.shuffle.first}"
  end
end
