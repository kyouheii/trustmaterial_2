class ImageUploader < CarrierWave::Uploader::Base
  #アップロードしたファイルの保存先を指定する。
  def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #画像がアップロードされてない時に、'sample.jpg'を表示する。この画像はassets/images配下に事前に配置しておく。
  def default_url
    'sample.jpg'
  end
  
  #アップロードを許可するファイル種類を指定する。
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
