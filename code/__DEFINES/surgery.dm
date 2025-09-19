/// Priority for sorting the radial operations menu. Lower number = higher position
#define SURGERY_RADIAL_PRIORITY 99

// For healing operations (is_healing = TRUE)
#define SURGERY_RADIAL_PRIORITY_HEAL_BASE_COMBO  0.9    // For Healing damage
#define SURGERY_RADIAL_PRIORITY_HEAL_BASE        1      // For Healing damage
#define SURGERY_RADIAL_PRIORITY_HEAL_EXTRA       1.1    // For Healing secondary damage (like tox)
#define SURGERY_RADIAL_PRIORITY_HEAL_STATIC      2      // For operations, like organ manipulation
#define SURGERY_RADIAL_PRIORITY_HEAL_EMERGENCY   3      // For temporary operations, like revival
#define SURGERY_RADIAL_PRIORITY_HEAL_WOUND       4      // For fix wounds
#define SURGERY_RADIAL_PRIORITY_HEAL_ORGAN       5      // For operations to heal organs
#define SURGERY_RADIAL_PRIORITY_HEAL_ADDITIONAL  6

// For other operations (is_healing = FALSE)
#define SURGERY_RADIAL_PRIORITY_OTHER_FIRST  1
#define SURGERY_RADIAL_PRIORITY_OTHER_SECOND 2
#define SURGERY_RADIAL_PRIORITY_OTHER_THIRD  3
#define SURGERY_RADIAL_PRIORITY_OTHER_FOURTH 4