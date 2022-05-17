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
>[15. form_for, form_tag, form_with](#form_for)<br>
>[16. authenticity_token](#authenticity_token)<br>
>[17. Tấn công CSRF/XSS](#attack-csrf)<br>
>[18. Strong Parameters](#strong-param)<br>
>[19. Session](#session)<br>
>[20. Cookies](#cookies)<br>
>[21. Local storage](#local-stories)<br>
>[22. Session storage](#session-stories)<br>
>[23. Update attribute](#update-attribute)<br>




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
<a id="form_for"><h2>15. form_for, form_tag, form_with</h2></a>
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

**Session** là phiên làm việc. Nó là cách đơn giản để lưu trữ 1 biến và khiến biến đó có thể tồn tại từ trang này sang trang khác, session sẽ hết hạn khi người dùng kết thúc phiên làm việc hoặc đóng trình duyệt.

**Hoạt động:**<br>
Session khi sinh ra được lưu trên 1 file có tên dài dòng, khó đoán và được tạo ngẫu nhiên là session id trên máy chủ, và đồng thời ở máy client cũng có 1 cookie sinh ra có nội dung (hay giá trị) đúng như session id (để có thể so khớp session nào là của client nào)

Ví dụ, như trong bài tập sample_app:

1. Khi gọi session[:current_user_id] = 1, session này không tồn tại

2. Rails sẽ tạo bản ghi mới trong session với Session ID ngẫu nhiên (ví dụ: 5c3a6f2062c31c9a807ce63d59fdc1e3).

3. Nó sẽ lưu trữ {current_user_id: 1} (được mã hóa Base64) trong data attribute của bản ghi đó.

4. Nó sẽ trả lại Session ID được tạo, 5c3a6f2062c31c9a807ce63d59fdc1e3, cho trình duyệt bằng cách sử dụng Set-cookie.

Tiếp tục request đến một trang khác:

1. Trình duyệt sẽ gửi cùng một cookie đó cho ứng dụng, sử dụng Cookie: header. VD: (Cookie: _my_app_session=5c3a6f2062c31c9a807ce63d59fdc1e3; path=/; HttpOnly)

2. Khi gọi session[:current_user_id]

3. Ứng dụng lấy ra Session ID từ cookie, và tìm thấy bản ghi của Session ID trong bảng Session.

4. Sau đó, nó trả về current_user_id trong data attribute của bản ghi đó.

<a id="cookies"><h2>20. Cookies</h2></a>

**Cookie** là một phần dữ liệu được lưu trên máy khách. Mỗi khi máy khách gửi một yêu cầu tới máy chủ nào đó, thì nó sẽ gửi phần dữ liệu được lưu trong cookie tương ứng với máy chủ đó.

Trong Cookie có một số thông số sau:

Địa chỉ URL mà trình duyệt sẽ gửi cookie tới<br>
Thời gian hết hạn của cookie<br>
Các cặp biến: giá trị được lưu trữ liên tục<br>

**Hoạt động:**
- Khác với dữ liệu gửi từ form (POST hay GET) thì cookies sẽ được trình duyệt tự động gửi đi theo mỗi lần truy cập lên máy chủ.
- Trong quá trình làm việc, cookie có thể bị thay đổi giá trị. Cookie sẽ bị vô hiệu hoá nếu cửa sổ trình duyệt điều khiển cookie đóng lại và cookie hết thời gin có hiệu lực.
- Theo mặc định, thời gian “sống” của cookies là tồn tại cho đến khi cửa sổ trình duyệt sử dụng cookies bị đóng. Tuy nhiên ta có thể thiết lập tham số thời gian để cookie có thể sống lâu hơn. Vì vậy, cookie sẽ hoạt động ngay cả khi người dùng đóng trình duyệt hay không.
- Ví dụ như chế độ Remember Email & Password trong bài tập sample_app này.

**Sự khác nhau giữa cookie và session:**

||Cookie|Session|
|:--|:---|:---|
|Nơi lưu trữ|Cookie được lưu trữ trên trình duyệt của người dùng.|Session không được lưu trữ trong trình duyệt của người dùng.|
|Nơi lưu trữ dữ liệu |Dữ liệu cookie được lưu trữ ở phía máy khách.|Dữ liệu session được lưu trữ ở phía máy chủ.|
|Thời gian tồn tại|Dữ liệu cookie tồn tại cho đến khi hết hạn.|Sau khi đóng trình duyệt sẽ mất thông tin session.|
|Bảo mật|Dữ liệu cookie dễ dàng sửa đổi khi chúng được lưu trữ ở phía khách hàng.|Dữ liệu session không dễ dàng sửa đổi vì chúng được lưu trữ ở phía máy chủ.|
|Lượng data truyền tải|Tất cả các cookie hiện có của website|Chỉ file cookie chứa session id|

<a id="local-stories"><h2>21. Local storage</h2></a>

**Giới thiệu:**
- Được lưu trữ trên trình duyệt của người dùng
- Khả năng lưu trữ vô thời hạn
- Lưu trữ được 5MB dữ liệu
- Không gửi thông tin lên server như Cookie nên bảo mật tốt hơn.
- Dữ liệu có thể chia sẻ giữa các tab, các cửa sổ cùng lúc nếu nó có chung nguồn gốc hay còn gọi là "same origin" (bao gồm 3 thành phần domain/port/protocol).
<a id="session-stories"><h2>22. Session storage</h2></a>

**Giới thiệu:**<br>
**Session Storage** cũng giống như **local Storage**, nhưng chỉ khác về thời gian tồn tại và khả năng chia sẻ dữ liệu giữa các tab:
- Được lưu trữ trên trình duyệt của người dùng
- Tồn tại cho đến khi người dùng đóng tab, đóng trình duyệt.
- Lưu trữ được 5MB dữ liệu
- Dữ liệu không được gửi đi đến server thông qua các request header.
- Dữ liệu chỉ tồn tại trong tab trình duyệt hiện tại, một tab khác dù mở cùng một trang nhưng nó sẽ có bộ nhớ khác.
- Dữ liệu vẫn tồn tại khi tải lại trang
<a id="update-attribute"><h2>23. Update attribute</h2></a>
