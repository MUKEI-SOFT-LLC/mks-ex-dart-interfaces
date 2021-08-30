readonly INTERFACE_SRC_DIR="../mks-ex-proto-interfaces/src/proto/"

for p in `find $INTERFACE_SRC_DIR -name '*.proto'` 
do
 relative_path=`echo $p | sed "s@$INTERFACE_SRC_DIR@@g" | sed 's@^/@@'`
 echo "target file is $relative_path"
 protoc --dart_out=grpc:lib/ \
        --proto_path=$INTERFACE_SRC_DIR $relative_path
done
