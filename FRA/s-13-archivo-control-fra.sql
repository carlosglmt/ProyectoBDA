--
--@Integrantes: 
--      Morales Téllez Carlos Gamaliel
--      Sanchez Díaz María Beatriz
--@Fecha de creación: 20 de junio de 2020
--@Descripción: 
--        Una copia del archivo de control a FRA

!mkdir /u01/app/oracle/oradata/MOSAproy/disk_3/fast-reco-area/controlfile


create pfile from spfile;

shutdown;

--Mover una copia de un archivo de control a la ubicación de la fra
!mv /u01/app/oracle/oradata/MOSAproy/disk_3/control03.ctl /u01/app/oracle/oradata/MOSAproy/disk_3/fast-reco-area/controlfile

startup nomount;

alter system set control_files ='/u01/app/oracle/oradata/MOSAproy/disk_1/control01.ctl',
'/u01/app/oracle/oradata/MOSAproy/disk_2/control02.ctl',
'/u01/app/oracle/oradata/MOSAproy/disk_3/fast-reco-area/controlfile' scope=spfile;

shutdown immediate;

startup nomount;

alter database mount;

alter database open;
