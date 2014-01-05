//
//  CopyFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface CopyFileTest : FileManagerTest

@end

@implementation CopyFileTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}



#define TEST_COPY_FILE
#ifdef TEST_COPY_FILE
- (void)testCopyFileTest
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * fromPath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"data"];
    NSString * toPath = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        NSError * error = nil;
        toPath = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"cp%d.data", i]];
        successfull = [self.fileManager copyItemAtPath:fromPath toPath:toPath error:&error];

//        successfull = [self.fileManager copyItemAtURL:[NSURL fileURLWithPath:fromPath]
//                                                toURL:[NSURL fileURLWithPath:toPath]
//                                                error:&error];
    }

    XCTAssert(successfull, @"copy File %@ Failed.", fromPath);
}



#endif

@end
