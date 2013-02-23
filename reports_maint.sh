#! /bin/sh
# puppet-reports-maint
# updated for PE
# /var kept filling up due to the backlog of yaml catalog reports from each PE client 
# we don't need all of these. when /var fills, puppet halts client updates
# 

#days="+14"       # more than 7 days old

#for d in `find /var/opt/lib/pe-puppet/reports -mindepth 1 -maxdepth 1 -type d`
#do
#         find $d -type f -name \*.yaml -mtime $days |
#         sort -r |
#         tail -n +2 |
#         xargs -n50 /bin/rm -f
#done

#exit 0 

#for host in `echo /var/opt/lib/pe-puppet/reports` 
cd /var/opt/lib/pe-puppet/reports/
for host in `ls -1 /var/opt/lib/pe-puppet/reports/` 
do 
    /bin/ls -1 $host/*.yaml | head --lines=-48 | xargs --no-run-if-empty xz -9 
done


