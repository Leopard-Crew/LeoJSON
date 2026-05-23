#import <Foundation/Foundation.h>
#import "LeoJSON.h"

static int fail(NSString *message)
{
    fprintf(stderr, "FAIL: %s\n", [message UTF8String]);
    return 1;
}

int main(int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSString *jsonString =
        @"{"
         "\"name\":\"LeoJSON\","
         "\"mode\":\"dist smoke\","
         "\"unicode\":\"Grüße vom Release-Paket\","
         "\"ok\":true"
        "}";

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

    NSString *errorString = nil;
    id object = LeoJSONObjectFromData(jsonData, LeoJSONReadStrict, &errorString);

    if (object == nil) {
        int result = fail(errorString ? errorString : @"parse failed");
        [pool drain];
        return result;
    }

    NSData *roundtrip = LeoJSONDataFromObject(object, LeoJSONWriteCompact, &errorString);

    if (roundtrip == nil) {
        int result = fail(errorString ? errorString : @"serialization failed");
        [pool drain];
        return result;
    }

    NSString *roundtripString =
        [[NSString alloc] initWithData:roundtrip encoding:NSUTF8StringEncoding];

    printf("OK: LeoJSON dist smoke probe passed\n");
    printf("Roundtrip JSON: %s\n", [roundtripString UTF8String]);

    [roundtripString release];
    [pool drain];

    return 0;
}
