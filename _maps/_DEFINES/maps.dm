// helpers for modifying jobs, used in various job_changes.dm files
#define MAP_JOB_CHECK if(SSmapping.config.map_name != JOB_MODIFICATION_MAP_NAME) { return; }
#define MAP_JOB_CHECK_BASE if(SSmapping.config.map_name != JOB_MODIFICATION_MAP_NAME) { return ..(); }
#define MAP_REMOVE_JOB(jobpath) /datum/job/##jobpath/map_check() { return (SSmapping.config.map_name != JOB_MODIFICATION_MAP_NAME) && ..() }
