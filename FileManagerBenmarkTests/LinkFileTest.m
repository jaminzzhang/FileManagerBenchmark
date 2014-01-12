//
//  LinkFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface LinkFileTest : FileManagerTest

@end

@implementation LinkFileTest

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

#ifdef TEST_LINK_FILE
- (void)testHardLinkFile
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * fromPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"Test.data"];
    NSString * toPath = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        NSError * error = nil;
        toPath = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"link%ld.data", (long)i]];
        successfull = [self.fileManager linkItemAtPath:fromPath toPath:toPath error:&error];
    }

    XCTAssert(successfull, @"Link File %@ Failed.", fromPath);
}


- (void)testSymbolicLinkFile
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * fromPath = [self.testPath stringByAppendingPathComponent:@"1.rmvb"];//self.testTempPath;//
    NSString * toPath = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        NSError * error = nil;
        toPath = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"symbolicLink%ld.data", (long)i]];
        successfull = [self.fileManager createSymbolicLinkAtPath:toPath withDestinationPath:fromPath error:&error];
    }

    XCTAssert(successfull, @"Link File %@ Failed.", fromPath);
}




#endif

@end
