# FirstGit
###RunTime　　class_copyPropertyList　　class_copyIvarList　　class_copyMethodList
## 该工程主要讲述了运用运行时的一些特性来获取类的属性和方法,包含了以下四个方面
*   运行时获取类的properties
*   运行时获取类的ivars
*   运行获取类的instance methods
*   运行时获取类的 class methods

## 运行时获取类的properties  
    //获取类的属性
``- (void)getPropertyList {   
    //属性个数    
    unsigned int count;      
    objc_property_t *properties = class_copyPropertyList([self class], &count); 
   ``   
    ``for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        NSLog(@"***属性名:%@", nameStr);
    }
}`` 
此种方法只能获取类的属性,像:  
    @interface HomeController (){   
        int index;  
        NSString *name1;    
}   
这种方法声明的"index"和"name1"属性是无法获取到的,如果获取该种属性则可使用class_copyIvarList()方法来获取.
## 运行时获取类ivars
这里给出一个类:  
    @interface HomeController (){
    int index;
    NSString *name1;
}

@property (nonatomic, strong) UILabel *msgLbl;

@end
如果要获取"index","name1","msgLbl"这三个名字呢,有一个函数可以办到class_copyIvarList(),详细使用见工程.
## 运行获取类的instance methods  
IOS中每一个类都有一个方法列表,用来保存类的实例方法,实例方法第一次调用完之后,会进行缓存方便下次调用.获取类的实例方法可以用class_copyMethodList()来获取.
## 运行时获取类的 class methods  
每一个类都有一个方法列表保存该类的所有实例方法和其对应的实现,但一个类的类方法则不在这个方法列表中.那么一个类的类方法保存在那里呢?如果通过运行时的一些特性获取这些类方法呢?  
在IOS开发中每一个类其实也是一个对象,既然IOS中每一个类是一个对象,那么它是什么什么类的对象呢?IOS中有一个元类的概念,即每一个类都有一个元类,通过isa指针指向自己的元类;元类也可以继承,NSObject类也有自己的元类,并且NSObject类的元类的isa指针指向它本身(NSObject类的元类).类方法不同于类的实例方法,类方法保存在一个类的元类中,那么如何获取一个类的元类呢?有两种方法:  
* const char * class_name = class_getName([self class]);  
  Class metaClass = objc_getMetaClass(class_name);
* Class metaClass = object_getClass([self class]);  
在获取到一个类的元类之后,我们就可以通过class_copyMethodList()来获取.


