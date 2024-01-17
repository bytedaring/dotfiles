############################################
# 根据proto文件，生成基本的模板go文件
############################################

temp:='\1_package rpc;import("context";pb "lib\/protos");func (s Server)\1(ctx context.Context, req *pb.\2) (*pb.\3, error) {return \&pb.\3{}, nil}'
    
#根据proto，生成基本内容, 文件名是函数名
@_gen_content file:
    gsed -n '/^\s*rpc/p' {{file}} | gsed -e 's/\s*rpc\s*\(\w\+\)(\(\w\+\))\s*returns\s*(\(\w\+\));/{{temp}}/' |\
    gawk -v FS="_" '{print $2 > $1".go"}'

#驼峰文件名改名为SnakeCase
@_snake:
    for file in `ls *.go`; do \
       mv "$file" "$(echo $file | gsed -r 's/([A-Z])/_\l\1/g' | gsed -r 's/^_//')"; \
    done

#格式化当前目录下所有go文件
@fmt:
    for file in `ls *.go`; do \
        gofmt -w $file; \
    done

#根据proto，生成基本内容, 文件名是函数名SnakeCase格式
@gen file: (_gen_content file) _snake && fmt

#显示文件名
@show_snake file:
    gsed -n '/^\s*rpc/p' {{file}} | gsed -e 's/\s*rpc\s*\(\w\+\)(\(\w\+\))\s*returns\s*(\(\w\+\));/\1/' | gsed -r 's/([A-Z])/_\l\1/g' | gsed -r 's/^_//'

#显示字段
@show_field file:
    gsed -n '/^\s*rpc/p' {{file}} | gsed -e 's/\s*rpc\s*\(\w\+\)(\(\w\+\))\s*returns\s*(\(\w\+\));/\1 \2 \3/' 
