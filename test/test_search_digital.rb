# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_search_digital.rb">
#   Copyright (c) 2018 Aspose Pty Ltd
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

require "minitest/autorun"
require "minitest/unit"
require 'groupdocs_storage_cloud'
require_relative './base_api_test'
require_relative './internal/test_file'
require_relative './../lib/groupdocs_signature_cloud/models/base_signature_data'
require_relative './../lib/groupdocs_signature_cloud/models/cells_digital_signature_data'
require_relative './../lib/groupdocs_signature_cloud/models/pdf_digital_signature_data'
require_relative './../lib/groupdocs_signature_cloud/models/words_digital_signature_data'
require_relative './../lib/groupdocs_signature_cloud/models/search_options_collection_data'
require_relative './../lib/groupdocs_signature_cloud/models/cells_search_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/pdf_search_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/words_search_digital_options_data'
require_relative './../lib/groupdocs_signature_cloud/models/requests/post_search_collection_request'
require_relative './../lib/groupdocs_signature_cloud/models/search_document_response'

class TestsSearchDigital < Minitest::Test

    include MiniTest::Assertions
    include GroupDocsStorageCloud
    include GroupDocsSignatureCloud_BaseApi
    include GroupDocsSignatureCloud
    include GroupDocsSignatureCloud_TestFile

    @@BaseTest = nil

    def setup
        if @@BaseTest == nil
            @@BaseTest = BaseApiTest.new(fileStorage="Signature-Dev")
            @@BaseTest.SignatureApi.get_access_token
      
            assert @@BaseTest.SignatureApi.access_token != "", "Access token hasn't been received"
            assert @@BaseTest.SignatureApi.access_token != nil, "Access token hasn't been received"
        end    
    end

    def test_search_post_digital_cells_collection
        puts("\nSearch digital cells collection")

        options1 = get_options_search_digital_cells()
        options2 = get_options_search_digital_cells()
        collection = SearchOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCells

        request = GroupDocsSignatureCloud::PostSearchCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_collection(request)
        assert_response(file, response)
    end

    def test_search_post_digital_cells_collection_url
        puts("\nSearch digital cells collection URL")

        options1 = get_options_search_digital_cells()
        options2 = get_options_search_digital_cells()
        collection = SearchOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl

        request = GroupDocsSignatureCloud::PostSearchCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_collection_from_url(request)
        assert_response(file, response, true) 
    end

    def test_search_post_digital_cells
        puts("\nSearch digital cells")

        file = @@BaseTest.TestFiles.getFileSignedCells
        options = get_options_search_digital_cells()
        request = GroupDocsSignatureCloud::PostSearchDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital(request)
        assert_response(file, response) 
    end        

    def test_search_post_digital_cells_url
        puts("\nSearch digital cells URL")

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl
        options = get_options_search_digital_cells()
        request = GroupDocsSignatureCloud::PostSearchDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital_from_url(request)
        assert_response(file, response, true)
    end  
    
    def get_options_search_digital_cells
        options = CellsSearchDigitalOptionsData.new()
        return options
    end    

    def test_search_post_digital_pdf
        puts("\nSearch digital pdf")

        file = @@BaseTest.TestFiles.getFileSignedPdf
        options = get_options_search_digital_pdf()
        request = GroupDocsSignatureCloud::PostSearchDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital(request)
        assert_response(file, response)
    end  

    def test_search_post_digital_pdf_url
        puts("\nSearch digital pdf URL")

        file = @@BaseTest.TestFiles.getFileSignedPdfUrl
        options = get_options_search_digital_pdf()
        request = GroupDocsSignatureCloud::PostSearchDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_digital_pdf
        options = PdfSearchDigitalOptionsData.new()
        return options
    end  

    def test_search_post_digital_words
        puts("\nSearch digital words")

        file = @@BaseTest.TestFiles.getFileSignedWords
        options = get_options_search_digital_words()
        request = GroupDocsSignatureCloud::PostSearchDigitalRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital(request)
        assert_response(file, response)
    end  

    def test_search_post_digital_words_url
        puts("\nSearch digital words URL")

        file = @@BaseTest.TestFiles.getFileSignedWordsUrl
        options = get_options_search_digital_words()
        request = GroupDocsSignatureCloud::PostSearchDigitalFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_digital_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_digital_words
        options = WordsSearchDigitalOptionsData.new()
        return options
    end 

    def assert_response( file, response, url = false)
        assert response != nil
        assert response.code == "200"
        assert response.status == "OK"
        if !url
            assert file.FileName == response.file_name
            assert response.folder == "signed"
        else
            assert file.Url == response.file_name
        end    
        assert response.signatures != nil
        assert response.signatures.length > 0
        signature = response.signatures[0]
        assert signature.signature_type.include? "DigitalSignatureData"
        if file.FileName == "SignedForVerificationAll.xlsx"
            assert signature.comments == "Test comment"
            assert signature.is_valid == false
            assert signature.digital_signature_type == "Unknown"
            assert signature.sign_time.year == 2017
        end             
        if file.FileName == "SignedForVerificationAll.pdf"
            assert signature.comments == ""
            assert signature.is_valid == false
            assert signature.digital_signature_type == "Unknown"
            assert signature.sign_time.year == 2018
        end 
        if file.FileName == "SignedForVerificationAll.docx"
            assert signature.comments == "Test comment"
            assert signature.is_valid == true
            assert signature.digital_signature_type == "XmlDsig"
            assert signature.sign_time.year == 2017
        end 
    end        

    def teardown 
    end

end
