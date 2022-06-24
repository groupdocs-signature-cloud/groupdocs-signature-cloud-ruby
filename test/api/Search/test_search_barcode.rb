#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2022 Aspose Pty Ltd
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

  class TestSearchBarcode < TestContext
    
    def test_search_barcode_image
      test_file = TestFile.image_signed
      opts = SearchBarcodeOptions.new
      populate_options(opts)
      settings = SearchSettings.new
      settings.file_info = test_file.file_info
      settings.options = [opts]
      response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
      check_response([opts], response, test_file)      
    end

    def test_search_barcode_pdf
      test_file = TestFile.pdf_signed
      opts = SearchBarcodeOptions.new
      populate_options(opts)
      settings = SearchSettings.new
      settings.file_info = test_file.file_info
      settings.options = [opts]
      response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
      check_response([opts], response, test_file)      
    end
    
    def test_search_barcode_presentation
      test_file = TestFile.presentation_signed
      opts = SearchBarcodeOptions.new
      populate_options(opts)
      settings = SearchSettings.new
      settings.file_info = test_file.file_info
      settings.options = [opts]
      response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
      check_response([opts], response, test_file)      
    end
    
    def test_search_barcode_spreadsheet
      test_file = TestFile.spreadsheet_signed
      opts = SearchBarcodeOptions.new
      populate_options(opts)
      settings = SearchSettings.new
      settings.file_info = test_file.file_info
      settings.options = [opts]
      response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
      check_response([opts], response, test_file)      
    end
    
    def test_search_barcode_wordprocessing
      test_file = TestFile.wordprocessing_signed
      opts = SearchBarcodeOptions.new
      populate_options(opts)
      settings = SearchSettings.new
      settings.file_info = test_file.file_info
      settings.options = [opts]
      response = @sign_api.search_signatures(SearchSignaturesRequest.new settings)
      check_response([opts], response, test_file)      
    end    

    def populate_options(opts)
        opts.page = 1
        opts.all_pages = true
        ps = PagesSetup.new
        ps.even_pages = false
        ps.first_page = true
        ps.last_page = false
        ps.odd_pages = false
        ps.page_numbers = [1]
        opts.pages_setup = ps
        opts.signature_type = 'Barcode'
        opts.barcode_type = 'Code39Standard'
        opts.text = '123456789012'
        opts.match_type = 'Contains'
    end

    def check_response(opts, response, test_file)
      assert_equal response.size, test_file.size      
      assert_equal response.file_info.file_path, test_file.path
      assert_operator response.signatures.size, :>, 0
      opts.each do |opt|
        exists = false
        response.signatures.each do |signature|        
          if (signature.signature_type == opt.signature_type and
              signature.barcode_type == opt.barcode_type and
              signature.text == opt.text)
              exists = true
              break
          end
        end
        assert_equal exists, true
      end
    end

  end
end
