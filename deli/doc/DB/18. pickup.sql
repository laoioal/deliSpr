픽업 장소 관련 테이블

create table pickup (
    name varchar2(10 char) constraint name_pickup_pk primary key,
    address varchar2(30 char)constraint name_pickup_nn not null,
    pickuplat number constraint lat_pickup_nn not null,
    pickuplon number constraint lon_pickup_nn not null
);
   
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('경복궁역','서울 종로구 사직로 지하 130',37.57557082171,126.97330778814);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('광화문우체국','서울 종로구 종로 6',37.570013917406,126.9780542555);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('대방역','서울 영등포구 여의대방로 300',37.513379538688,126.92652335463);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('무악공원','서울 종로구 통일로18길 34',37.576084140052,126.95911825248);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('무악재역','서울 서대문구 통일로 지하 361',37.582561834301,126.95017035418);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('버티고개역','서울 중구 다산로 지하 38',37.547943570723,127.00697726349);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('보라매역','서울 동작구 상도로 지하 2',37.499855465771,126.92060923706);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('사직단','서울 종로구 사직로 89',37.575791319905,126.96870586958);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('삼광초등학교','서울 용산구 두텁바위로1나길 19',37.546646838565,126.9766344795);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서대문역','서울 종로구 통일로 지하 126',37.574379813301,126.95782423784);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서울시청','서울 중구 세종대로 110',37.566205021936,126.97770627907);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('세종문화회관','서울 종로구 세종대로 175',37.572009887822,26.97630706472);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('숙대입구역','서울 용산구 한강대로 지하 306',37.545499859161,126.97216591319);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길5동우체국','서울 영등포구 신길로 65',37.498477701477,126.90806625532);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길역','서울 영등포구 영등포로 327',37.517688232974,126.91427854285);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신풍역','서울 영등포구 신풍로 지하 27',37.50016518673,126.90903453451);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('약수역','서울 중구 다산로 지하 122',37.554124490755,127.01025330126);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('장원중학교','서울 중구 동호로15길 93-34',37.55365335367,127.00627186623);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('정부청사','서울 종로구 세종대로 209',36.4383354,126.9018892);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('후암초등학교','서울 용산구 두텁바위로 140',37.551405239218,126.98159679014);