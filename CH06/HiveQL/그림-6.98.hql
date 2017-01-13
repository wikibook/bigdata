set hive.exec.dynamic.partition=true;  
set hive.exec.dynamic.partition.mode=nonstrict; 

insert overwrite table SmartCar_Drive_Info_2 partition(wrk_date)  
select 
  r_key , 
  date , 
  car_number , 
  speed_pedal , 
  break_pedal , 
  steer_angle , 
  direct_light , 
  speed , 
  area_number ,
  substring(date, 0, 8) as wrk_date
from SmartCar_Drive_Info 
where substring(date, 0, 8) = '${working_day}';