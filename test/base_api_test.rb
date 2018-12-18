# coding: utf-8
# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="base_api_test.rb">
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
# -----------------------------------------------------------------------------------

module GroupDocsSignatureCloud_BaseApi
    
    require 'json'
    require 'groupdocs_storage_cloud'
    require_relative './internal/test_files'
    require_relative '../lib/groupdocs_signature_cloud/configuration'
    require_relative '../lib/groupdocs_signature_cloud/api/signature_api'
    require_relative './../lib/groupdocs_signature_cloud/models/color'
    require_relative './../lib/groupdocs_signature_cloud/models/signature_font_data'

    class BaseApiTest
        include GroupDocsStorageCloud
        include GroupDocsSignatureCloud_TestFiles
        include GroupDocsSignatureCloud

        attr_accessor :FileStorage
        attr_accessor :ConfigPath
        attr_accessor :TestDataPath
        attr_accessor :TestFiles
        attr_accessor :Configuration
        attr_accessor :SignatureApi
        attr_accessor :SkipFilesUploading
        attr_accessor :UploadOnlyMissingFiles
        attr_accessor :StorageApi


        def initialize(fileStorage)
            @FileStorage = fileStorage
            @ConfigPath = File.dirname(__FILE__) + "/internal/config.json"
            @TestDataPath = File.dirname(__FILE__) + "/internal/test_data"
            @TestFiles = TestFiles.new

            getConfig()

            @SignatureApi = GroupDocsSignatureCloud::SignatureApi.new(configuration=@Configuration)
            @SkipFilesUploading = @Configuration.skip_files_uploading
            @UploadOnlyMissingFiles = @Configuration.upload_only_missing_files

            # Storage Api initialization
            storageConfiguration = GroupDocsStorageCloud::Configuration.new
            storageConfiguration.host = @Configuration.api_host
            storageConfiguration.api_version = "/v1"
            storageConfiguration.api_key['api_key']  = @Configuration.app_key
            storageConfiguration.api_key['app_sid']  = @Configuration.app_sid
            storageConfiguration.api_key_prefix = "Bearer"

            storageApiClient = GroupDocsStorageCloud::ApiClient.new(configuration = storageConfiguration)
           
            @StorageApi = GroupDocsStorageCloud::StorageApi.new(storageApiClient)
   
            #Test files uploading
            if not @SkipFilesUploading == "True"
               @TestFilesUploaded = false 
               uploadTestFiles()
            end

        end

        def getConfig
            fileConfig = File.read(@ConfigPath)
            config = JSON.parse(fileConfig)
            @Configuration = GroupDocsSignatureCloud::Configuration.new(config["AppSID"], config["AppKey"])
            @Configuration.api_host = config["ApiHost"]
            @Configuration.api_base_url = config["ApiHost"]
            @Configuration.skip_files_uploading = config["SkipFilesUploading"]
            @Configuration.upload_only_missing_files = config["UploadOnlyMissingFiles"]
        end 

        def uploadTestFiles
    
            if @TestFilesUploaded
                return True
            end    
            storageExistRequest = GroupDocsStorageCloud::GetIsStorageExistRequest.new(@FileStorage)
            storageExistsResponse = @StorageApi.get_is_storage_exist(storageExistRequest)

            if is_storage_exists(storageExistsResponse) != true
                return false
            end    
 
            #Storage folder
            @TestFiles.getAllStorageFiles().each do |item|
                upload_file(item)
            end
             
            #Images folder
            @TestFiles.getAllImagesFiles().each do |item|
                upload_file(item)  
            end                             
    
            #Certificates folder
            @TestFiles.getAllCertificatesFiles().each do |item|
                upload_file(item)
            end

            #Signed folder
            @TestFiles.getAllSignedFiles().each do |item|
                upload_file(item)  
            end

            @TestFilesUploaded = true  

        end

        def is_storage_exists(response)
            if response.code == 200 and response.status == "OK" and response.is_exist == true
                return true
            end    
            return false
        end

        def is_file_exists(response)
            if response.code == 200 and response.status == "OK" and response.file_exist.is_exist == true
                return true
            end    
            return false   
        end     
    
        def upload_file(file)
    
            storagePath = file.getStoragePath()
            # skip existing file uploading
            if @UploadOnlyMissingFiles == "True"
                fileExistRequest = GroupDocsStorageCloud::GetIsExistRequest.new(storagePath, nil, @FileStorage)
                fileExistsResponse = @StorageApi.get_is_exist(fileExistRequest)
                if is_file_exists(fileExistsResponse) == true
                    return true
                end
            end        
            # file content uploading
            filePath = file.getPath(@TestDataPath)
            fileContent = File.binread(filePath)
            putCreateRequest = GroupDocsStorageCloud::PutCreateRequest.new(storagePath, fileContent, nil, @FileStorage)
            @StorageApi.put_create(putCreateRequest)      
            puts("Uploaded: #{storagePath}") 
        end

        def get_color(web)
            color = GroupDocsSignatureCloud::Color.new({"Web" => web})
            return color
        end

        def get_font(name, size, bold, italic, underline)
            font = GroupDocsSignatureCloud::SignatureFontData.new({"FontFamily"=>name, "FontSize"=>size, "Bold"=>bold, "Italic"=>italic, "Underline"=>underline})
            return font
        end
    end 
end   
