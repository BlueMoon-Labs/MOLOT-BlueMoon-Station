// Дефайны хирургических операций

// пациент должен быть в сознании
#define OPERATION_MUST_BE_PERFORMED_AWAKE	"operation_must_be_performed_awake"
// требуется полная анестезия (пациент спит)
#define OPERATION_NEED_FULL_ANESTHETIC		"operation_need_full_anesthetic"
// знание операций для mind докторов
#define KNOW_MED_SURGERY_OPERATIONS list( \
	/datum/surgery/healing/brute/upgraded, \
	/datum/surgery/healing/burn/upgraded, \
	/datum/surgery/advanced/toxichealing \
	)
