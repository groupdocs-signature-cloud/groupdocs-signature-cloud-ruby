# ------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="groupdocs_signature_cloud.rb">
#   Copyright (c) 2003-2021 Aspose Pty Ltd
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
# ------------------------------------------------------------------------------------

# Common files
require_relative 'groupdocs_signature_cloud/api_client'
require_relative 'groupdocs_signature_cloud/api_error'
require_relative 'groupdocs_signature_cloud/version'
require_relative 'groupdocs_signature_cloud/configuration'

# Models
require_relative 'groupdocs_signature_cloud/models/barcode_type'
require_relative 'groupdocs_signature_cloud/models/barcodes_result'
require_relative 'groupdocs_signature_cloud/models/base_settings'
require_relative 'groupdocs_signature_cloud/models/border_line'
require_relative 'groupdocs_signature_cloud/models/brush'
require_relative 'groupdocs_signature_cloud/models/color'
require_relative 'groupdocs_signature_cloud/models/delete_options'
require_relative 'groupdocs_signature_cloud/models/delete_result'
require_relative 'groupdocs_signature_cloud/models/disc_usage'
require_relative 'groupdocs_signature_cloud/models/error'
require_relative 'groupdocs_signature_cloud/models/error_details'
require_relative 'groupdocs_signature_cloud/models/file_info'
require_relative 'groupdocs_signature_cloud/models/file_versions'
require_relative 'groupdocs_signature_cloud/models/files_list'
require_relative 'groupdocs_signature_cloud/models/files_upload_result'
require_relative 'groupdocs_signature_cloud/models/format'
require_relative 'groupdocs_signature_cloud/models/formats_result'
require_relative 'groupdocs_signature_cloud/models/info_result'
require_relative 'groupdocs_signature_cloud/models/object_exist'
require_relative 'groupdocs_signature_cloud/models/options_base'
require_relative 'groupdocs_signature_cloud/models/padding'
require_relative 'groupdocs_signature_cloud/models/page_info'
require_relative 'groupdocs_signature_cloud/models/pages_setup'
require_relative 'groupdocs_signature_cloud/models/pdf_digital_signature'
require_relative 'groupdocs_signature_cloud/models/preview_page'
require_relative 'groupdocs_signature_cloud/models/preview_result'
require_relative 'groupdocs_signature_cloud/models/qr_code_type'
require_relative 'groupdocs_signature_cloud/models/qr_codes_result'
require_relative 'groupdocs_signature_cloud/models/save_options'
require_relative 'groupdocs_signature_cloud/models/search_result'
require_relative 'groupdocs_signature_cloud/models/sign_result'
require_relative 'groupdocs_signature_cloud/models/signature'
require_relative 'groupdocs_signature_cloud/models/signature_font'
require_relative 'groupdocs_signature_cloud/models/stamp_line'
require_relative 'groupdocs_signature_cloud/models/storage_exist'
require_relative 'groupdocs_signature_cloud/models/storage_file'
require_relative 'groupdocs_signature_cloud/models/time_stamp'
require_relative 'groupdocs_signature_cloud/models/update_options'
require_relative 'groupdocs_signature_cloud/models/update_result'
require_relative 'groupdocs_signature_cloud/models/verify_result'
require_relative 'groupdocs_signature_cloud/models/barcode_signature'
require_relative 'groupdocs_signature_cloud/models/delete_settings'
require_relative 'groupdocs_signature_cloud/models/digital_signature'
require_relative 'groupdocs_signature_cloud/models/file_version'
require_relative 'groupdocs_signature_cloud/models/image_signature'
require_relative 'groupdocs_signature_cloud/models/info_settings'
require_relative 'groupdocs_signature_cloud/models/linear_gradient_brush'
require_relative 'groupdocs_signature_cloud/models/preview_settings'
require_relative 'groupdocs_signature_cloud/models/qr_code_signature'
require_relative 'groupdocs_signature_cloud/models/radial_gradient_brush'
require_relative 'groupdocs_signature_cloud/models/search_options'
require_relative 'groupdocs_signature_cloud/models/search_settings'
require_relative 'groupdocs_signature_cloud/models/sign_options'
require_relative 'groupdocs_signature_cloud/models/sign_settings'
require_relative 'groupdocs_signature_cloud/models/solid_brush'
require_relative 'groupdocs_signature_cloud/models/text_signature'
require_relative 'groupdocs_signature_cloud/models/texture_brush'
require_relative 'groupdocs_signature_cloud/models/update_settings'
require_relative 'groupdocs_signature_cloud/models/verify_options'
require_relative 'groupdocs_signature_cloud/models/verify_settings'
require_relative 'groupdocs_signature_cloud/models/search_barcode_options'
require_relative 'groupdocs_signature_cloud/models/search_digital_options'
require_relative 'groupdocs_signature_cloud/models/search_qr_code_options'
require_relative 'groupdocs_signature_cloud/models/sign_image_options'
require_relative 'groupdocs_signature_cloud/models/sign_text_options'
require_relative 'groupdocs_signature_cloud/models/verify_digital_options'
require_relative 'groupdocs_signature_cloud/models/verify_text_options'
require_relative 'groupdocs_signature_cloud/models/sign_barcode_options'
require_relative 'groupdocs_signature_cloud/models/sign_digital_options'
require_relative 'groupdocs_signature_cloud/models/sign_qr_code_options'
require_relative 'groupdocs_signature_cloud/models/sign_stamp_options'
require_relative 'groupdocs_signature_cloud/models/verify_barcode_options'
require_relative 'groupdocs_signature_cloud/models/verify_qr_code_options'

# APIs
require_relative 'groupdocs_signature_cloud/api/file_api'
require_relative 'groupdocs_signature_cloud/api/folder_api'
require_relative 'groupdocs_signature_cloud/api/info_api'
require_relative 'groupdocs_signature_cloud/api/preview_api'
require_relative 'groupdocs_signature_cloud/api/sign_api'
require_relative 'groupdocs_signature_cloud/api/storage_api'
