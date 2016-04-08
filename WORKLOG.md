#DONE

# TODO
1. figure out how rails4 load js&css for each controller

# TOFIX
1. account_record/new跳转到account_records界面样式无法加载
2. account_records界面点击流水页面异常

# 20151216
1. 发现导航栏下拉菜单无法点击
  ms本问题无法解决，因为dropdown就是为了下拉
2. 尝试使用bootstrap3-datetimepicker,失败

# 20151226
1. datetimepicker有不同版本，元素的class不一样
2. bootstrap用的是less方式，没有好好看文档，需要注意less的@import
3. 在application.css中require的时候在注释里
4. moment.js引入zh-cn版（在application.js里写死，以后看能不能从config.locale里获取）

# 20151227
1. Rails中时间是UTC时间，比北京晚8个小时,可以用created_at.localtime转化为北京时间（了解其中的工作机制）

# 20151229
1. bootstrap各列宽度不一样，有其他表格插件比如datatable

# 20160103
1. 使用l格式化显示date（也可以显示time，需要配置locale）
2. 发现没有helper来验证decimal的scale和precision

# 20160104
1. 使用HTML5的required和pattern限制用户输入
2. 增加record_type

# 20160107
1. 增加account_record的删除功能
2. 初次使用notice
3. 将工作记录放入github
4. account_record按天展示，并按updated_at排序
 
# 20160114
1. 使用devise gem来处理用户注册、登录等
2. [使用bootstrap展示flash message](https://coderwall.com/p/jzofog/ruby-on-rails-flash-messages-with-bootstrap)

# 20160203
1. 纠正checkbox和radio button的bootstrap样式使用错误

# 20160302
1. 使用belongs_to和has_many将account_record和user关联，并修改相应controller
2. 优化devise创建用户界面

# 20160309
1. 修改record_type的form界面为bootstrap样式
2. 加入paperclip来进行图片上传


# 20160317
1. 完善record_type，增加和user的一对多关系
2. 完成paperclip的图片上传及显示

# 20160406
1. account_record新增界面添加默认日期
2. account_record列表界面增加日期选择

# 20160408
1. nav_bar新增用户登录链接
2. I18n支持完善
