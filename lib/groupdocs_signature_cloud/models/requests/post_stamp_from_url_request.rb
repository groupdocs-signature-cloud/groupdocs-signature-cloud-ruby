# coding: utf-8
# ---------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="post_stamp_from_url_request.rb">
 #   Copyright (c) 2003-2018 Aspose Pty Ltd
 # </copyright>
 # <summary>
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
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

  #
  # Request model for post_stamp_from_url operation.
  #
  class PostStampFromUrlRequest

        # The URL to retrieve document.
        attr_accessor :url
        # Stamp Signature Options for corresponding Document Type
        attr_accessor :sign_options_data
        # Document password if required.
        attr_accessor :password
        # The file storage which have to be used.
        attr_accessor :storage
	
        #
        # Initializes a new instance.
        # @param url The URL to retrieve document.
        # @param sign_options_data Stamp Signature Options for corresponding Document Type
        # @param password Document password if required.
        # @param storage The file storage which have to be used.
        def initialize(url, sign_options_data = nil, password = nil, storage = nil)
           self.url = url
           self.sign_options_data = sign_options_data
           self.password = password
           self.storage = storage
        end
  end
end
 #
 # -----------------------------------