--basic information about active processes
SELECT datname, pid, application_name, state, query
FROM pg_stat_activity;

--To Identify long-running transactions
SELECT datname, pid, application_name, state, query, now() - xact_start AS txn_duration
FROM  pg_stat_activity
ORDER BY txn_duration desc;

--To Identify transaction taken more than 1 minute
SELECT datname, pid, application_name, state, query, xact_start
    FROM pg_stat_activity
    WHERE now() - xact_start > '1 min';

-- all database users
select * from pg_stat_activity where current_query not like '<%';
