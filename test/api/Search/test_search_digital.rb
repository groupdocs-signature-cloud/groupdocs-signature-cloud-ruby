#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2019 Aspose Pty Ltd
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

  class TestSearchDigital < TestContext
    
    def test_search_digital_image
      # Digital search is not supported for images      
    end

    # def test_search_digital_pdf
    #   test_file = TestFile.pdf_signed
    #   opts = SearchDigitalOptions.new
    #   populate_options(opts)
    #   opts.document_type = 'Pdf'
    #   settings = SearchSettings.new
    #   settings.file_info = test_file.file_info
    #   settings.options = [opts]
    #   response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
    #   check_response([opts], response, test_file)      
    # end
    
    # def test_search_digital_presentation
    #   # Digital search is not supported for presentations     
    # end
    
    # def test_search_digital_spreadsheet
    #   test_file = TestFile.spreadsheet_signed
    #   opts = SearchDigitalOptions.new
    #   populate_options(opts)
    #   opts.document_type = 'Spreadsheet'
    #   settings = SearchSettings.new
    #   settings.file_info = test_file.file_info
    #   settings.options = [opts]
    #   response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
    #   check_response([opts], response, test_file)      
    # end
    
    # def test_search_digital_wordprocessing
    #   test_file = TestFile.wordprocessing_signed
    #   opts = SearchDigitalOptions.new
    #   populate_options(opts)
    #   opts.document_type = 'WordProcessing'
    #   settings = SearchSettings.new
    #   settings.file_info = test_file.file_info
    #   settings.options = [opts]
    #   response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
    #   check_response([opts], response, test_file)      
    # end    

    def populate_options(opts)
        opts.signature_type = 'Digital'
    end

    def check_response(opts, response, test_file)
      assert_equal response.size, test_file.size      
      assert_equal response.file_info.file_path, test_file.path
      assert_operator response.signatures.size, :>, 0
      opts.each do |opt|
        exists = false
        response.signatures.each do |signature|        
          if (signature.signature_type == opt.signature_type)
              exists = true
              break
          end
        end
        assert_equal exists, true
      end
    end

  end
end
