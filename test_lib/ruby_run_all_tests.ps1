$current_path = (Get-Item -Path ".\").FullName

Write-Output ""
Write-Output "=================Common Operations================="
Write-Output ""
$test_common_operations = Join-Path -Path $current_path -ChildPath "test_common_operations.rb"
ruby $test_common_operations

Write-Output ""
Write-Output "=================Search================="
Write-Output ""
$test_search_barcode = Join-Path -Path $current_path -ChildPath "test_search_barcode.rb"
ruby $test_search_barcode
$test_search_digital = Join-Path -Path $current_path -ChildPath "test_search_digital.rb"
ruby $test_search_digital
$test_search_qrcode = Join-Path -Path $current_path -ChildPath "test_search_qrcode.rb"
ruby $test_search_qrcode

Write-Output ""
Write-Output "=================Signature================="
Write-Output ""
$test_sign_barcode = Join-Path -Path $current_path -ChildPath "test_sign_barcode.rb"
ruby $test_sign_barcode
$test_sign_digital = Join-Path -Path $current_path -ChildPath "test_sign_digital.rb"
ruby $test_sign_digital
$test_sign_image = Join-Path -Path $current_path -ChildPath "test_sign_image.rb"
ruby $test_sign_image
$test_sign_qrcode = Join-Path -Path $current_path -ChildPath "test_sign_qrcode.rb"
ruby $test_sign_qrcode
$test_sign_stamp = Join-Path -Path $current_path -ChildPath "test_sign_stamp.rb"
ruby $test_sign_stamp
$test_sign_text = Join-Path -Path $current_path -ChildPath "test_sign_text.rb"
ruby $test_sign_text

Write-Output ""
Write-Output "=================Verification================="
Write-Output ""
$test_verify_barcode = Join-Path -Path $current_path -ChildPath "test_verify_barcode.rb"
ruby $test_verify_barcode
$test_verify_digital = Join-Path -Path $current_path -ChildPath "test_verify_digital.rb"
ruby $test_verify_digital
$test_verify_qrcode = Join-Path -Path $current_path -ChildPath "test_verify_qrcode.rb"
ruby $test_verify_qrcode
$test_verify_text = Join-Path -Path $current_path -ChildPath "test_verify_text.rb"
ruby $test_verify_text

Write-Output "Completed..."