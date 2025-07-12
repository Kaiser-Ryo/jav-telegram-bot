# 一个可被uptime监控的jav tg bot，可以通过raw文件链接自定义静态网页，默认静态网页为Hello world!
docker镜像：`mikehand888/jav-telegram-bot:latest`
## 环境变量
  | 变量名       | 变量内容  |默认值|说明|
  | ------------ | ------   |-----|---|
  |TELEGRAM_TOKEN|你的机器人Token|
  |ALIST_BASE_URL|`https://你的Alist地址`|
  |ALIST_TOKEN|你的AlistToken|
  |ALIST_OFFLINE_DIRS|/你的下载目录|
  |JAV_SEARCH_APIS|`https://api.wwlww.org/v1/avcode/`|
  |ALLOWED_USER_IDS|你的tg id|
  |CLEAN_INTERVAL_MINUTES|间隔多少分钟自动清理文件|60（分钟）|
  |SIZE_THRESHOLD|自动清理小于多少M的文件|100（MB）|
  |PREFERRED_KEYWORDS|-C,-C-,ch,字幕||关键词不区分大小写（如 -C 会匹配 -c 或 -C），如果不需要优先级关键词可留空。|
  |CUSTOM_CATEGORIES|分类1:关键词1,关键词2;分类2:关键词3,关键词4||自定义分类，番号匹配完毕之后匹配自定义分类，可留空。|
  |SYSTEM_FOLDERS|/system/folder1,/system/folder2||这些文件夹在清理过程中将被保护，不会被删除或修改|
  |CLEAN_BATCH_SIZE||500|
  |CLEAN_REQUEST_INTERVAL||0.2|
  |MAX_CONCURRENT_REQUESTS||20|
  |HTML_URL|内容为自定义静态网页的raw文件链接，不填静态网页为Hello world!|
