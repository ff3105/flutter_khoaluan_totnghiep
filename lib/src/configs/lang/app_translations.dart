import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/utils.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'vi_VN': viVN,
      };

  final Map<String, String> enUS = {
    'login_title': 'Welcome back',
    'login_desc': 'Log in your account',
    'email': 'Email',
    'password': 'Password',
    'confirm_password': 'Confirm password',
    'login': 'Login',
    'forgot_password': 'Forgot password?',
    'sign_up_title': 'Don\'t have an account?',
    'sign_up': 'Sign up',
    'next': 'Next',
    'finish': 'Finish',
    'register': 'Register',
    'register_name_title': 'What\s your name?',
    'register_name_desc': 'Enter the name you use in real life',
    'register_first_name': 'First name',
    'register_last_name': 'Last name',
    'register_first_last_name_empty': 'Please enter your first and last name',
    'register_email_title': 'What\st your email address?',
    'register_email_desc':
        'Adding an email helps you keep your account secure, contacts and more.',
    'register_email_empty': 'Please enter your email address',
    'register_phone_title': 'Enter your mobile number',
    'register_phone_desc': 'Enter the mobile number where you can be reached.',
    'register_phone': 'Mobile number',
    'register_phone_empty': 'Please enter your phone number',
    'register_gender_title': 'What\st your gender?',
    'register_gender_male': 'Male',
    'register_gender_female': 'Female',
    'register_gender_other': 'Other',
    'register_gender_empty': 'Please choose your gender',
    'register_password_title': 'Choose a password',
    'register_password_desc':
        'Create a password with at least 6 characters. It should be something others couldn\'t guess',
    'register_password_empty':
        'Your password must have at least 6 letters, numbers and symbols',
    'register_password_not_match': 'Your confirm password mush match password',
    'register_finish_title': 'Finish Signing Up',
    'register_finish_desc': ''
        'By tapping Finish, you agree to receive emails,'
        ' promotions and general messages from us. In addition, you also agree to our',
    'register_finish_desc1': 'Terms & Conditions',
    'register_finish_desc2': ' and ',
    'register_finish_desc3': 'Privacy Policy',
    'find_your_account': 'Find your account',
    'enter_your_email': 'Enter your email',
    'incorrect_email': 'Incorrect email type',
    'email_empty': 'Please enter your email',
    'popular': 'Popular',
    'new_arrivals': 'New arrivals',
    'all_furniture': 'All furniture',
    'see_all': 'See all',
    'category': 'Category',
    'user': 'User',
    'favorite': 'Favorite',
    'order': 'My Order',
    'address': 'Address',
    'setting': 'Setting',
    'logout': 'Logout',
    'about': 'About',
    'sold': 'Sold',
    'detail': 'Detail',
    'comment': 'Comment',
    'rating': 'Rating',
    'more_like_this': 'More like this',
    'add_to_cart': 'Add to Cart',
    'dark_mode': 'Dark mode',
    'language': 'Language',
    'english': 'English',
    'vietnamese': 'Vietnamese',
    'choose_language': 'Choose Language',
    'edit_you_profile': 'edit you profile',
    'nothing_to_show': 'Nothing to show',
    'all': 'All',
    'pending': 'Pending',
    'shipping': 'Shipping',
    'completed': 'Completed',
    'cancelled': 'Cancelled',
    'items': 'Items',
    'total': 'Total',
    'order_time': 'Order time',
    'order_detail': 'Order detail',
    'delivery_address': 'Delivery address',
    'order_no': 'Order no.',
    'placed_on': 'Placed on',
    'subtotal': 'Subtotal',
    'shipping_fee': 'Shipping fee',
    'cancel': 'Cancel',
    'new_address': 'New address',
    'city': 'City',
    'set_city': 'Set city',
    'city_null': 'Please select you city',
    'district': 'District',
    'set_district': 'Set district',
    'district_null': 'Please select you district',
    'ward': 'Ward',
    'set_ward': 'Set ward',
    'ward_null': 'Please select you ward',
    'input_null': 'Please check your input',
    'place_order' : 'Place order',
    'checkout' : 'Checkout',
    'cart': 'Cart',
    'added_to_cart_success' : 'Added to cart success',
    'go_to_cart' : 'Go to cart',
    'continue_shopping' : 'Continue shopping',
    'delete': 'Delete',
  };

  final Map<String, String> viVN = {
    'login_title': 'Chào mừng trở lại',
    'login_desc': 'Đăng nhập vào tài khoản của bạn',
    'email': 'Email',
    'password': 'Mật khẩu',
    'confirm_password': 'Xác nhận mật khẩu',
    'login': 'Đăng nhập',
    'forgot_password': 'Quên mật khẩu?',
    'sign_up_title': 'Không có tài khoản? ',
    'sign_up': 'Đăng ký',
    'next': 'Tiếp theo',
    'finish': 'Hoàn thành',
    'register': 'Đăng ký',
    'register_name_title': 'Tên của bạn?',
    'register_name_desc': 'Nhập họ và tên của bạn',
    'register_first_name': 'Họ',
    'register_last_name': 'Tên',
    'register_first_last_name_empty': 'Vui lòng nhập họ và tên',
    'register_email_title': 'Địa chỉ email của bạn?',
    'register_email_desc':
        'Thêm địa chỉ email sẽ giúp tài khoản của bạn bảo mật, liên hệ và hơn thế nữa ',
    'register_email_empty': 'Vui lòng nhập địa chỉ email của bạn',
    'register_phone_title': 'Nhập số của điện thoại của bạn',
    'register_phone_desc':
        'Nhập số điện thoại di động mà chúng tôi có thể liên lạc được.',
    'register_phone': 'Số điện thoại',
    'register_phone_empty': 'Vui lòng kiểm tra lại số điện thoại của bạn',
    'register_gender_title': 'Giới tính của bạn là?',
    'register_gender_male': 'Nam',
    'register_gender_female': 'Nữ',
    'register_gender_other': 'Khác',
    'register_gender_empty': 'Vui lòng chọn giới tính',
    'register_password_title': 'Nhập mật khẩu',
    'register_password_desc': 'Mật khẩu ít nhất 6 kí tự và khó đoán',
    'register_password_empty': 'Mật khẩu ít nhất 6 kí tự, bao gồm số và kí tự',
    'register_password_not_match': 'Your confirm password mush match password',
    'register_finish_title': 'Hoàn thành đăng ký',
    'register_finish_desc':
        'Bằng cách nhấn vào đăng ký, bạn đồng ý nhận email, khuyến mãi và các tin nhắn từ chúng tôi.'
            'Ngoài ra, bạn cũng đồng ý với ',
    'register_finish_desc1': 'Điều khoản và điều kiện',
    'register_finish_desc2': ' và ',
    'register_finish_desc3': 'Chính sách bảo mật',
    'reset_password': 'Lấy lại mật khẩu',
    'reset_password_desc':
        'Chúng tôi sẽ gửi email chứa đường liên kết lấy lại mật, vui lòng kiểm tra email',
    'find_your_account': 'Tìm lại tài khoản',
    'enter_your_email': 'Nhập địa chỉ email',
    'incorrect_email': 'Email sai định dạng',
    'email_empty': 'Email không được để trống',
    'popular': 'Nổi bật',
    'new_arrivals': 'Hàng mới về',
    'all_furniture': 'Tất cả sản phẩm',
    'see_all': 'Tất cả',
    'category': 'Danh mục',
    'user': 'Người dùng',
    'favorite': 'Yêu thích',
    'order': 'Đơn hàng',
    'address': 'Địa chỉ',
    'setting': 'Cài đặt',
    'logout': 'Đăng xuất',
    'about': 'Về ứng dụng',
    'sold': 'Đã bán',
    'detail': 'Chi tiết',
    'comment': 'Bình luận',
    'rating': 'Đánh giá',
    'more_like_this': 'Sản phẩm tương tự',
    'add_to_cart': 'Thêm vào giỏ',
    'dark_mode': 'Chế độ ban đêm',
    'language': 'Ngôn ngữ',
    'english': 'Tiếng Anh',
    'vietnamese': 'Tiếng Việt',
    'choose_language': 'Chọn ngôn ngữ',
    'edit_you_profile': 'sửa thông tin cá nhân',
    'nothing_to_show': 'Dữ liệu trống',
    'all': 'Tất cả',
    'pending': 'Đợi xác nhận',
    'shipping': 'Đang giao',
    'completed': 'Đã giao',
    'cancelled': 'Đã huỷ',
    'items': 'Sản phẩm',
    'total': 'Tổng tiền',
    'order_time': 'Ngày đặt hàng',
    'order_detail': 'Chi tiết đơn hàng',
    'delivery_address': 'Địa chỉ giao hàng',
    'order_no': 'Đơn hàng no.',
    'placed_on': 'Đặt vào',
    'subtotal': 'Tạm tính',
    'shipping_fee': 'Phí ship',
    'cancel': 'Huỷ',
    'new_address': 'Thêm địa chỉ',
    'city': 'Thành phố',
    'set_city': 'Chọn thành phố',
    'city_null': 'Vui lòng chọn thành phố',
    'district': 'Huyện',
    'set_district': 'Chọn huyện',
    'district_null': 'Vui lòng chọn huyện',
    'ward': 'Phường',
    'set_ward': 'Chọn phường',
    'ward_null': 'Vui lòng chọn phường',
    'input_null': 'Vui lòng kiểm tra lại dữ liệu',
    'place_order' : 'Đặt hàng',
    'checkout' : 'Thanh toán',
    'cart': 'Giỏ hàng',
    'added_to_cart_success' : 'Đã thêm sản phẩm vào giỏ',
    'go_to_cart' : 'Tới giỏ hàng',
    'continue_shopping' : 'Tiếp tục mua hàng',
    'delete': 'Xoá',
   };

  static Locale getLocale(Language language) {
    switch (language) {
      case Language.english:
        return const Locale('en', 'US');
        break;
      case Language.vietnamese:
        return const Locale('vi', 'VN');
        break;
    }
    return const Locale('vi', 'VN');
  }
}
