class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  # Que tipo de strorage usará este uploader

  def store_dir
    # Como y donde guardar el archivo ...
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  #Ubicacion para guardar las cosas, si es file sera local
  #si es fog significa que se guardara en algun lugar en la nube
  storage :file
  # Versiones del archivo ...
  #Agregar version para poder subir
  #Guardara cada foto de un nuevo tamaño como archivo .thumb
  version :thumb do
    process resize_to_fill: [50,50]
  end
  #Que extensiones vas a aceptar
  def extension_white_list
    #Este simbolo %w hace que lo que este despues entre parentesis
    #lo pone en un array cada espacio significa un elemento nuevo
    %w(jpg jpeg gif png)
  end

end