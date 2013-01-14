class ResumeController < ApplicationController
  def stream_as_pdf
    debugger
    path = Rails.root.join('app', 'files', 'Balihoo_Application.pdf')
    send_file(path,
              :filename => "Jim_Bigelow_Application.pdf",
              :type => "application/pdf")
  end
end
