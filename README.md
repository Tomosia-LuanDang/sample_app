# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version: 2.7.0

Rails version: 6.1.5

## 1. Mô hình MVC
- MVC là viết tắt của Modle View Controller. Là một mô hình thiết kế sử dụng trong kỹ thuật phần mềm , thường được dùng để phát triển giao diện người dùng.
- Trong source mô hình này được chia thành 3 phần, mỗi phần đảm nhận một vai trò và nhiệm vụ khác nhau.<br>
- Chức năng của các thành phần:<br>


|Thành phần|Chức năng|
| -------- | ------- |
|Model|Thao tác trực tiếp với CSDL, tiếp nhận yêu cầu xử lý và xử lý dữ liệu trong CSDL|
|View|Là nơi chứa giao diện, hiển thị dữ liệu, là nơi người dùng tương tác với hệ thống|
|Controller|Tiếp nhận các yêu cầu xử lý từ người dùng, tương tác với Model để lấy dữ liệu và tương tác với View để trả về giao diện hiển thị cho browser|


## 2. RESTful
- Là một tiêu chuẩn dùng trong việc thiết kế API cho các ứng dụng web (thiết kế Web services) để tiện cho việc quản lý các resource. Nó chú trọng vào tài nguyên hệ thống (tệp văn bản, ảnh, âm thanh, video, hoặc dữ liệu động…), bao gồm các trạng thái tài nguyên được định dạng và được truyền tải qua HTTP.
- Các phương thức trong RESTful:<br>

| Phương thức | Chức năng |
|  ---------  | --------- |
|GET (SELECT)|Trả về một Resource hoặc một danh sách Resource|
|POST (CREATE)|Tạo mới một Resource|
|PUT (UPDATE)|Cập nhật thông tin cho Resource|
|DELETE (DELETE)|Xoá một Resource|

## 3. HTTP request
- HTTP request là thông tin được gửi từ client lên server, để yêu cầu server tìm hoặc xử lý một số thông tin, dữ liệu mà client muốn. HTTP request có thể là một file text dưới dạng XML hoặc Json mà cả hai đều có thể hiểu được.
- Các phương thức của HTTP:<br>

| Phương thứcs | Chức năng |
|:----------|:-----------|
|GET|Lấy thông tin từ server theo URI đã cung cấp|
|HEAD|Giống với GET nhưng response trả về không có body, chỉ có header|
|POST|Gửi thông tin tới sever thông qua các biểu mẫu http.|
|PUT|Ghi đè tất cả thông tin của đối tượng với những gì được gửi lên|
|PATCH|Ghi đè các thông tin được thay đổi của đối tượng.|
|DELETE|Xóa tài nguyên trên server.|
|CONNECT|Thiết lập một kết nối tới server theo URI.|
|OPTIONS|Mô tả các tùy chọn giao tiếp cho resource.|
|TRACE|Thực hiện một bài test loop – back theo đường dẫn đến resource.|
