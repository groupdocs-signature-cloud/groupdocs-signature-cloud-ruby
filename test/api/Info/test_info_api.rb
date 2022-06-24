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

  class TestSignatureInfoApi < TestContext
    
    def test_get_supported_file_formats
      response = @info_api.get_supported_file_formats
      response.formats.each do |format|
        assert_equal false, format.file_format.empty? 
        assert_equal false, format.extension.empty?
      end
    end

    def test_get_supported_barcodes
      response = @info_api.get_supported_barcodes
      assert_operator response.barcode_types.size, :>, 0
      response.barcode_types.each do |format|
        assert_equal false, format.name.empty?
      end
    end

    def test_get_supported_qrcodes
      response = @info_api.get_supported_qr_codes
      assert_operator response.qr_code_types.size, :>, 0
      response.qr_code_types.each do |format|
        assert_equal false, format.name.empty?
      end
    end

    def test_document_info
      test_file = TestFile.pdf_one_page      
      settings = InfoSettings.new
      settings.file_info = test_file.file_info
      response = @info_api.get_info(GetInfoRequest.new settings)
      assert_equal response.size, 55321      
      assert_equal response.extension, "pdf"
      assert_equal response.file_format, "Portable Document Format File"
      assert_equal response.max_page_height, 792
      assert_equal response.width_for_max_height, 612
      assert_equal response.pages_count, 1
      assert_equal response.file_info.file_path, settings.file_info.file_path
    end

    def test_GetInfoReturnsFileNotFound
      test_file = TestFile.not_exist      
      settings = InfoSettings.new
      settings.file_info = test_file.file_info
      request = GetInfoRequest.new(settings)
      error = assert_raises ApiError do
        @info_api.get_info(request)
      end
      assert_equal "Can't find file located at 'some-folder\\notexist.docx'.", error.message            
    end    

  end
end
