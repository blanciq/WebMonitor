module WelcomeHelper
  def validation_image status
    if status == :ok
      file = "ok.png"     
    else
      file = "error.png"
    end
    raw "<img src=\"/images/" + file + "\" alt=\"status\" class=\"validation-image\"/>"
  end
end
