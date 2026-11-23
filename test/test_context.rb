#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_contex.rb">
#    Copyright (c) Aspose Pty Ltd
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
    
    require "minitest/autorun"

    require_relative './../lib/groupdocs_signature_cloud'
    require_relative './test_settings'
    require_relative './test_file'    

    class TestContext < Minitest::Test

      @@test_files_uploaded ||= false
      @@apis ||= nil

      def setup
        # API clients are shared between tests, so the access token is requested only once
        # instead of once per test (that is much faster and does not overload the auth server)
        @@apis ||= begin
          config = Configuration.new(TestSettings::APP_SID, TestSettings::APP_KEY)
          config.api_base_url = TestSettings::API_BASE_URL
          #config.debugging = true

          {
            info: InfoApi.from_config(config),
            sign: SignApi.from_config(config),
            storage: StorageApi.from_config(config),
            folder: FolderApi.from_config(config),
            file: FileApi.from_config(config)
          }
        end

        @info_api = @@apis[:info]
        @sign_api = @@apis[:sign]
        @storage_api = @@apis[:storage]
        @folder_api = @@apis[:folder]
        @file_api = @@apis[:file]

        upload_test_files()
      end

      def teardown 
        remove_folder_in_storage "Output"
      end

      def remove_folder_in_storage(folder)
        request = DeleteFolderRequest.new(folder, nil, true)
        @folder_api.delete_folder request
      end

      def upload_test_files
        unless @@test_files_uploaded then
          TestFile.test_files_list.each do |test_file|
            
            exist_request = ObjectExistsRequest.new(test_file.path)
            exist_response = @storage_api.object_exists(exist_request)            
            
            if !exist_response.exists then
              @storage_api.config.logger.debug "Uploading: " + test_file.path
              File.open(test_file.local_path, "rb") do |file|
                upload_request = UploadFileRequest.new test_file.path, file
                @file_api.upload_file(upload_request)
              end
            end
          end
          @@test_files_uploaded = true
        end
      end

    end
end