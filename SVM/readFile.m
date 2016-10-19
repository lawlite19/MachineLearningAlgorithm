function file_contents= readFile( fileName )
%	读取文件函数
%   返回文件的内容

fid = fopen(fileName);  %打开文件，返回文件描述符
if fid   %如果文件描述符不为0
    file_contents = fscanf(fid,'%c',inf);   %扫描文件内容
    fclose(fid);    %关闭文件
else
    file_contents = '';
    fprintf('打开%s文件出错\n',fileName);
end

