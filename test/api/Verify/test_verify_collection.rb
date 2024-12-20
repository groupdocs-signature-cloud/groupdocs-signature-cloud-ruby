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

  class TestVerifyCollection < TestContext
    
    def test_verify_collection_image
      test_file = TestFile.image_signed
      settings = populate_options_image(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)    
    end

    def test_verify_collection_pdf
      test_file = TestFile.pdf_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)        
    end
    
    def test_verify_collection_presentation
      test_file = TestFile.presentation_signed
      settings = populate_options_image(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)       
    end
    
    def test_verify_collection_spreadsheet
      test_file = TestFile.spreadsheet_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)      
    end
    
    def test_verify_collection_wordprocessing
      test_file = TestFile.wordprocessing_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)     
    end    

    def barcode_opts()
      opts = VerifyBarcodeOptions.new
      opts.signature_type = 'Barcode'
      opts.barcode_type = 'Code39'
      opts.text = '123456789012'
      opts.match_type = 'Contains'   

      opts.page = 1
      opts.all_pages = true
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
      opts = VerifyQRCodeOptions.new
      opts.signature_type = 'QRCode'
      opts.qr_code_type = 'Aztec'
      opts.text = 'John Smith'
      opts.match_type = 'Contains' 

      opts.page = 1
      opts.all_pages = true
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
      opts = VerifyDigitalOptions.new
      opts.signature_type = 'Digital' 

      opts.page = 1
      opts.all_pages = true
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
      opts = VerifyTextOptions.new
      opts.signature_type = 'Text'
      opts.text = 'John Smith'
      opts.match_type = 'Contains' 

      opts.page = 1
      opts.all_pages = true
      ps = PagesSetup.new
      ps.even_pages = false
      ps.first_page = true
      ps.last_page = false
      ps.odd_pages = false
      ps.page_numbers = [1]
      opts.pages_setup = ps

      opts
    end      

    def populate_options_image(testFile)
      settings = VerifySettings.new
      settings.file_info = testFile.file_info      
      settings.options = [barcode_opts(),
                          qr_code_opts()]
      settings
    end

    def populate_options(testFile)
      settings = VerifySettings.new
      settings.file_info = testFile.file_info
      settings.options = [barcode_opts(),
                          qr_code_opts(),
                          digital_opts(),
                          text_opts()]
      settings
    end

    def check_response(response, test_file)
      assert_equal response.file_info.file_path, test_file.path
    end

  end
end
