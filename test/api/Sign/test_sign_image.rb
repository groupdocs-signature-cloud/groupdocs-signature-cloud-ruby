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

  class TestSignImage < TestContext
    
    def test_sign_image_image
      test_file = TestFile.image_jpg
      signedFileName = "Output\\ImageImageSigned.jpg"         
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)    
    end

    def test_sign_image_pdf
      test_file = TestFile.pdf_one_page
      signedFileName = "Output\\PdfImageSigned.pdf"          
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)        
    end
    
    def test_sign_image_presentation
      test_file = TestFile.presentation_pptx
      signedFileName = "Output\\PresentationImageSigned.pptx"       
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)       
    end
    
    def test_sign_image_spreadsheet
      test_file = TestFile.spreadsheet_xlsx
      signedFileName = "Output\\SpreadsheetImageSigned.xlsx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)      
    end
    
    def test_sign_image_wordprocessing
      test_file = TestFile.word_docx
      signedFileName = "Output\\WordImageSigned.docx"
      settings = populate_options(signedFileName, test_file)               
      response = @sign_api.create_signatures(CreateSignaturesRequest.new settings)
      check_response(response, signedFileName)     
    end    

    def populate_options(signedFileName, testFile)
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
