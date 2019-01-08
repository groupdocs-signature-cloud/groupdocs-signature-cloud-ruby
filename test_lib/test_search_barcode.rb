# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_search_barcode.rb">
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
require 'groupdocs_signature_cloud'
require_relative './base_api_test'
require_relative './internal/test_file'

class TestsSearchBarcode < Minitest::Test

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

    def test_search_post_barcode_cells_collection
        puts("\nSearch barcode cells collection")

        options1 = get_options_search_barcode_cells()
        options2 = get_options_search_barcode_cells()
        options2.text = "1234"
        options2.match_type ="StartsWith"
        collection = SearchOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCells

        request = GroupDocsSignatureCloud::PostSearchCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_collection(request)
        assert_response(file, response)
    end

    def test_search_post_barcode_cells_collection_url
        puts("\nSearch barcode cells collection URL")

        options1 = get_options_search_barcode_cells()
        options2 = get_options_search_barcode_cells()
        options2.text = "1234"
        options2.match_type ="StartsWith"
        collection = SearchOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl

        request = GroupDocsSignatureCloud::PostSearchCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_collection_from_url(request)
        assert_response(file, response, true) 
    end

    def test_search_post_barcode_cells
        puts("\nSearch barcode cells")

        file = @@BaseTest.TestFiles.getFileSignedCells
        options = get_options_search_barcode_cells()
        request = GroupDocsSignatureCloud::PostSearchBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode(request)
        assert_response(file, response) 
    end        

    def test_search_post_barcode_cells_url
        puts("\nSearch barcode cells URL")

        file = @@BaseTest.TestFiles.getFileSignedCellsUrl
        options = get_options_search_barcode_cells()
        request = GroupDocsSignatureCloud::PostSearchBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode_from_url(request)
        assert_response(file, response, true)
    end  
    
    def get_options_search_barcode_cells
        options = CellsSearchBarcodeOptionsData.new()
        compose_barcode_search_optionsData(options)
        return options
    end    

    def test_search_post_barcode_docimages
        puts("\nSearch barcode docimages")

        file = @@BaseTest.TestFiles.getFileSignedDocImages
        options = get_options_search_barcode_docimages()
        request = GroupDocsSignatureCloud::PostSearchBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode(request)
        assert_response(file, response)
    end  

    def test_search_post_barcode_docimages_url
        puts("\nSearch barcode docimages URL")

        file = @@BaseTest.TestFiles.getFileSignedDocImagesUrl
        options = get_options_search_barcode_docimages()
        request = GroupDocsSignatureCloud::PostSearchBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_barcode_docimages
        options = ImagesSearchBarcodeOptionsData.new()
        compose_barcode_search_optionsData(options)
        return options
    end  

    def test_search_post_barcode_pdf
        puts("\nSearch barcode pdf")

        file = @@BaseTest.TestFiles.getFileSignedPdf
        options = get_options_search_barcode_pdf()
        request = GroupDocsSignatureCloud::PostSearchBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode(request)
        assert_response(file, response)
    end  

    def test_search_post_barcode_pdf_url
        puts("\nSearch barcode pdf URL")

        file = @@BaseTest.TestFiles.getFileSignedPdfUrl
        options = get_options_search_barcode_pdf()
        request = GroupDocsSignatureCloud::PostSearchBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_barcode_pdf
        options = PdfSearchBarcodeOptionsData.new()
        compose_barcode_search_optionsData(options)
        return options
    end  

    def test_search_post_barcode_slides
        puts("\nSearch barcode slides")

        file = @@BaseTest.TestFiles.getFileSignedSlides
        options = get_options_search_barcode_slides()
        request = GroupDocsSignatureCloud::PostSearchBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode(request)
        assert_response(file, response)
    end  

    def test_search_post_barcode_slides_url
        puts("\nSearch barcode slides URL")

        file = @@BaseTest.TestFiles.getFileSignedSlidesUrl
        options = get_options_search_barcode_slides()
        request = GroupDocsSignatureCloud::PostSearchBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_barcode_slides
        options = SlidesSearchBarcodeOptionsData.new()
        compose_barcode_search_optionsData(options)
        return options
    end  

    def test_search_post_barcode_words
        puts("\nSearch barcode words")

        file = @@BaseTest.TestFiles.getFileSignedWords
        options = get_options_search_barcode_words()
        request = GroupDocsSignatureCloud::PostSearchBarcodeRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode(request)
        assert_response(file, response)
    end  

    def test_search_post_barcode_words_url
        puts("\nSearch barcode words URL")

        file = @@BaseTest.TestFiles.getFileSignedWordsUrl
        options = get_options_search_barcode_words()
        request = GroupDocsSignatureCloud::PostSearchBarcodeFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_search_barcode_from_url(request)
        assert_response(file, response, true)    
    end  

    def get_options_search_barcode_words
        options = WordsSearchBarcodeOptionsData.new()
        compose_barcode_search_optionsData(options)
        return options
    end 

    def compose_barcode_search_optionsData(options)
        # set barcode properties
        options.barcode_type_name ="Code39Standard"
        options.text = "12345678"
        # set match type
        options.match_type ="Contains"
        #set pages for search
        options.document_page_number = 1
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
        assert signature.text == "123456789012"
        assert signature.barcode_type_name == "Code39Standard"
        assert signature.signature_type.include? "BarcodeSignatureData"
    end        

=begin    
=end
    def teardown 
    end

end
