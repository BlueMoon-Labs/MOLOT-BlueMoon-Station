/**
 *  # Anomaly Defines
 *  This file contains defines for the random event anomaly subtypes.
 *
 * 	WARNING: announce must be triggered AFTER anomaly start to prevent multiple issues.
 * 	If you want to make this vice versa - you'll have to overwrite default anomaly event start and announcement procs.
 */

///Time in ticks before the anomaly goes poof/explodes depending on type.
#define ANOMALY_COUNTDOWN_TIMER (99 SECONDS)

/**
 * Nuisance/funny anomalies
 */

///Time in seconds before anomaly spawns
#define ANOMALY_START_MEDIUM_TIME (2 EVENT_SECONDS)
///Time in seconds before anomaly is announced
#define ANOMALY_ANNOUNCE_MEDIUM_TIME (6 EVENT_SECONDS)
///Let them know how far away the anomaly is
#define ANOMALY_ANNOUNCE_MEDIUM_TEXT "сканерах большой дальности. Ожидаемое место соприкосновения:"

/**
 * Chaotic but not harmful anomalies. Give the station a chance to find it on their own.
 */

///Time in seconds before anomaly spawns
#define ANOMALY_START_HARMFUL_TIME (2 EVENT_SECONDS)
///Time in seconds before anomaly is announced
#define ANOMALY_ANNOUNCE_HARMFUL_TIME (30 EVENT_SECONDS)
///Let them know how far away the anomaly is
#define ANOMALY_ANNOUNCE_HARMFUL_TEXT "сканерах средней дальности. Ожидаемое место соприкосновения:"

/**
 * Anomalies that can fuck you up. Give them a bit of warning.
 */

///Time in seconds before anomaly spawns
#define ANOMALY_START_DANGEROUS_TIME (2 EVENT_SECONDS)
///Time in seconds before anomaly is announced
#define ANOMALY_ANNOUNCE_DANGEROUS_TIME (30 EVENT_SECONDS)
///Let them know how far away the anomaly is
#define ANOMALY_ANNOUNCE_DANGEROUS_TEXT "сканерах малой дальности. Ожидаемое место соприкосновения:"

/// Chance of anomalies moving every process tick
#define ANOMALY_MOVECHANCE 45
