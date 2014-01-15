//
//  WriteFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/12/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface WriteFileTest : FileManagerTest

@property (nonatomic, strong) NSFileHandle * readFileHandle;
@property (nonatomic, strong) NSFileHandle * writeFileHandle;
@property (nonatomic, strong) NSData * contentData;

@end

@implementation WriteFileTest

- (void)setUp
{
    [super setUp];
    NSString * readFilePath = [self.testPath stringByAppendingPathComponent:@"1.rmvb"];
    self.readFileHandle = [NSFileHandle fileHandleForReadingAtPath:readFilePath];

    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Test1M" ofType:@"data"];
    self.contentData = [NSData dataWithContentsOfFile:filePath];
//    NSMutableData * mData = [NSMutableData dataWithData:self.contentData];
//    [mData appendData:self.contentData];
//    self.contentData = [NSData dataWithData:mData];
    self.contentData = [NSData dataWithBytes:self.contentData.bytes length:self.contentData.length/2];

    NSString * wroteFilePath = [self.testPath stringByAppendingPathComponent:@"testWrite.data"];
    [[NSData data] writeToFile:wroteFilePath atomically:NO];
    self.writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:wroteFilePath];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    [self.readFileHandle closeFile];
    [self.writeFileHandle closeFile];
}



#ifdef TEST_FILE_WRITING
- (void)testWriteFile
{
    NSDate * startDate = [NSDate date];
    for (NSInteger i = 0; i < 2000; i++) {
        [self.writeFileHandle seekToEndOfFile];
        [self.writeFileHandle writeData:self.contentData];
    }

    [self.writeFileHandle synchronizeFile];

    NSLog(@"using %f", [[NSDate date] timeIntervalSinceDate:startDate]);
    XCTAssert(YES, @"Test writing file suceessfully!");
}

- (void)testWriteFileWithSyn
{
    for (NSInteger i = 0; i < 1000; i++) {
        [self.writeFileHandle seekToEndOfFile];
        [self.writeFileHandle writeData:self.contentData];
        [self.writeFileHandle synchronizeFile];
    }

    XCTAssert(YES, @"Test writing file suceessfully!");
}


- (void)testSeekFile
{
    unsigned long long offset = 0;
    unsigned long long totalLength = [self.readFileHandle seekToEndOfFile];
    for (NSInteger i = 0; i < 1000000; i++) {
//        NSString * readFilePath = [self.testPath stringByAppendingPathComponent:@"1.rmvb"];
//        self.readFileHandle = [NSFileHandle fileHandleForReadingAtPath:readFilePath];
        offset = random() % totalLength;
        [self.readFileHandle seekToFileOffset:offset];
    }

    XCTAssert(offset > 0, @"Test seeking file at %llu suceessfully!", offset);

}



- (void)testReadFile
{
    unsigned long long offset = 0;
    unsigned long long totalLength = [self.readFileHandle seekToEndOfFile];
    [self.readFileHandle seekToFileOffset:0];
    NSUInteger readCount = 0;
    CGFloat m = 1.0 / 8;
    NSUInteger length = ( m * 1024 * 1024);
    NSUInteger times = 1024 / m;

    for (NSInteger i = 0; i < times && offset < totalLength; i++) {
        @autoreleasepool {
            readCount++;
//            [self.readFileHandle seekToFileOffset:offset];
//            [self.readFileHandle seekToFileOffset:0];
            if (offset + length > totalLength) {
                length = (NSUInteger)(totalLength - offset);
            }
            NSData * data = [self.readFileHandle readDataOfLength:length];
            offset += length;
            //        [self.writeFileHandle writeData:self.contentData];
        }
    }

//    NSLog(@"readCount:%u", readCount);
    XCTAssert(offset == totalLength, @"Test Reading file %llu/%llu at %u times Failed!", offset, totalLength, readCount);

}

#endif
@end
