class PdfController < ApplicationController

  def show
    respond_to do |format|
      format.html
      format.pdf {
        html = Net::HTTP.get_response(URI.parse(params[:url]))
        puts html
        kit = PDFKit.new(params[:url], :print_media_type => true)
        #kit.stylesheets << params[:css]
        send_data(kit.to_pdf, :filename => "#{params[:name]}_menu.pdf", :type => 'application/pdf')
        return # to avoid double render call
      }
    end
  end

end
