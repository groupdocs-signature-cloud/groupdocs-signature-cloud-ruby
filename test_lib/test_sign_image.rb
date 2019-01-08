# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_sign_image.rb">
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

class TestsSignImage < Minitest::Test

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

    def test_sign_post_image_cells_collection
        puts("\nSign image cells collection")

        options1 = get_options_sign_image_cells()
        options2 = get_options_sign_image_cells()
        options2.image_guid = "images\\signature_01.jpg"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCells

        request = GroupDocsSignatureCloud::PostCollectionRequest.new(file.FileName, collection, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection(request)

        assert_response(file, response)
    end

    def test_sign_post_image_cells_collection_url
        puts("\nSign image cells collection URL")

        options1 = get_options_sign_image_cells()
        options2 = get_options_sign_image_cells()
        options2.image_guid = "images\\signature_01.jpg"
        options2.top = 10
        collection = SignOptionsCollectionData.new(Items: [options1, options2])

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl

        request = GroupDocsSignatureCloud::PostCollectionFromUrlRequest.new(file.Url, collection, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_collection_from_url(request)
        assert_response(file, response) 
    end

    def test_sign_post_image_cells
        puts("\nSign image cells")

        file = @@BaseTest.TestFiles.getFile01PagesCells
        options = get_options_sign_image_cells()
        request = GroupDocsSignatureCloud::PostImageRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image(request)
        assert_response(file, response) 
    end        

    def test_sign_post_image_cells_url
        puts("\nSign image cells URL")

        file = @@BaseTest.TestFiles.getFile01PagesCellsUrl
        options = get_options_sign_image_cells()
        request = GroupDocsSignatureCloud::PostImageFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image_from_url(request)
        assert_response(file, response)
    end  
   
    def get_options_sign_image_cells
        options = CellsSignImageOptionsData.new()
        compose_image_sign_optionsData(options)
        options.top = 5 
        options.left = 5         
        return options
    end    

    def test_sign_post_image_docimages
        puts("\nSign image docimages")

        file = @@BaseTest.TestFiles.getFile01PagesDocImages
        options = get_options_sign_image_docimages()
        request = GroupDocsSignatureCloud::PostImageRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image(request)
        assert_response(file, response)
    end  

    def test_sign_post_image_docimages_url
        puts("\nSign image docimages URL")

        file = @@BaseTest.TestFiles.getFile01PagesDocImagesUrl
        options = get_options_sign_image_docimages()
        request = GroupDocsSignatureCloud::PostImageFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_image_docimages
        options = ImagesSignImageOptionsData.new()
        compose_image_sign_optionsData(options)
        return options
    end  

    def test_sign_post_image_pdf
        puts("\nSign image pdf")

        file = @@BaseTest.TestFiles.getFile01PagesPdf
        options = get_options_sign_image_pdf()
        request = GroupDocsSignatureCloud::PostImageRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image(request)
        assert_response(file, response)
    end  

    def test_sign_post_image_pdf_url
        puts("\nSign image pdf URL")

        file = @@BaseTest.TestFiles.getFile01PagesPdfUrl
        options = get_options_sign_image_pdf()
        request = GroupDocsSignatureCloud::PostImageFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_image_pdf
        options = PdfSignImageOptionsData.new()
        compose_image_sign_optionsData(options)
        return options
    end  

    def test_sign_post_image_slides
        puts("\nSign image slides")

        file = @@BaseTest.TestFiles.getFile01PagesSlides
        options = get_options_sign_image_slides()
        request = GroupDocsSignatureCloud::PostImageRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image(request)
        assert_response(file, response)
    end  

    def test_sign_post_image_slides_url
        puts("\nSign image slides URL")

        file = @@BaseTest.TestFiles.getFile01PagesSlidesUrl
        options = get_options_sign_image_slides()
        request = GroupDocsSignatureCloud::PostImageFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_image_slides
        options = SlidesSignImageOptionsData.new()
        compose_image_sign_optionsData(options)
        return options
    end  

    def test_sign_post_image_words
        puts("\nSign image words")

        file = @@BaseTest.TestFiles.getFile01PagesWords
        options = get_options_sign_image_words()
        request = GroupDocsSignatureCloud::PostImageRequest.new(file.FileName, options, file.Password, file.Folder, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image(request)
        assert_response(file, response)
    end  

    def test_sign_post_image_words_url
        puts("\nSign image words URL")

        file = @@BaseTest.TestFiles.getFile01PagesWordsUrl
        options = get_options_sign_image_words()
        request = GroupDocsSignatureCloud::PostImageFromUrlRequest.new(file.Url, options, file.Password, @@BaseTest.FileStorage)
        response = @@BaseTest.SignatureApi.post_image_from_url(request)
        assert_response(file, response)    
    end  

    def get_options_sign_image_words
        options = WordsSignImageOptionsData.new()
        compose_image_sign_optionsData(options)
        return options
    end 

    def compose_image_sign_optionsData(options)
        # set image properties
        options.image_guid = "images\\JohnSmithSign.png"
        # set position on page
        options.left = 100
        options.top = 100
        options.width = 100
        options.height = 100
        options.location_measure_type = "Pixels"
        options.size_measure_type = "Pixels"
        options.rotation_angle = 45
        options.horizontal_alignment = "None"
        options.vertical_alignment = "None"
        # set margin
        margin = GroupDocsSignatureCloud::PaddingData.new(all = 100)        
        options.margin = margin
        options.margin_measure_type = "Pixels"
        #set border    
        options.opacity = 1
        #set pages for signing
        options.sign_all_pages = false
        options.document_page_number = 1
        pagesSetup = GroupDocsSignatureCloud::PagesSetupData.new({ 'FirstPage' => true,  'LastPage' => true, 'OddPages' => true, 'EvenPages' => true})        
        options.pages_setup = pagesSetup   
    end

    def assert_response( file, response)
        assert response != nil
        assert response.code == "200"
        assert response.status == "OK"
        assert file.FileName == response.file_name
        assert response.folder == "Output"
    end        

=begin    
=end
    def teardown 
    end

end
