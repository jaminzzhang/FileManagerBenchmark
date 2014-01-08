//
//  RemoveFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface RemoveFileTest : FileManagerTest

@end

@implementation RemoveFileTest

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

#ifdef TEST_REMOVE_FILE
- (void)testRemoveFileTest
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * path = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        NSError * error = nil;
        path = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"mv%d.data", i]];
        successfull = [self.fileManager removeItemAtPath:path error:&error];
//        successfull = [self.fileManager removeItemAtURL:[NSURL URLWithString:path] error:&error];
    }

    XCTAssert(successfull, @"remove File %@ Failed.", path);
}

#endif

@end
