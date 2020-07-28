#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2020 Aspose Pty Ltd
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

  class TestSignBarcode < TestContext
    
    def test_sign_barcode_image
      test_file = TestFile.image_jpg
      signedFileName = "Output\\ImageBarcodeSigned.jpg"         
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)    
    end

    def test_sign_barcode_pdf
      test_file = TestFile.pdf_one_page
      signedFileName = "Output\\PdfBarcodeSigned.pdf"          
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)        
    end
    
    def test_sign_barcode_presentation
      test_file = TestFile.presentation_pptx
      signedFileName = "Output\\PresentationBarcodeSigned.pptx"       
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)       
    end
    
    def test_sign_barcode_spreadsheet
      test_file = TestFile.spreadsheet_xlsx
      signedFileName = "Output\\SpreadsheetBarcodeSigned.xlsx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)      
    end
    
    def test_sign_barcode_wordprocessing
      test_file = TestFile.word_docx
      signedFileName = "Output\\WordBarcodeSigned.docx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)     
    end    

    def populate_options(signedFileName, testFile)
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
        opts.border.weight = 1

        opts.background_color = Color.new
        opts.background_color.web = "DarkOrange"
        opts.transparency = 0.8
        opts.inner_margins = Padding.new
        opts.inner_margins.all = 22        

        opts.page = 1
        opts.all_pages = false
        ps = PagesSetup.new
        ps.even_pages = false
        ps.first_page = true
        ps.last_page = false
        ps.odd_pages = false
        ps.page_numbers = [1]
        opts.pages_setup = ps

        settings = SignSettings.new
        settings.file_info = testFile.file_info
        settings.options = [opts]
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
