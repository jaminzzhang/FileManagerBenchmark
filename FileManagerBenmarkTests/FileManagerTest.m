//
//  FileOPTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import "FileManagerTest.h"

@implementation FileManagerTest


- (void)setUp
{
    [super setUp];

    self.fileManager = [NSFileManager defaultManager];

    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    self.libPath = paths[0];
    self.testPath = [self.libPath stringByAppendingPathComponent:@"Files"];
    self.testTempPath = [self.testPath stringByAppendingPathComponent:@"tmp"];

//    if (![self.fileManager fileExistsAtPath:self.testTempPath]) {
//        NSError * error = nil;
//        [self.fileManager createDirectoryAtPath:self.testTempPath
//                    withIntermediateDirectories:YES
//                                     attributes:nil
//                                          error:&error];
//        if (nil != error) {
//            NSLog(@"Create Directory erorr:%@", error);
//        }
//    }
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


@end
