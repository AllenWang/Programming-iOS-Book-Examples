

#import "Dog.h"

// example of anonymous category techniques with property declarations
// not identical to what's in the book, but it makes a nice follow-on from previous examples

// name is read-only as far as other classes are concerned, but read-write for us
// we can set name thru property, but other classes can't

// zork is a private property; we can get and set it, other classes can't

@interface Dog ()
@property (nonatomic, readwrite, copy) NSString* name;
@property (nonatomic, copy) NSString* zork;
@end

@implementation Dog
@synthesize name;
@synthesize zork;


- (id) initWithName: (NSString*) s { 
    self = [super init]; 
    if (self) {
        self->name = [s copy];
    }
    return self;
}

- (id) init {
    NSAssert(NO, @"Making a nameless dog is forbidden.");
    return nil;
}

- (void) dummy {
    // just to prove that this compiles okay
    // we can get and set both name and zork
    // actually in this revision I added logging, and an actual call to this method
    id dummy; // just something to assign to, to quiet the compiler (new LLVM / ARC complaint?)
    self.name = @"Zampabalooie";
    dummy = self.name;
    self.zork = @"test";
    NSLog(@"%@", dummy);
    dummy = self.zork;
    NSLog(@"%@", dummy);
}


@end
