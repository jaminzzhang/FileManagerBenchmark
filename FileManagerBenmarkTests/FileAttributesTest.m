//
//  FileAttributesTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/6/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface FileAttributesTest : FileManagerTest

@end

@implementation FileAttributesTest

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

#ifdef TEST_FILE_ATTRIBUTES
- (void)testFileAttributesTest
{
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"data"];
    NSString * path = [self.testPath stringByAppendingPathComponent:@"1.rmvb"];//self.testTempPath;//
    NSDictionary * fileAttributeDic = nil;
//    BOOL successfull = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        NSError * error = nil;
        fileAttributeDic = [self.fileManager attributesOfItemAtPath:path error:&error];
//        NSString * fileType = [fileAttributeDic objectForKey:NSFileType];
//        NSLog(@"%@%@", fileType, fileAttributeDic);
    }

    XCTAssert(nil != fileAttributeDic, @"Get File %@ Failed.", path);
}



#endif

@end
