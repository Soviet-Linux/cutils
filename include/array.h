
typedef unsigned char byte;

#define RESERVE 10
#define P_ALLOC 0
#define P_SIZE 4
#define P_TYPE 8
#define P_META 9

#define p_alloced(array) ((int*)(array-(RESERVE-P_ALLOC)))
#define p_length(array) ((int*)(array-(RESERVE-P_SIZE)))
#define p_type(array) ((char*)(array-(RESERVE-P_TYPE)))

#define alloced(array) (*p_alloced(array))
#define length(array) (*p_length(array))
#define type(array) (*p_type(array))

#define freea(array) free(array-(RESERVE))
#define realloca(array,newsize) (realloc(array-(RESERVE),newsize+RESERVE) + (RESERVE))

#define A_TYPE_CHAR 'c'
#define A_TYPE_DOUBLE 'd'
#define A_TYPE_FLOAT 'f'
#define A_TYPE_INT 'i'
#define A_TYPE_LONG 'l'
#define A_TYPE_POINTER 'p'
#define A_TYPE_RAW 'r'
#define A_TYPE_SHORT 's'
#define A_TYPE_UINT 'u'
#define A_TYPE_VOID 'v'
#define A_TYPE_LONGLONG 'x'
#define A_TYPE_ULONGLONG 'y'
#define A_TYPE_ULONG 'z'

int create (byte **array,char atype);
int append(byte** data,byte* app,int a_size);
int show(byte* data);
int extend(byte** array,int newsize);
int copy(byte** data,byte* src,int size);




