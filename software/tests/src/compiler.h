#ifndef __COMPILER_H
#define __COMPILER_H

#ifdef __GNUC__

#ifndef __aligned
#define __aligned(x) __attribute__ ((aligned (x)))
#endif

#else /* !__GNU_C__ */
#warning "Unknown compiler"

#ifndef
#define __aligned(x)
#endif
#endif

#endif /* __COMPILER_H */
