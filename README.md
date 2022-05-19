# README
>[1. Mô hình MVC](#partent-mvc)<br>
>[2. RESTful](#restful)<br>
>[3. HTTP request](#http-request")<br>
>[4. empty?, blank?, nil?, present?](#empty-blank)<br>
>[5. Route url và route path](#route-url-path)<br>
>[6. gem config](#gem-config)<br>
>[7. Webpack](#webpack)<br>
>[8. Render partial](#render-partial)<br>
>[9. Rails routing](#routing)<br>
>>[9.1. Route resources](#resources)<br>
>>[9.2. Route resource](#resource)<br>
>>[9.3. Nested resources](#nested-resources)<br>
>>[9.4. Redirect route](#redirect-route)<br>
>>[9.5. Controller Namespaces and Routing](#namespace-route)<br>

>[10. Router collection](#collection)<br>
>[11. Router member](#member)<br>
>[12. find vs find_by](#finds)<br>
>[13. Tác dụng của folder helper](#helper)<br>
>[14. Callback là gì?](#callback)<br>
>[15. Tại sao phải sử dụng migration](#migration)<br>
>[16. form_for, form_tag, form_with](#form_for)<br>
>[17. authenticity_token](#authenticity_token)<br>
>[18. Tấn công CSRF/XSS](#attack-csrf)<br>
>[19. Strong Parameters](#strong-param)<br>
>[20. Session](#session)<br>
>[21. Cookies](#cookies)<br>
>[22. Local storage](#local-stories)<br>
>[23. Session storage](#session-stories)<br>
>[24. Update record](#update-attribute)<br>
>[25. Active Record Associations](#active-record-associations)<br>
>[26. Callback function, thứ tự callback](#callback)<br>
>[27. Dependent](#dependent)<br>
>[28. Count, size, length](#count-size-length)<br>
>[29. Destroy và Delete](#destroy-delete)<br>
>[30. deliver_now vs deliver_later](#deliver_mail)<br>
>[31. update, update_attribute, update_attributes, update_column](#update_active_record)<br>
>[32. render vs redirect_to](#render_redirect)<br>
>[33. HTTP status code](#http_error)<br>
>[34. save, save! và update_attribute!](#different_3)<br>

>[27. Dependentasaaa](#dependentasdsad)<br>


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
Là một function trong rails, trả về `true` nếu là rỗng hoặc khoảng trắng.
```ruby
"".blank?
# => true
{}.blank?
# => true
" ".blank?
# => true
nil.blank?
=> true
[].blank?
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

### present?
Là một function trong rails, trả về `false` nếu là rỗng hoặc khoảng trắng.
Có thể nói `present?` ngược lại với `blank?`
```ruby
"".present?
# => false
{}.present?
# => false
" ".present?
# => false
nil.present?
# => false
[].present?
# => false
[nil].present?
# => true
```

<a id="route-url-path"><h2>5. Route url và route path</h2></a>

|route url|route path|
|:---|:---|
|{action}_url|{action}_path|
|Trả về một đường dẫn tuyệt đối bao gồm cả tiền tố https:://... của `action`|Trả về một đừng dẫn tương đối của `action`|
VD|
|login_url|about_path|
|# =>  'http://www.example.com/login'|# => '/about'|

<a id="gem-config"><h2>6. gem config</h2></a>

<a id="webpack"><h2>7. Webpack</h2></a>
<a id="render-partial"><h2>8. Render partial</h2></a>
<a id="routing"><h2>9. Rails routing</h2></a>
<a id="resources"><h3>9.1. Route resources</h3></a>
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

<a id="resource"><h3>9.2. Route resource</h3></a>
- Route `resource` tạo ra một bộ **5 method** và **6 action** mặc định
- Các method và action tương ứng:<br>

**`resource :books`**

|Method|URL|controller action|helper path|Use|
|:---|:---|:---|:---|:---|
|GET|/books/new|books#new|new_book_path|trả về HTML form để tạo mới một book|
|POST|/books|books#create|books_path|tạo mới book|
|GET|/books|books#show|book_path|hiển thị một book cụ thể|
|GET|/books/edit|books#edit|edit_book_path|trả về HTML form để thay đổi một book|
|PATCH|/books|books#update|book_path|thay đổi một book cụ thể|
|PUT|/books|books#update|book_path|thay đổi một book cụ thể|
|DELETE|/books|books#destroy|book_path|xóa một book cụ thể|

`=>` Ở đây, `resources` tạo ra nhiều hơn `resource` một action đó chính là `index`. Và các route trong `resource` không sử dụng đến `:id`
- Về cơ bản resource và resources dựa trên nguyên tắc của RESTful để tạo ra các route.

**Non-RESTful Routes**
- Chúng ta cũng có thể tạo ra route riêng và ánh xạ nó vào controller mà không tuân theo RESTful:
```ruby
get "/help", to: "static_pages#help"
```

<a id="nested-resources"><h3>9.3. [Nested resources](https://bitly.com.vn/vtvlpq)</h3></a>
Nested Resources là một kĩ thuật trong Rails, nó dùng để phản ánh mối quan hệ has_many giữa các model trong routes và sau đó thể hiện nó qua URLs. Việc sử dụng Nested Resources giúp code dễ hiểu hơn, giúp code DRY (don't repeat yourself).

```ruby
#app/models/user.rb
class User < ActiveRecord::Base
    has_many :microposts
end


#app/models/micropost.rb
class Micropost < ActiveRecord::Base
    belongs_to :user
end
```
Một `user` sẽ có nhiều `microposts` và một `micropost` sẽ thuộc về một `user`.<br>
Trong file config/routes.rb ta cấu hình như sau:
```ruby
resources :users do
  resources :microposts
end
```
Bây giờ ta đã có Nested Resources trong ứng dụng như sau:
![Nested Resources](https://bitly.com.vn/rqtx26)

<a id="redirect-route"><h3>9.4. Redirect route</h3></a>

Sử dụng helper `redirect` để chuyển hướng sang một route khác. Thường sử dụng khi app thay đổi các đường dẫn.
```ruby
get "/stories", to: redirect("/articles")
```
Trong ví dụ trên, khi người dùng nhập url "/stories", Rails app sẽ tự động chuyển hướng về url "/articles".

<a id="namespace-route"><h3>9.5. Controller Namespaces and Routing</h3></a>

Ta có thể nhóm các controller vào một namespaces bằng từ khóa namespace. Ví dụ nhóm các controller Users và Microposts trong namespace `admin`.
```ruby
namespace :admin do
 resources :users, :microposts
end
```
Khi đó, để xem được các bài viết bạn phải thêm tiền tố `admin` vào url.
```ruby
/admin/users
```
Khi đó đường dẫn và helper sẽ thay đổi như sau:
|Method|URL|controller action|helper path|
|:---|:---|:---|:---|
|GET|/admin/users|admin/users#index|admin_users_path|
|POST|/admin/users|admin/users#create|admin_users_path(:id)users_path|
|GET|/admin/users/new|admin/users#new|new_admin_user_path(:id)user_path|
|GET|/admin/users/:id/edit|admin/users#edit|edit_admin_user_path(:id)|
|GET|/admin/users/:id|admin/users#show|admin_user_path(:id)|
|PATCH|/admin/users/:id|admin/users#update|admin_user_path(:id)|
|PUT|/admin/users/:id|admin/users#update|admin_user_path(:id)|
|DELETE|/admin/users/:id|admin/users#destroy|admin_user_path(:id)|

**Tương tự cho resources :microposts**

<a id="collection"><h2>10. Router collection</h2></a>
<a id="member"><h2>11. Router member</h2></a>
<a id="finds"><h2>12. find vs find_by</h2></a>
||find|find_by|
|:---|:---|:---|
|Chức năng|Tìm kiếm bản ghi với giá trị id|Có thể tìm kiếm bản ghi bằng tất cả các thuộc tính|
||Có thể tìm kiếm cùng lúc nhiều bản ghi bằng cách truyền vào nhiều giá trị id|Chỉ tìm kiếm được 1 bản ghi cho mỗi lần thực hiện|
|Giá trị trả về|Các bản được tìm thấy hoặc một exception nếu không tìm thấy bản ghi|Trả về bản ghi đầu tiên được tìm thấy hoặc nil|
|Ví dụ|`User.find(5)`|`User.find_by(name: "Luan Dang")`|
||Tìm kiếm User có id = 5|Tìm kiếm User có name = Luan Dang|
||`User.find(5,6,7)`|`User.find_by(name: "Luan Dang", name: "Phuong Thanh")`|
||Trả về 3 bản ghi|Trả về 1 bản ghi|

<a id="helper"><h2>13. Tác dụng của folder helper</h2></a>
<a id="callback"><h2>14. Callback là gì?</h2></a>
<a id="migration"><h2>15. Tại sao phải sử dụng migration</h2></a>
<a id="form_for"><h2>16. form_for, form_tag, form_with</h2></a>
<a id="authenticity_token"><h2>17. authenticity_token</h2></a>

Khi user views một biểu mẫu trong form để tạo, sửa, xóa tài nguyên, Rails sẽ sinh ra ngẫu nhiên 1 `authenticity_token`, lưu nó trong session và đặt nó vào một trường ẩn trong form.
```html
<input name="authenticity_token" type="hidden"
value="NNb6+J/j46LcrgYUC60wQ2titMuJQ5lLqyAbnbAUkdo=" />
```
Khi user ấn submit, Rails sẽ tìm kiếm `authenticity_token` và so sánh nó với `authenticity_token` đã được lưu trong session. Nếu giống nhau thì yêu cầu được tiếp tục.<br>
=> Rails sử dụng nó để ngăn chặn tấn công [cross-site request forgery (CSRF)](https://bitly.com.vn/jzrfs1) vào trang web.

<a id="attack-csrf"><h2>18. Tấn công CSRF/XSS</h2></a>
<a id="strong-param"><h2>19. Strong Parameters</h2></a>
<a id="session"><h2>20. Session</h2></a>

**Session** là phiên làm việc. Nó là cách đơn giản để lưu trữ 1 biến và khiến biến đó có thể tồn tại từ trang này sang trang khác, session sẽ hết hạn khi người dùng kết thúc phiên làm việc hoặc đóng trình duyệt.

**Hoạt động:**<br>
Session khi sinh ra được lưu trên 1 file có tên dài dòng, khó đoán và được tạo ngẫu nhiên là session id trên máy chủ, và đồng thời ở máy client cũng có 1 cookie sinh ra có nội dung (hay giá trị) đúng như session id (để có thể so khớp session nào là của client nào)

Ví dụ, như trong bài tập sample_app:
```
1. Khi gọi session[:current_user_id] = 1, session này không tồn tại

2. Rails sẽ tạo bản ghi mới trong session với Session ID ngẫu nhiên (ví dụ: 5c3a6f2062c31c9a807ce63d59fdc1e3).

3. Nó sẽ lưu trữ {current_user_id: 1} (được mã hóa Base64) trong data attribute của bản ghi đó.

4. Nó sẽ trả lại Session ID được tạo, 5c3a6f2062c31c9a807ce63d59fdc1e3, cho trình duyệt bằng cách sử dụng Set-cookie.
```
Tiếp tục request đến một trang khác:
```
1. Trình duyệt sẽ gửi cùng một cookie đó cho ứng dụng, sử dụng Cookie: header. VD: (Cookie: _my_app_session=5c3a6f2062c31c9a807ce63d59fdc1e3; path=/; HttpOnly)

2. Khi gọi session[:current_user_id]

3. Ứng dụng lấy ra Session ID từ cookie, và tìm thấy bản ghi của Session ID trong bảng Session.

4. Sau đó, nó trả về current_user_id trong data attribute của bản ghi đó.
```
<a id="cookies"><h2>21. Cookies</h2></a>

**Cookie** là một phần dữ liệu được lưu trên máy khách. Mỗi khi máy khách gửi một yêu cầu tới máy chủ nào đó, thì nó sẽ gửi phần dữ liệu được lưu trong cookie tương ứng với máy chủ đó.

Trong Cookie có một số thông số sau:

Địa chỉ URL mà trình duyệt sẽ gửi cookie tới<br>
Thời gian hết hạn của cookie<br>
Các cặp biến: giá trị được lưu trữ liên tục<br>

**Hoạt động:**
```
- Khác với dữ liệu gửi từ form (POST hay GET) thì cookies sẽ được trình duyệt tự động gửi đi theo mỗi lần truy cập lên máy chủ.
- Trong quá trình làm việc, cookie có thể bị thay đổi giá trị. Cookie sẽ bị vô hiệu hoá nếu cửa sổ trình duyệt điều khiển cookie đóng lại và cookie hết thời gin có hiệu lực.
- Theo mặc định, thời gian “sống” của cookies là tồn tại cho đến khi cửa sổ trình duyệt sử dụng cookies bị đóng. Tuy nhiên ta có thể thiết lập tham số thời gian để cookie có thể sống lâu hơn. Vì vậy, cookie sẽ hoạt động ngay cả khi người dùng đóng trình duyệt hay không.
- Ví dụ như chế độ Remember Email & Password trong bài tập sample_app này.
```

**Sự khác nhau giữa cookie và session:**

||Cookie|Session|
|:--|:---|:---|
|Nơi lưu trữ|Cookie được lưu trữ trên trình duyệt của người dùng.|Session không được lưu trữ trong trình duyệt của người dùng.|
|Nơi lưu trữ dữ liệu |Dữ liệu cookie được lưu trữ ở phía máy khách.|Dữ liệu session được lưu trữ ở phía máy chủ.|
|Thời gian tồn tại|Dữ liệu cookie tồn tại cho đến khi hết hạn.|Sau khi đóng trình duyệt sẽ mất thông tin session.|
|Bảo mật|Dữ liệu cookie dễ dàng sửa đổi khi chúng được lưu trữ ở phía khách hàng.|Dữ liệu session không dễ dàng sửa đổi vì chúng được lưu trữ ở phía máy chủ.|
|Lượng data truyền tải|Tất cả các cookie hiện có của website|Chỉ file cookie chứa session id|

<a id="local-stories"><h2>22. Local storage</h2></a>

**Giới thiệu:**
- Được lưu trữ trên trình duyệt của người dùng
- Khả năng lưu trữ vô thời hạn
- Lưu trữ được 5MB dữ liệu
- Không gửi thông tin lên server như Cookie nên bảo mật tốt hơn.
- Dữ liệu có thể chia sẻ giữa các tab, các cửa sổ cùng lúc nếu nó có chung nguồn gốc hay còn gọi là "same origin" (bao gồm 3 thành phần domain/port/protocol).

<a id="session-stories"><h2>23. Session storage</h2></a>

**Giới thiệu:**<br>
**Session Storage** cũng giống như **local Storage**, nhưng chỉ khác về thời gian tồn tại và khả năng chia sẻ dữ liệu giữa các tab:
- Được lưu trữ trên trình duyệt của người dùng
- Tồn tại cho đến khi người dùng đóng tab, đóng trình duyệt.
- Lưu trữ được 5MB dữ liệu
- Dữ liệu không được gửi đi đến server thông qua các request header.
- Dữ liệu chỉ tồn tại trong tab trình duyệt hiện tại, một tab khác dù mở cùng một trang nhưng nó sẽ có bộ nhớ khác.
- Dữ liệu vẫn tồn tại khi tải lại trang
<a id="update-attribute"><h2>24. Update record</h2></a>
<a id="active-record-associations"><h2>25. Active Record Associations</h2></a>
Trong rails, association được hiểu đơn giản là liên kết giữa 2 model với nhau.

**Các loại Associations**

||Associations|Relationship|Description|
|:---|:---|:---|:---|
|1|belongs_to|one-to-one giữa model này với model khác|thuộc về một đối tượng của model khác, *(nếu trong bảng có thiết lập belongs_to, cần có khóa ngoại trong bảng)|
|2|has_one|one-to-one với 1 model khác|1 đối tượng của model này sở hữu 1 đối tượng của model khác|
|3|has_many|one-to-many với 1 model khác|1 đối tượng của model này sở hữu  0 hoặc nhiều đối tượng của model khác|
|4|has_many :through|thường được sử dụng để thiết lập mối quan hệ many-to-many (n-n) giữa 2 model với nhau|đối với loại quan hệ này chúng ta cần tạo ra 1 model thứ 3 ở giữa để trở thành 2 mối quan hệ 1-n|
|5|has_one :through|has_one :through association thiết lập quan hệ one-to-one giữa model này với model khác|Quan hệ này chỉ ra mối quan hệ 1-1 giữa model này với 1 model khác thông qua 1 model thứ 3. |
|6|has_and_belongs_to_many|has_and_belongs_to_many tạo ra một quan hệ n-n trực tiếp mà không có sự can thiệp của 1 model khác|Association này sẽ cần thiết lập ở cả 2 model|

<a id="callback"><h2>26. Callback function, thứ tự callback</h2></a>
<a id="dependent"><h2>27. Dependent</h2></a>
<a id="count-size-length"><h2>28. Count, size, length</h2></a>
<a id="destroy-delete"><h2>29. Destroy và Delete</h2></a>
<a id="deliver_mail"><h2>30. deliver_now vs deliver_later</h2></a>
<a id="update_active_record"><h2>31. update, update_attribute, update_attributes, update_column</h2></a>
<a id="render_redirect"><h2>32. render vs redirect_to</h2></a>
<a id="http_error"><h2>33. HTTP status code</h2></a>
<a id="different_3"><h2>34. save, save! và update_attribute!</h2></a>

<a id="dependentasdsadsd"><h2>3. Dependentassad</h2></a>
