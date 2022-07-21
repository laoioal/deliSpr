create table pickup (
    name varchar2(10 char) constraint name_pickup_pk primary key,
    address varchar2(30 char)constraint address_pickup_nn not null constraint address_pickup_uk unique,
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

Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서대문역','서울특별시 서대문구 통일로 지하 126',37.56577,126.96665);
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
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('신길3동주민센터','서울특별시 영등포구 신길로41라길 13-8',37.507263,126.9077281);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('우신초등학교','서울특별시 영등포구 신길로 190',37.5092628,126.9117832);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('해군중앙교회','서울특별시 영등포구 신길동 1795-1',37.5047635,126.9163939);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('소공동 주민센터','서울특별시 중구 남대문로1길 31-5',37.5623964,126.9770253);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('서울시립미술관','서울특별시 중구 덕수궁길 61',37.5640625,126.9738125);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('을지로입구역','서울특별시 중구 을지로동 42',37.566065,126.982679);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('명동역','서울특별시 중구 충무로2가',37.5609892,126.9861868);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('후암동우체국','서울특별시 용산구 후암동 22',37.5510955,126.9773096);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('쉐라톤 조선 서울역','서울특별시 용산구 한강대로 366',37.5509795,126.9727511);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('용산고등학교','서울특별시 용산구 두텁바위로 60',37.5509795,126.9727511);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('독립문역','서울특별시 종로구 통일로 지하 247',37.574453,126.957918);
Insert into PICKUP (NAME,ADDRESS,PICKUPLAT,PICKUPLON) values ('약수동 주민센터','서울특별시 중구 다산로 92',37.552549,127.0089535);