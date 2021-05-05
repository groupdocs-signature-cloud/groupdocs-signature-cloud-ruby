#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2021 Aspose Pty Ltd
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

  class TestVerifyDigital < TestContext
    
    def test_verify_digital_image
      # Digital verification is not supported for images   
    end

    def test_verify_digital_pdf
      test_file = TestFile.pdf_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)        
    end
    
    def test_verify_digital_presentation
      # Digital verification is not supported for presentations      
    end
    
    def test_verify_digital_spreadsheet
      test_file = TestFile.spreadsheet_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)      
    end
    
    def test_verify_digital_wordprocessing
      test_file = TestFile.wordprocessing_signed
      settings = populate_options(test_file)               
      response = @sign_api.verify_signatures(VerifySignaturesRequest.new settings)
      check_response(response, test_file)     
    end    

    def populate_options(testFile)
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

        settings = VerifySettings.new
        settings.file_info = testFile.file_info
        settings.options = [opts]
        settings
    end

    def check_response(response, test_file)
      assert_equal response.file_info.file_path, test_file.path
    end

  end
end
