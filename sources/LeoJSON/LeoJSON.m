#import "LeoJSON.h"
#import "JSONKit.h"

static void LeoJSONSetError(NSString **errorString, NSString *message)
{
    if (errorString != NULL) {
        *errorString = message;
    }
}

static NSString *LeoJSONExceptionMessage(NSString *operation, NSException *exception)
{
    NSString *name = [exception name] ? [exception name] : @"unknown exception";
    NSString *reason = [exception reason] ? [exception reason] : @"no reason";

    return [NSString stringWithFormat:@"LeoJSON: %@ raised %@: %@",
                                      operation,
                                      name,
                                      reason];
}

id LeoJSONObjectFromData(NSData *data,
                         LeoJSONReadOptions options,
                         NSString **errorString)
{
    if (errorString != NULL) {
        *errorString = nil;
    }

    if (data == nil) {
        LeoJSONSetError(errorString, @"LeoJSON: input data is nil");
        return nil;
    }

    if ([data length] == 0) {
        LeoJSONSetError(errorString, @"LeoJSON: input data is empty");
        return nil;
    }

    if (options != LeoJSONReadStrict) {
        LeoJSONSetError(errorString, @"LeoJSON: unsupported read option");
        return nil;
    }

    NSError *jsonKitError = nil;
    id object = nil;

    @try {
        object = [data objectFromJSONDataWithParseOptions:JKParseOptionStrict
                                                    error:&jsonKitError];
    }
    @catch (NSException *exception) {
        LeoJSONSetError(errorString, LeoJSONExceptionMessage(@"JSON parse", exception));
        return nil;
    }

    if (object == nil) {
        NSString *message = @"LeoJSON: JSON parse failed";

        if (jsonKitError != nil) {
            message = [NSString stringWithFormat:@"LeoJSON: JSON parse failed: %@",
                       [jsonKitError description]];
        }

        LeoJSONSetError(errorString, message);
        return nil;
    }

    return object;
}

NSData *LeoJSONDataFromObject(id object,
                              LeoJSONWriteOptions options,
                              NSString **errorString)
{
    if (errorString != NULL) {
        *errorString = nil;
    }

    if (object == nil) {
        LeoJSONSetError(errorString, @"LeoJSON: input object is nil");
        return nil;
    }

    if (options != LeoJSONWriteCompact) {
        LeoJSONSetError(errorString, @"LeoJSON: unsupported write option");
        return nil;
    }

    if (![object respondsToSelector:@selector(JSONData)]) {
        LeoJSONSetError(errorString, @"LeoJSON: object cannot be serialized as JSON");
        return nil;
    }

    NSData *data = nil;

    @try {
        data = [object JSONData];
    }
    @catch (NSException *exception) {
        LeoJSONSetError(errorString, LeoJSONExceptionMessage(@"JSON serialization", exception));
        return nil;
    }

    if (data == nil || [data length] == 0) {
        LeoJSONSetError(errorString, @"LeoJSON: JSON serialization failed");
        return nil;
    }

    return data;
}
