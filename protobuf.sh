readonly PROTO_SRC_DIR="../mks-ex-proto-defs/src/proto/"

for p in `find $PROTO_SRC_DIR -name '*.proto'` 
do
 relative_path=`echo $p | sed "s@$PROTO_SRC_DIR@@g" | sed 's@^/@@'`
 echo "target file is $relative_path"
 protoc --dart_out=grpc:lib/ \
        --proto_path=$PROTO_SRC_DIR $relative_path
done
