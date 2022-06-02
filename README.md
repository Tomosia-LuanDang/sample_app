# README
>[1. Mô hình MVC](#partent-mvc)<br>
>[2. RESTful](#restful)<br>
>[3. HTTP request](#http-request")<br>
>[4. empty?, blank?, nil?, present?](#empty-blank)<br>
>[5. Route url và route path](#route-url-path)<br>
>[6. gem config](#gem-config)<br>
>[7. Webpack](#webpack)<br>
>[8. Render partial](#render-partial)<br>
>[9. Route resource vs route resources](#resources)<br>
>>[9.1. Nested resources](#nested-resources)<br>
>>[9.2. Redirect route](#redirect-route)<br>

>[10. Router collection](#collection)<br>
>[11. find vs find_by](#finds)<br>
>[12. Tác dụng của folder helper](#helper)<br>
>[13. Callback là gì?](#callback)<br>
>[14. Tại sao phải sử dụng migration](#migration)<br>
>[15. form_for](#form_for)<br>
>[16. authenticity_token](#authenticity_token)<br>
>[17. Tấn công CSRF/XSS](#attack-csrf)<br>
>[18. Strong Parameters](#strong-param)<br>
>[19. Session](#session)<br>
>[20. Update attribute](#update-attribute)<br>




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
```
Ruby version: 2.7.0

Rails version: 6.1.5
```
<a id="partent-mvc"><h2>1. Mô hình MVC</h2></a>
- MVC là viết tắt của Modle View Controller. Là một mô hình thiết kế sử dụng trong kỹ thuật phần mềm , thường được dùng để phát triển giao diện người dùng.
- Trong source mô hình này được chia thành 3 phần, mỗi phần đảm nhận một vai trò và nhiệm vụ khác nhau.<br>
- Chức năng của các thành phần:<br>


|Thành phần|Chức năng|
| -------- | ------- |
|Model|Thao tác trực tiếp với CSDL, tiếp nhận yêu cầu xử lý và xử lý dữ liệu trong CSDL|
|View|Là nơi chứa giao diện, hiển thị dữ liệu, là nơi người dùng tương tác với hệ thống|
|Controller|Tiếp nhận các yêu cầu xử lý từ người dùng, tương tác với Model để lấy dữ liệu và tương tác với View để trả về giao diện hiển thị cho browser|

<a id="restful"><h2>2. RESTful</h2></a>
- Là một tiêu chuẩn dùng trong việc thiết kế API cho các ứng dụng web (thiết kế Web services) để tiện cho việc quản lý các resource. Nó chú trọng vào tài nguyên hệ thống (tệp văn bản, ảnh, âm thanh, video, hoặc dữ liệu động…), bao gồm các trạng thái tài nguyên được định dạng và được truyền tải qua HTTP.
- Các phương thức trong RESTful:<br>

| Phương thức | Chức năng |
|  ---------  | --------- |
|GET (SELECT)|Trả về một Resource hoặc một danh sách Resource|
|POST (CREATE)|Tạo mới một Resource|
|PUT (UPDATE)|Cập nhật thông tin cho Resource|
|DELETE (DESTROY)|Xoá một Resource|

<a id="http-request"><h2>3. HTTP request</h2></a>
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

<a id="empty-blank"><h2>4. empty?, blank?, nil?, present?</h2></a>
### empty?
Là một function có sẵn của String, Hash, Array
`.empty?` trả về `true` nếu giá trị của biến là rỗng
```ruby
"".empty?
# => true
[].empty?
# => true
{}.empty?
# => true
" ".empty?
# => false
[nil].empty?
# => false
```

### blank?
Là một function trong rails
```ruby
"".blank?
# => true
[].blank?
# => true
{}.blank?
# => true
" ".blank?
# => true
[nil].blank?
# => false
```

### nil?
Là một hàm của Object, nên tất cả các object kế thừa từ Object mặc định đều có hàm nil?<br>
Chỉ có nil object trả về true khi gọi nil?
```ruby
nil.nil?
# => true
```

<a id="route-url-path"><h2>5. Route url và route path</h2></a>

|route url|route path|
|:---|:---|
|{action}_url|{action}_path|
|Trả về một đường dẫn tuyệt đối bao gồm cả tiền tố https:://... của `action`|Trả về một đừng dẫn tương đối của `action`|
VD|
|||
|||
|||<br>

<a id="gem-config"><h2>6. gem config</h2></a>
<a id="webpack"><h2>7. Webpack</h2></a>
<a id="render-partial"><h2>8. Render partial</h2></a>
<a id="resources"><h2>9. Route resource vs route resources</h2></a>
- Route `resources` tạo ra một bộ **5 method** và **7 action** mặc định
- Các method và action tương ứng:<br>

 **`resources :users`**

|Method|URL|controller action|helper path|Use|
|:---|:---|:---|:---|:---|
|GET|/users|users#index|users_path|hiển thị tất cả các users|
|GET|/users/new|users#new|new_user_path|trả về HTML form để tạo mới một user|
|POST|/users|users#create|users_path|tạo mới user|
|GET|/users/:id|users#show|user_path(:id)|hiển thị một user cụ thể|
|GET|/users/:id/edit|users#edit|edit_user_path(:id)|trả về HTML form để thay đổi một user|
|PATCH|/users/:id|users#update|user_path(:id)|thay đổi một user cụ thể|
|PUT|/users/:id|users#update|user_path(:id)|thay đổi một user cụ thể|
|DELETE|/users/:id|users#destroy|user_path(:id)|xóa một user cụ thể|

- Route `resource` tạo ra một bộ **5 method** và **6 action** mặc định
- Các method và action tương ứng:<br>

**`resource :books`**

|Method|URL|controller action|helper path|Use|
|:---|:---|:---|:---|:---|
|GET|/books/new|books#new|new_book_path|trả về HTML form để tạo mới một book|
|POST|/books|books#create|books_path|tạo mới book|
|GET|/books/:id|books#show|book_path(:id)|hiển thị một book cụ thể|
|GET|/books/:id/edit|books#edit|edit_book_path(:id)|trả về HTML form để thay đổi một book|
|PATCH|/books/:id|books#update|book_path(:id)|thay đổi một book cụ thể|
|PUT|/books/:id|books#update|book_path(:id)|thay đổi một book cụ thể|
|DELETE|/books/:id|books#destroy|book_path(:id)|xóa một book cụ thể|

`=>` Ở đây, `resources` tạo ra nhiều hơn `resource` một action đó chính là `index`.
<a id="nested-resources"><h3>9.1. Nested resources</h3></a>
<a id="redirect-route"><h3>9.2. Redirect route</h3></a>
<a id="collection"><h2>10. Router collection</h2></a>
<a id="finds"><h2>11. find vs find_by</h2></a>
<a id="helper"><h2>12. Tác dụng của folder helper</h2></a>
<a id="callback"><h2>13. Callback là gì?</h2></a>
<a id="migration"><h2>14. Tại sao phải sử dụng migration</h2></a>
<a id="form_for"><h2>15. form_for</h2></a>
<a id="authenticity_token"><h2>16. authenticity_token</h2></a>

Khi user views một biểu mẫu trong form để tạo, sửa, xóa tài nguyên, Rails sẽ sinh ra ngẫu nhiên 1 `authenticity_token`, lưu nó trong session và đặt nó vào một trường ẩn trong form.
```html
<input name="authenticity_token" type="hidden"
value="NNb6+J/j46LcrgYUC60wQ2titMuJQ5lLqyAbnbAUkdo=" />
```
Khi user ấn submit, Rails sẽ tìm kiếm `authenticity_token` và so sánh nó với `authenticity_token` đã được lưu trong session. Nếu giống nhau thì yêu cầu được tiếp tục.<br>
=> Rails sử dụng nó để ngăn chặn tấn công [cross-site request forgery (CSRF)](https://stackoverflow.com/questions/941594/understanding-the-rails-authenticity-token) vào trang web.

<a id="attack-csrf"><h2>17. Tấn công CSRF/XSS</h2></a>
<a id="strong-param"><h2>18. Strong Parameters</h2></a>
<a id="session"><h2>19. Session</h2></a>
<a id="update-attribute"><h2>20. Update attribute</h2></a>
