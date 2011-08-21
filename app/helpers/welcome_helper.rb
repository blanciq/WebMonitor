module WelcomeHelper
  def validation_image status
    if status == :ok
      file = "ok.png"     
    elsif status == :error
      file = "error.png"
    else
      file = "question_mark.png"              
    end
    raw "<img src=\"/images/" + file + "\" alt=\"status\" class=\"validation-image\"/>"
  end
end
