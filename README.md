# Backuper

#### 使用方法  
  
註：原始檔網頁下載可能會變成一行無法使用  
  
0. 新建\[新增文字文件\]  
1. 將代碼複製上去  
2. 另存成*.bat  
3. 右鍵使用管理員開啟  
  
  
#### 其他說明  
步驟已經簡化到只需要執行即可自動備份與還原，  
備份的檔案會出現在軟件的旁邊，請自行保存，  
  
檔案的保存是RAR格式自動加入5%復原紀錄，  
檔案還原也可以手動還原不須仰賴軟件，  
還原路徑會再備份完畢後新增一個文件，  
也會寫入rar檔案內，  

還原時請注意程序旁邊放一個rar就好，  
並沒有防呆自動偵測多個機制，  
不曉得會出什麼事情，注意別改名字，  

還原時由於是採直接覆蓋的，  
怕不小新用舊版的蓋掉新版的，  
故會在這之前做一個備份檔，  
備份檔可以再還原後自行刪除，


打到這裡才想到，我並沒有刪除原本的檔案，  
原本的概念是重灌後還原，所以不會有問題，  
如果是電腦上本來就有檔案了(舊紀錄)，  
想要同步新的聊天紀錄，直接蓋上去，  
有小小的機率可能會出問題(應該是不太會)，  
請到路徑上把Skype資料夾清空，  
有空我在補上這個，  


最後封裝的exe檔案我沒有公布，我有使用SK與LI  
的官方圖示，不曉得這樣有沒有犯法，就不公佈了  


### 遇到的困難

1. Rar指令有些麻煩，當初看了不少文章
2. Rar一開始我是用移動的方式，並執行主檔這方式有些不太妥當
3. Windows含空格檔名的問題，今天處理了好一段時間，路徑都要加""
4. Windwos權限有些奇怪，利用RAR封裝成exe使用AD執行，  
自動解壓自動開啟bat這個bat居然不是最高權限，  
很多動作都被限制，不曉得該怎麼處理，  
我最後是能避開則避開躲過了  
5. 156
