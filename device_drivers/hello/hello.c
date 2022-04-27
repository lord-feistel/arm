#include <linux/init.h>
#include <linux/module.h>

MODULE_LICENSE("DUAL BSD/GPL");

static int a;
static int b;

static int sum(int __a, int __b)
{
    return (__a + __b);

}


static int hello_init(void)
{

a = 1;
b = 2;

printk(KERN_DEBUG "initial value %d\n", sum(a,b));
a++;
b++;

return 0;
}
static void hello_exit(void)
{
    printk(KERN_DEBUG "initial value %d\n", sum(a,b));
}
module_init(hello_init);
module_exit(hello_exit);


