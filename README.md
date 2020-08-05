# 前提
2020年8月3日 GPU miniキャンプ with reedbush用スクリプト
reedbush上でC++ベースのYolov3を実行する為の手順を纏めています。

## 環境設定
## OpenCV3.4.0およびYolov3のインストール
Reedbush上のOpenCVモジュールではYoloに必要なモジュールが足りない為、OpenCVソースコードからビルドをする必要がある
```
$ chmod +x setup.sh
$ ./setup.sh
```
##　Yolov3のジョブ投入
ジョブを投入する。
```
$ chmod +x job.sh
$ qsub job.sh
```
ジョブが投入されたことを確認する
```
$ rbstat 
Reedbush-H scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)
Reedbush-L scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)
Reedbush-U scheduled stop time: 2019/01/29(Tue) 09:00:00 (Remain: 18days 17:20:19)

JOB_ID     JOB_NAME   STATUS  PROJECT    QUEUE           START_DATE       ELAPSE   TOKEN    NODE
1405000    job.sh     RUNNING pz0425     h-debug         01/10 15:39:08   00:00:24 0.1      2
```
