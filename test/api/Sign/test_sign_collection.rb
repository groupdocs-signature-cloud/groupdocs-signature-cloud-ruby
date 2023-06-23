#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2023 Aspose Pty Ltd
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# </summary>
# --------------------------------------------------------------------------------------------------------------------
#

module GroupDocsSignatureCloud

  require_relative './../../test_context'

  class TestSignCollection < TestContext
    
    def test_sign_collection_image
      test_file = TestFile.image_jpg
      signedFileName = "Output\\ImageCollectionSigned.jpg"         
      settings = populate_options_image(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)    
    end

    def test_sign_collection_pdf
      test_file = TestFile.pdf_one_page
      signedFileName = "Output\\PdfCollectionSigned.pdf"          
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)        
    end
    
    def test_sign_collection_presentation
      test_file = TestFile.presentation_pptx
      signedFileName = "Output\\PresentationCollectionSigned.pptx"       
      settings = populate_options_image(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)       
    end
    
    def test_sign_collection_spreadsheet
      test_file = TestFile.spreadsheet_xlsx
      signedFileName = "Output\\SpreadsheetCollectionSigned.xlsx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)      
    end
    
    def test_sign_collection_wordprocessing
      test_file = TestFile.word_docx
      signedFileName = "Output\\WordCollectionSigned.docx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)     
    end    

    def barcode_opts()
      opts = SignBarcodeOptions.new
      opts.signature_type = 'Barcode'
      opts.barcode_type = 'Code128'
      opts.text = '123456789012'
      opts.code_text_alignment = 'None'   

      # set signature position on a page
      opts.left = 100
      opts.top = 100
      opts.width = 300
      opts.height = 100
      opts.location_measure_type = "Pixels"
      opts.size_measure_type = "Pixels"
      opts.stretch = "None"
      opts.rotation_angle = 0
      opts.horizontal_alignment = "None"
      opts.vertical_alignment = "None"
      opts.margin = Padding.new
      opts.margin.all = 5
      opts.margin_measure_type = "Pixels"

      # set signature appearance
      opts.fore_color = Color.new
      opts.fore_color.web = "BlueViolet"
      opts.border = BorderLine.new
      opts.border.color = Color.new
      opts.border.color.web = "DarkOrange"
      opts.border.visible = true
      opts.border.style = "Dash"
      opts.border.weight = 12

      opts.background_color = Color.new
      opts.background_color.web = "DarkOrange"
      opts.transparency = 0.8
      opts.inner_margins = Padding.new
      opts.inner_margins.all = 2       

      opts.page = 1
      opts.all_pages = false
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps
      opts
    end

    def qr_code_opts()
      opts = SignQRCodeOptions.new
      opts.signature_type = 'QRCode'
      opts.text = 'John Smit'
      opts.qr_code_type = 'Aztec'  

      # set signature position on a page
      opts.left = 100
      opts.top = 100
      opts.width = 200
      opts.height = 100
      opts.location_measure_type = "Pixels"
      opts.size_measure_type = "Pixels"
      opts.stretch = "None"
      opts.rotation_angle = 0
      opts.horizontal_alignment = "None"
      opts.vertical_alignment = "None"
      opts.margin = Padding.new
      opts.margin.all = 5
      opts.margin_measure_type = "Pixels"

      # set signature appearance
      opts.fore_color = Color.new
      opts.fore_color.web = "BlueViolet"
      opts.border = BorderLine.new
      opts.border.color = Color.new
      opts.border.color.web = "DarkOrange"
      opts.border.visible = true
      opts.border.style = "Dash"
      opts.border.weight = 12

      opts.background_color = Color.new
      opts.background_color.web = "DarkOrange"
      opts.transparency = 0.8
      opts.inner_margins = Padding.new
      opts.inner_margins.all = 2   

      opts.page = 1
      opts.all_pages = false
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps
      opts
    end  

    def digital_opts()
      opts = SignDigitalOptions.new
      opts.signature_type = 'Digital'
      opts.image_file_path = TestFile.additional_signature01.path
      opts.certificate_file_path = TestFile.additional_pfx.path
      opts.password = '1234567890'       
      opts
    end      

    def image_opts()
      opts = SignImageOptions.new
      opts.signature_type = 'Image'
      opts.image_file_path = TestFile.image_sign.path

      # set signature position on a page
      opts.left = 100
      opts.top = 100
      opts.width = 200
      opts.height = 100
      opts.location_measure_type = "Pixels"
      opts.size_measure_type = "Pixels"        
      opts.rotation_angle = 0
      opts.horizontal_alignment = "None"
      opts.vertical_alignment = "None"
      opts.margin = Padding.new
      opts.margin.all = 5
      opts.margin_measure_type = "Pixels"

      # set signature appearance
      opts.transparency = 0.8

      opts.page = 1
      opts.all_pages = false
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps      
      opts
    end  
    
    def stamp_opts()
      opts = SignStampOptions.new
      opts.signature_type = 'Stamp'
      opts.image_file_path = TestFile.image_sign.path

      # set signature position on a page
      opts.left = 100
      opts.top = 100
      opts.width = 300
      opts.height = 200
      opts.location_measure_type = "Pixels"
      opts.size_measure_type = "Pixels"        
      opts.rotation_angle = 0
      opts.horizontal_alignment = "None"
      opts.vertical_alignment = "None"
      opts.margin = Padding.new
      opts.margin.all = 5
      opts.margin_measure_type = "Pixels"

      # set signature appearance
      opts.background_color = Color.new
      opts.background_color.web = "CornflowerBlue"   
      opts.background_color_crop_type = "InnerArea"
      opts.background_image_crop_type = "MiddleArea"
      opts.transparency = 0.8

      outline = StampLine.new
      outline.text = "John Smith"
      outline.font = SignatureFont.new
      outline.font.font_family = "Arial"
      outline.font.font_size = 12
      outline.font.bold = true
      outline.font.italic = true
      outline.font.underline = true
      outline.text_bottom_intent = 5
      outline.text_color = Color.new
      outline.text_color.web = "Gold"
      outline.text_repeat_type = "FullTextRepeat"
      outline.background_color = Color.new
      outline.background_color.web = "BlueViolet"
      outline.height = 20
      outline.inner_border = BorderLine.new
      outline.inner_border.color = Color.new
      outline.inner_border.color.web = "DarkOrange"
      outline.inner_border.style = "LongDash"
      outline.inner_border.transparency = 0.5
      outline.inner_border.weight = 1.2
      outline.outer_border = BorderLine.new
      outline.outer_border.color = Color.new
      outline.outer_border.color.web = "DarkOrange"
      outline.outer_border.style = "LongDashDot"
      outline.outer_border.transparency = 0.7
      outline.outer_border.weight = 1.4        
      outline.visible = true
      opts.outer_lines = [outline]

      innerline = StampLine.new
      innerline.text = "John Smith"
      innerline.font = SignatureFont.new
      innerline.font.font_family = "Times New Roman"
      innerline.font.font_size = 20
      innerline.font.bold = true
      innerline.font.italic = true
      innerline.font.underline = true
      innerline.text_bottom_intent = 3
      innerline.text_color = Color.new
      innerline.text_color.web = "Gold"
      innerline.text_repeat_type = "None"
      innerline.background_color = Color.new
      innerline.background_color.web = "CornflowerBlue"
      innerline.height = 30
      innerline.inner_border = BorderLine.new
      innerline.inner_border.color = Color.new
      innerline.inner_border.color.web = "OliveDrab"
      innerline.inner_border.style = "LongDash"
      innerline.inner_border.transparency = 0.5
      innerline.inner_border.weight = 1.2
      innerline.outer_border = BorderLine.new
      innerline.outer_border.color = Color.new
      innerline.outer_border.color.web = "GhostWhite"
      innerline.outer_border.style = "Dot"
      innerline.outer_border.transparency = 0.4
      innerline.outer_border.weight = 1.4        
      innerline.visible = true
      opts.inner_lines = [innerline]

      opts.page = 1
      opts.all_pages = false
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps      
      opts
    end  
    
    def text_opts()
      opts = SignTextOptions.new
      opts.signature_type = 'Text'        
      opts.text = 'John Smith'

      # set signature position on a page
      opts.left = 100
      opts.top = 100
      opts.width = 100
      opts.height = 100
      opts.location_measure_type = "Pixels"
      opts.size_measure_type = "Pixels" 
      opts.stretch = "None"       
      opts.rotation_angle = 0
      opts.horizontal_alignment = "None"
      opts.vertical_alignment = "None"
      opts.margin = Padding.new
      opts.margin.all = 5
      opts.margin_measure_type = "Pixels"

      # set signature appearance
      opts.font = SignatureFont.new
      opts.font.font_family = "Arial"
      opts.font.font_size = 12
      opts.font.bold = true
      opts.font.italic = false
      opts.font.underline = false        
      opts.fore_color = Color.new
      opts.fore_color.web = "BlueViolet"
      opts.border = BorderLine.new
      opts.border.color = Color.new
      opts.border.color.web = "DarkOrange"
      opts.border.visible = true
      opts.border.style = "Dash"

      opts.background_color = Color.new
      opts.background_color.web = "DarkOrange"

      opts.page = 1
      opts.all_pages = false
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps      
      opts
    end      

    def populate_options_image(signedFileName, testFile)
      settings = SignSettings.new
      settings.file_info = testFile.file_info
      settings.options = [barcode_opts(),
                          qr_code_opts(),
                          image_opts(),
                          stamp_opts(),
                          text_opts()]
      settings.save_options = SaveOptions.new
      settings.save_options.output_file_path = signedFileName
      settings
    end

    def populate_options(signedFileName, testFile)
        settings = SignSettings.new
        settings.file_info = testFile.file_info
        settings.options = [barcode_opts(),
                            qr_code_opts(),
                            digital_opts(),
                            image_opts(),
                            stamp_opts(),
                            text_opts()]
        settings.save_options = SaveOptions.new
        settings.save_options.output_file_path = signedFileName
        settings
    end

    def check_response(response, signedFileName)
      assert_equal response.file_info.file_path, signedFileName
      # Check signed file
      request = ObjectExistsRequest.new signedFileName
      data = @storage_api.object_exists(request)
      assert_equal data.exists, true
    end

  end
end
