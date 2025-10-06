MERGE ExcelTable AS target
USING (
    SELECT
    :Timestamp AS [Timestamp],
    :Availability AS [Availability (%)],
    :Performance AS [Performance (%)],
    :Quality AS [Quality (%)],
    :OEE AS [OEE (%)],
    :ProductionCount AS [Production Count],
    :RejectionCount AS [Rejection Count],
    :Downtime AS [Downtime (min)],
    :IdleTime AS [Idle Time (min)],
    :AvgCycleTime AS [Average Cycle Time (s)],
    :EffectiveCycleTime AS [Effective Cycle Time (s)]
) AS source
ON target.[Timestamp] = source.[Timestamp]
WHEN MATCHED THEN
    UPDATE SET
        [Availability (%)]        = source.[Availability (%)],
        [Performance (%)]         = source.[Performance (%)],
        [Quality (%)]              = source.[Quality (%)],
        [OEE (%)]                  = source.[OEE (%)],
        [Production Count]         = source.[Production Count],
        [Rejection Count]          = source.[Rejection Count],
        [Downtime (min)]           = source.[Downtime (min)],
        [Idle Time (min)]          = source.[Idle Time (min)],
        [Average Cycle Time (s)]   = source.[Average Cycle Time (s)],
        [Effective Cycle Time (s)] = source.[Effective Cycle Time (s)]
WHEN NOT MATCHED THEN
    INSERT (
        [Timestamp], [Availability (%)], [Performance (%)], [Quality (%)], [OEE (%)],
        [Production Count], [Rejection Count], [Downtime (min)], [Idle Time (min)],
        [Average Cycle Time (s)], [Effective Cycle Time (s)]
    )
    VALUES (
        source.[Timestamp], source.[Availability (%)], source.[Performance (%)], source.[Quality (%)], source.[OEE (%)],
        source.[Production Count], source.[Rejection Count], source.[Downtime (min)], source.[Idle Time (min)],
        source.[Average Cycle Time (s)], source.[Effective Cycle Time (s)]
    );