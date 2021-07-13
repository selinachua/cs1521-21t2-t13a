# struct _enrolment {
#     int stu_id;         // e.g. 5012345
#     char course[9]:     // e.g. "COMP1521"
#     char term[5];       // e.g. "17s2"
#     char grade[3];      // e.g. "HD"
#     double mark;        // e.g. 87.3
# };

	.data
stu_id:
	.space 	4
course:
	.space 	9
term:
	.space 	5
grade:
	.space 	3

	.align 	3
mark:
	.space 	8